(
var cols=8, min=0, max=1, name="a Pattern", expand=1; // make as args
var rows = 2;
var size = 20;
var width = size * cols;
var height = size * rows * expand;
var bounds = Window.screenBounds;
var window, buttons, sliders, rowLabels, colLabels;

// check and make defaults

window = Window(
	"Sliders for key BLA @ %".format(name),
	Rect((bounds.width/2) - (width/2), (bounds.height/2) - (width/2), width+(size*2), height+size),
	false
).front;

// ROW LABELS
rowLabels = CompositeView(window, Rect(0, 0, 40, height))
	.background_(Color.green(0.5, 0.5));
rows.do{ |i|
	StaticText(rowLabels, Rect(0, (height-size)*i, size*2, size))
		.align_(\center)
		.font_(Font("Monaco", 10))
		.stringColor_(Color.white)
		.string_( ( (i == 0).if { max } { min }	).asString )
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

// SLIDERS

sliders = MultiSliderView(window, Rect(40, 0, width, height))
	.value_(Array.fill(cols, { 0 }))
	.canFocus_(false)
	.valueThumbSize_(0.5)
	.thumbSize_(size-2)
	.gap_(2)
//	.isFilled_(true)
	.action_({ |v|
		v.value.postln
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