/*
A set of classes for creating guis out of arrays
They are to produce code and or bind to a ListPattern player and edit the list from the gui
Still has to be cleaned up and it's highly experimental

2010 - Juan A. Romero

TODOs:
- bind to pattern
- write pattern extensions
- activate code replacer on close (for all?)
- how to get string from subclass in superclass method?
- initClass with some shortcuts
- prompt or specs and gui stuff
*/

ArrayGUI {

	classvar <all, <currentID; // maybe for book keeping?

	// GUI stuff
	var <window, <rowLabelsView, <colLabelsView, <valuesView;
	var <mainButton, <buttonType, <>buttonAction;
	var <rowLabels, <colLabels;	// arrays editable from subclasses

	// measures
	var <cols, <rows, <spec;
	var <size, <width, <height;
	var <maxval, <minval;

	// array stuff
	var <originalArray, <internalArray, <hasBrackets;

	// main GUI
	var <guiValues; // subclasses use this for the main gui
					// can be a GUI instance (multislider)
					// or an array of GUI instances (matrix)
	// xtras
	var <codeReplacer, <stringArray, <pattern, <>onClose;

	*new { |array, cols, rows, spec, pattern, document, replaceCode=false|
		^super.new.initDefaults(array, cols, rows, spec, pattern, document).makeGUI(replaceCode)
	}
	
	*initClass {
		all = ();
		currentID = 0;
	}

	initDefaults { |array, a_cols, a_rows, a_spec, a_pattern, document|

		// make array usable if it is a string
		// code replacer makes this good, but its document bounded
		// this should be a normal string, not a document.string
		// hence, easy bracket check w/o checking te previous brackets
		if( array.class == String ) {
			(array[0].isDecDigit and: (array.contains("!").not)).if {
				// for arrays w/o brackets
				array = ("[" ++ array ++ "]").interpret;
				hasBrackets = false;
			}{
				// all other kind of arrays and shortcuts will be interpreted
				array = array.interpret;
				hasBrackets = true;
			}
		};

		originalArray = array;

		// important defaults
		a_cols.isNil.if
			{ cols = array.size }
			{ cols = a_cols };

		a_rows.isNil.if
			{ rows = 2 }
			{ rows = a_rows };
		
		a_spec.isNil.if {
			case
				{ (array.maxItem > 1) and: (array.minItem > 0) } { maxval = array.maxItem; minval = 0; }
				{ (array.maxItem < 1) and: (array.minItem < 0) } { minval = array.minItem; maxval = 1; }
				{ (array.maxItem > 1) and: (array.minItem < 0) } { minval = array.minItem; maxval = array.maxItem; }
				{ minval = 0; maxval = 1 };
			spec = ControlSpec(minval, maxval, \lin, 0.01)
		} {
			( (a_spec.class == Symbol) or: (a_spec.class == Array) ).if
				{ a_spec = a_spec.asSpec };
			spec = a_spec;
		};
		
		// expand array for the internal
		// more slider type, but shuld work for other types...
		( originalArray.size > cols ).if {
			internalArray = originalArray.keep(cols);
		} {
			internalArray = originalArray ++ 0.dup(cols - originalArray.size)
		};

		// xtras
		a_pattern.notNil.if {
			// bind to  pattern (list)
			pattern = a_pattern;
			buttonType = \send;
		} {
			buttonType = \doc;
		};

		codeReplacer = CodeReplacer.new;		

		// now make the dummy GUI
		size = 20;
		width = size * cols;
		height = size * rows;
		
		^this;
	}
	
	makeGUI { |replaceCode|
		var screen = Window.screenBounds.extent;

			// window
		window = Window("GUI", Rect((screen.x/2)-(width/2),(screen.y/2)-(width/2),width+(size*2),height+size),false).front;
			// row view
		rowLabelsView = CompositeView(window, Rect(0, 0, size*2, height))
			.background_(Color.green(0.5, 0.5));
		rowLabelsView.addFlowLayout((0@0), (0@0));
			// col view
		colLabelsView = CompositeView(window, Rect(size*2, height, width, size))
			.background_(Color.blue(0.5, 0.5));
		colLabelsView.addFlowLayout((0@0), (0@0));
			// values view (here comes the main gui fun)
			// content is subclass responsability
		valuesView = CompositeView(window, Rect(size*2, 0, width, height))
			.background_(Color.white);
		valuesView.addFlowLayout((0@0), (0@0));

		// button
		case
			{ buttonType == \doc }	{ buttonAction = {this.makeDoc(this.endCode)} }
			{ buttonType == \send }	{ buttonAction = {"TODO: have to bind me to a pattern".warn} };

		mainButton = Button(window, Rect(0, height, size*2, size))
			.states_([[buttonType, Color.black, Color.white]])
			.font_(Font("Monaco", 9))
			.canFocus_(false)
			.action_(buttonAction);

		this.makeDefaultLabels;	// fill the labels

		replaceCode.if {
			onClose = { codeReplacer.replace(this.endCode, true) };		} {
			onClose = { this.makeDoc(this.endCode) };
		};

		window.onClose_(onClose);

		^this
	}
	
	makeDefaultLabels {
		rowLabels = (0..rows-1).collect { |i|
			StaticText(rowLabelsView, ((size*2)@size))
				.string_(
					((i/(rows-1)).linlin(0, 1, spec.maxval, spec.minval).round(0.1)).asString
//					spec.map(abs(1-(i/(rows-1)))).asString
				)
		};

		colLabels = (0..cols-1).collect { |i|
			StaticText(colLabelsView, (size@size))
				.string_(i.asString)
		};
		
		[colLabels, rowLabels].do { |array|
			array.do { |item|
				item
				.align_(\center)
				.font_(Font("Monaco", 9))
				.stringColor_(Color.white)

			}
		}
	}
	
	makeDoc { |string|
		^Document("Array code from gui", string)
			.bounds_(Rect(0, Window.screenBounds.height - 100, 400, 100))
	}
	
	endCode {
		// calls code, subclass responsability
		// it should get an array as string fo format it w/o spaces
		^this.codeString.replace(" ", "")
	}
}

