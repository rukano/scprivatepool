(
var cols=8, rows=4, min=0, max=4, name="a Pattern"; // make as args
var size = 20;
var width = size * cols;
var height = size * rows;
var bounds = Window.screenBounds;
var window, buttons, matrix, rowLabels, colLabels;
var step = (max-min)/rows;

// check and make defaults

window = Window(
	"Matrix for key BLA @ %".format(name),
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
			(i.linlin(0, rows, max, min)-1).asString
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
buttons = Array.fill2D(rows, cols, {
	Button(matrix, (size@size))
		.canFocus_(false)
		.states_([
			["", Color.black, Color.white],
			["", Color.black, Color.black]
		])
});


Button(window, Rect(0, window.bounds.height-size, size*2, size))
	.states_([["send", Color.black, Color.white]])
	.canFocus_(false)
	.action_({
		var array = buttons.collect{ |row|
			row.collect{ |col|
				col.value;
			}
		};
		// TODO: get matrix, and put array into columns (events)
		array.postln;
		
	});


// TODO: make: onClose -> replace code string!

)

/*
pseudo usage (in near future)
n.makeMatrixForKey(\key, cols, rows, min, max, name)
*/