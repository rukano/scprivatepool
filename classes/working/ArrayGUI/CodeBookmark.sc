CodeBookmark {
	classvar <stamp;
	
	*initClass {
		stamp = "\n/* !!! bookmark: % !!! */\n";
	}
	
	*set { |num|
		var doc = Document.current;
		var pos = doc.selectionStart + stamp.size;
		var nStamp = stamp.format(num);
		if (doc.string.find(nStamp).isNil.not) {
			^"there's already a bookmark! delete it manually".warn
		};
		doc.string_(
			doc.string.insert(doc.selectionStart, nStamp)
		);
		doc.selectRange(pos, 0);
		doc.syntaxColorize;
		^nStamp
	}
	
	*goto { |num|
		var doc = Document.current;
		var nStamp = stamp.format(num);
		doc.selectRange(doc.string.find(nStamp) + nStamp.size,0);
		^"\nGOTO: %".postf(nStamp)
	}
	
	*selectBalanced { |num|
		var doc = Document.current;
		var nStamp = stamp.format(num);
		doc.selectRange(doc.string.find(nStamp),0);
		doc.balanceParens(inf);
		^"\nSELECT: %".postf(nStamp)
	}
	
}