ArraySliders : ArrayGUI {
	
	*new { |array, cols, rows, spec, pattern, document, replaceCode|
		^super.new(array, cols, rows, spec, pattern, document, replaceCode).init
	}
	
	init {
		window.name_("sliders");
		guiValues = MultiSliderView(window, Rect(size*2, 0, width, height))
			.value_(internalArray.collect(spec.unmap(_))) // map to 0..1 have to unmap for the code!!!
			.canFocus_(false)
			.valueThumbSize_(0.5)
			.thumbSize_(size-2)
			.gap_(2);
		^this
	}
	
	code {
		internalArray = guiValues.value.collect(spec.map(_));
		^internalArray
	}
	
	codeString {
		^this.code.asString
	}
}

ArrayMatrix : ArrayGUI {
	
	var <matrixArray;

	*new { |array, cols=16, rows=8, spec, pattern, document, replaceCode|
		spec.isNil.if { spec = ControlSpec(0, 8, \lin, 1) };
		^super.new(array, cols, rows, spec, pattern, document, replaceCode).init
	}
	
	init {
		// important stuff first
		( originalArray.size > cols ).if
			{ internalArray = originalArray.keep(cols) }
			{ internalArray = originalArray };

		window.name_("matrix");
		matrixArray = Array.fill(cols, { List.new }); // TODO: look up for defaults
		guiValues = Array.fill2D(cols, rows, nil);
		rows.do { |row|
			var degree = spec.map(abs(1-(row/(rows-1))));
//			var degree = row.linlin(0, rows-1, spec.maxval, spec.minval);
			cols.do { |col|
				guiValues[col][row] = Button(valuesView, (size@size))
					.canFocus_(false)
					.states_([
						["", Color.black, Color.white],
						["", Color.black, Color.black]
					])
					.action_({ |v|
						v.value.booleanValue.if
							{ matrixArray[col].add(degree) }
							{ matrixArray[col].remove(degree) }
					})
			}
		};
		rowLabels.do { |rowLabel, i|
				rowLabel.string_(
					((i/(rows-1)).linlin(0, 1, spec.maxval-1, spec.minval).round(0.1)).asString
//					spec.map(abs(1-(i/(rows-1)))).asString
				)
		};

		// set defaults from internal array
		internalArray.do{ |item, i|
			( item.size == 0 ).if
				{ this.mapDegreeToButton(item, i) }
				{ item.do { |value| this.mapDegreeToButton(value, i) } };
		};

		^this
	}

	mapDegreeToButton { |degree, col|
		( degree.class != Symbol ).if {
			( (degree <= spec.maxval) and: (degree >= spec.minval) ).if {
				guiValues[col][degree.linlin(spec.minval, spec.maxval, rows-1, 0).round].valueAction_(1);
			} {
				// this sould not happen!
				// only if the user is a noob and give spec he doesnt respect
				"Value: % is out of min/max range and has been ignored".format(degree).warn;
			};
		};
	}

	code {
		internalArray = matrixArray.collect{ |list|
			(list.size == 0).if
				{ \r }
				{ (list.size == 1).if { list.first } { list.asArray } };
		};
		^internalArray
	}
	
	codeString {
		^this.code.asString.replace("r", "\\r");
	}

}

