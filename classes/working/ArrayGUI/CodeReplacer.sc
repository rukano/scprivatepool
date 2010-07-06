/*
A class to keep the position in a document of a certain code executed to be replaced.
By difference with the original document, it prompts for an action
Written to be used with the ArrayGUI class for updating the code from the GUI but can be used in other contexts

TODO:
- test the different methods

Known Issues:
- app crash when replacing at the beginning of a document! be careful!
	* use abs or clip for selection start?

2010 - Juan A. Romero
*/

CodeReplacer {

	var <document;
	var <oldCode, <codePos, <codeSize;
	var <mark;

	*new { |withMark=false|
		^super.new.init(withMark)
	}
	
	init { |withMark|
		// if with mark, it places the mark automatically
		document = Document.current;
		codePos = document.selectionStart;
		codeSize = document.selectionSize;

		// check for ending bracket? --- too lazy now...
		( document.string(document.selectionStart-1) == "[" ).if {
			codePos = codePos - 1;
			codeSize = codeSize + 2;
		};

		oldCode = document.string(codePos, codeSize);
		
		withMark.if { this.placeMark };
		
		^this
	}
	
	replace { |code, promptWhenDiff=true|
		// normale replacing, with checkdiff option
		// if not, it wont replace if the document has changed
		this.docHasChanged.if {
			^this.pr_replace(codePos, codeSize, code)
		} {
			promptWhenDiff.if {
				^this.diffPrompt(code)
			} {
				"Document has changed.\nTry other methods for replacing".warn;
				^this
			}
		};
	}
	
	pr_replace { |pos, size, code|
		// private, just for easiermoding the other methods
		document.string =
			document.string.keep(pos) ++
			code ++
			document.string.drop(pos + size);
		document.syntaxColorize;
		^this
	}
	
	interpretReplace {
		// usually should happen instantly
		// so nor marking or diff checking needed...
		var newCode = oldCode.interpret;
		case
		{ newCode.class == String }	{
			newCode = newCode.asString.quote // put "..."
		}
		{ newCode.class == Array }	{ // if array, check values
			newCode = newCode.collect{ |val|
				case
					{ val.class == Symbol } { "\\"++(val.asString) }
					{ val.class == String } { val.asString.quote }
					{ val }
			}
		}
		{ newCode = newCode.asString }; // default

		newCode = newCode.asString.replace(" ", ""); // replace spaces? if u want
		this.forceReplace(newCode, false);	// must be in the same point!
		document.selectRange(codePos, newCode.size);
		^this
	}
	
	
	placeMark {
		// place a mark with a unique id
		mark = "/*** @@@ " ++ Date.localtime.stamp ++ " @@@ ***/";
		^this.pr_replace(codePos, codeSize, mark);
	}
	
	replaceMark { |code|
		// replace without checking anithing
		// just lookup for the mark and replace
		var markPos = document.string.find(mark);
		var markSize = mark.size;
		^this.pr_replace(markPos, markSize, code);
	}
	
	forceReplace { |code|
		// in case you want to replace in the same place the original code was
		// usually search and replace could be safer
		^this.pr_replace(codePos, codeSize, code)
	}
	
	searchAndReplace { |code|
		// search for the original code string
		// and replaces it with the new code
		// could be annoying if you have similar
		// array or code in your document
		var newPos = document.string.find(oldCode);
		^this.pr_replace(newPos, oldCode.size, code);
	}
	
	documentWithCode { |code|
		// easy mode, makes a document with the new code
		// so you can copy paste it wherever you want
		Document("code", code)
			.front
			.bounds_(Rect(0, Window.screenBounds.height-200, 300, 200))
			.selectRange(0, code.size);
		
		^this
	}
	
	docHasChanged {
		if (document.string(codePos, 5) == oldCode[..5]) // nasty check!
			{ ^false }
			{ ^true }
	}
	
	diffPrompt { |code|
		var docBounds = Rect((Window.screenBounds.width/2) - 200, (Window.screenBounds.height/2)-40, 400, 90);
		var win = Window("Document was changed!", docBounds, false).front;
		win.addFlowLayout((0@0), (0@0));

		StaticText(win, (win.bounds.width@win.bounds.height))
			.string_("\t\t(f) orce replace\n\t\t(s) earch and replace\n\t\t(d) ocument with code")
			.align_(\left)
			.font_(Font("Monaco", 12));

		win.view.keyDownAction_({ |v,c,m,u,k|
			case
			// YES
			{ c == $f }{
				this.forceReplace(code);
				win.close;
			}
			{ c == $s }{
				this.searchAndReplace(code);
				win.close;
			}
			{ c == $d }{
				this.documentWithCode(code);
				win.close;
			}
		});
		
		^win;
	}
}