/*

GUI creatin methods

r

*/

+ Pseq {

	makeMatrix { |key, cols=8, rows=8, min=0, max=7, name="a Pattern"|
		var size = 20;
		var width = size * cols;
		var height = size * rows;
		var bounds = Window.screenBounds;
		var window, buttons, matrix, matrixArray, rowLabels, colLabels;
		var step = (max-min)/rows;
		
		// check and make defaults
		window = Window(
			"Matrix for key % @ %".format(key, name),
			Rect((bounds.width/2) - (width/2), (bounds.height/2) - (width/2), width+(size*2), height+size),
			false
		).front;
		
		// ROW LABELS
		rowLabels = CompositeView(window, Rect(0, 0, 40, height))
			.background_(Color.green(0.5, 0.5));
		rowLabels.addFlowLayout((0@0), (0@0));
		rows.do{ |i|
			StaticText(rowLabels, ((size*2)@size))
				.align_(\center)
				.font_(Font("Monaco", 10))
				.stringColor_(Color.white)
				.string_(
					(i.linlin(0, rows-1, max, min)).asString
				)
		};
		
		// COLUMN LABELS
		colLabels = CompositeView(window, Rect(size*2, height, width, size))
			.background_(Color.blue(0.5, 0.5));
		colLabels.addFlowLayout((0@0), (0@0));
		cols.do{ |i|
			StaticText(colLabels, (size@size))
				.align_(\center)
				.font_(Font("Monaco", 10))
				.stringColor_(Color.white)
				.string_(i.asString)
		};
		
		// MATRIX
		matrix = CompositeView(window, Rect(40, 0, width, height))
			.background_(Color.black);
		matrix.addFlowLayout((0@0), (0@0));
		matrixArray = Array.fill(cols, { List.new }); // TODO: look up for defaults
		buttons = Array.fill2D(rows, cols, { |row, col|
			var degree = row.linlin(0, rows-1, max, min);
			Button(matrix, (size@size))
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
		});
		
		// SEND BUTTON
		Button(window, Rect(0, window.bounds.height-size, size*2, size))
			.states_([["send", Color.black, Color.white]])
			.canFocus_(false)
			.action_({
				var eventArray = matrixArray.collect{ |list|
					(list.size != 0).if
						{ list.asArray }
						{ \rest }
				};
				this.changeList(eventArray);
			});

	^window
}
	
	makeSliders { |key, cols, rows, min, max, round, name|
		var size = 20;
		var width = size * cols;
		var height = size * rows;
		var bounds = Window.screenBounds;
		var window, buttons, sliders, rowLabels, colLabels;
		
		// check and make defaults (check for Pseq)
		window = Window(
			"Sliders for key % @ %".format(key, name),
			Rect((bounds.width/2) - (width/2), (bounds.height/2) - (width/2), width+(size*2), height+size),
			false
		).front;
		
		// ROW LABELS
		rowLabels = CompositeView(window, Rect(0, 0, 40, height))
			.background_(Color.green(0.5, 0.5));
		2.do{ |i|
			StaticText(rowLabels, Rect(0, (height-size)*i, size*2, size))
				.align_(\center)
				.font_(Font("Monaco", 9))
				.stringColor_(Color.white)
				.string_( ( (i == 0).if{max}{min} ).asString )
		};
		
		// COLUMN LABELS
		colLabels = CompositeView(window, Rect(size*2, height, width, size))
			.background_(Color.blue(0.5, 0.5));
		colLabels.addFlowLayout((0@0), (0@0));
		cols.do{ |i|
			StaticText(colLabels, (size@size))
				.align_(\center)
				.font_(Font("Monaco", 9))
				.stringColor_(Color.white)
				.string_(i.asString)
		};
		
		// SLIDERS
		sliders = MultiSliderView(window, Rect(40, 0, width, height))
			.value_(Array.fill(cols, { 0 }))	// TODO: check for current list
			.canFocus_(false)
			.valueThumbSize_(0.5)
			.thumbSize_(size-2)
			.gap_(2);

		// SEND BUTTON
		Button(window, Rect(0, window.bounds.height-size, size*2, size))
			.states_([["send", Color.black, Color.white]])
			.font_(Font("Monaco", 9))
			.canFocus_(false)
			.action_({
				this.changeList(sliders.value.linlin(0,1,min,max).round(round))
			});
		// TODO: make: onClose -> replace code string!
		^window
	}
}