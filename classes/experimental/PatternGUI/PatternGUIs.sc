/*

This is just an attempt to make livecoding easier when fooling around wih list patterns
I know it's not well programmed, too much restrictions, etc... but it's for my private use and it approaches the way I would like to change things on the go.
At the moment it only changes the list in some list patterns and the string to array conversion is'nt good either.
It is just the beginning. The idea would be to build grids or sequencers for this lists, and modifythem via gui and then change them back to the pattern.
Experimental, and work in progress...

r

TEST CODE:

// on Pdefs...
Pdef(\x, PmonoArtic(\default, \degree, Pseq([0,2,3,4], inf), \amp, Pseq([1,1,1,1], inf), \dur, 0.25)).play;
Pdef(\x).changeListForKey(\degree, [[4,5,6,7], [0,3,2,4]].choose.postln);
Pdef(\x).makeTextFieldForKey(\degree);
Pdef(\x).makeSlidersForKey(\amp, 16, 0, 1, 0);


// on Pbinds as Node Proxies...
p = ProxySpace.push(s);
~bla.play;
~bla[0]= Pbind(
	\degree, Pseq([0], inf),
	\amp, Pseq([0.1], inf), 
	\dur, Pseq([0.25], inf)
);
~bla.changeListForKey(\degree, (0..7));
~bla.makeTextFieldForKey(\degree);



*/

// Replace list in Pattern

+ Pseq {
	changeList { |list|
		this.list = list;
		^this
	}
	
	makeMatrix {
		"coming soon".error
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

+ Pshuf {
	changeList { |list|
		this.list = list;
		^this
	}	
}

+ Prand {
	changeList { |list|
		this.list = list;
		^this
	}	
}

+ Pxrand {
	changeList { |list|
		this.list = list;
		^this
	}	
}

// Replace from existing Pattern

+ Pattern {
	
	checkForClass {
		(
			( this.class == Pbind ) or:
			( this.class == Pmono ) or:
			( this.class == PmonoArtic )
		).if { ^true } { ^false	}
	}

	checkForPattern {
		(
			( this.class == Pseq ) or:
			( this.class == Pshuf ) or:
			( this.class == Prand ) or:
			( this.class == Pxrand )
		).if { ^true } { ^false	}
	}
	
	changeListForKey { |key, list|
		var keyIndex, pattern;
		( this.checkForClass ).if {
			keyIndex = this.patternpairs.indexOf(key);
			pattern = this.patternpairs[keyIndex+1];
			( pattern.checkForPattern ).if {
				this.patternpairs[keyIndex+1].changeList(list);
			} {
				"Can only change the list of Pseq, Pshuf, Prand and Pxrand at the moment".error;			};
		} {
			"Can only change in Pbind, Pmono, and PmonoArtic".error;		}
	}
	
	makeTextFieldForKey { |key, name("a Pattern")|
		var window, field, default;
		( this.checkForClass ).if {
			( this.checkForPattern ).if {
				default = this.patternpairs[this.patternpairs.indexOf(key) + 1].list.asString;
				window = Window.new("\"%\" @ %".format(key, name), Rect((Window.screenBounds.width/2) - 300, (Window.screenBounds.height/2) - 10, 600,20), false).front;
				window.addFlowLayout((0@0), (0@0));
				field = TextField(window, (window.bounds.width@window.bounds.height));
				field.string_(default[1..default.size-2]);
				field.action_({ |list|
					var array = list.value.split($,).collect{ |num| num.asFloat };
					this.changeListForKey(key, array);
				});
			} {
				"Can only change in Pbind, Pmono, and PmonoArtic".error;			}
		}
	}
	
	makeSlidersForKey { |key, cols, rows, min, max, round, name("a Pattern")|
		var keyIndex, pattern;
		( this.checkForClass ).if {
			keyIndex = this.patternpairs.indexOf(key);
			pattern = this.patternpairs[keyIndex+1];
			( pattern.class == Pseq ).if {
				pattern.makeSliders(key, cols, rows, min, max, round, name);
			} {
				"A sequencer only makes sense with Pseq".error;
			}
		}
	}
}


+ Pdef {
	changeListForKey { |key, list|
		this.source.changeListForKey(key, list)
	}

	makeTextFieldForKey { |key|
		this.source.makeTextFieldForKey(key, "Pdef:" ++ this.key.asString);
	}
	
	makeSlidersForKey { |key, cols=8, rows=2, min=0, max=1, round=0|
		this.source.makeSlidersForKey(key, cols, rows, min, max, round, "Pdef:" ++ this.key.asString)
	}
}

+ NodeProxy {
	changeListForKey { |key, list|
		this.source.changeListForKey(key, list)
	}

	makeTextFieldForKey { |key|
		this.source.makeTextFieldForKey(key, "NodeProxy:" ++ this.key.asString);
	}

	makeSlidersForKey { |key, cols=8, rows=2, min=0, max=1, round=0|
		this.source.makeSlidersForKey(key, cols, rows, min, max, round, "NodeProxy:" ++ this.key.asString)
	}


}





