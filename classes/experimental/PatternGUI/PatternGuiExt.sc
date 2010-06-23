/*

Extensions for Pbind, Pdef & NodeProxy with Patterns

TEST:

Pdef(\s, Pbind(\degree, Pseq([0], inf))).play
Pdef(\s).makeMatrixForKey(\degree)
Pdef(\s).makeSlidersForKey(\degree)

r

*/

+ Pattern {

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
	
	makeMatrixForKey { |key, cols, rows, min, max, name("a Pattern")|
		var keyIndex, pattern;
		( this.checkForClass ).if {
			keyIndex = this.patternpairs.indexOf(key);
			pattern = this.patternpairs[keyIndex+1];
			( pattern.class == Pseq ).if {
				pattern.makeMatrix(key, cols, rows, min, max, name);
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
		this.source.makeTextFieldForKey(key, "Pdef(" ++ this.key.asString ++ ")");
	}
	
	makeSlidersForKey { |key, cols=16, rows=2, min=0, max=1, round=0.001|
		this.source.makeSlidersForKey(key, cols, rows, min, max, round, "Pdef(" ++ this.key.asString ++ ")")
	}

	makeMatrixForKey { |key, cols=16, rows=8, min=0, max=7|
		this.source.makeMatrixForKey(key, cols, rows, min, max, "Pdef(" ++ this.key.asString ++ ")")
	}

}

+ NodeProxy {
	changeListForKey { |key, list|
		this.source.changeListForKey(key, list)
	}

	makeTextFieldForKey { |key|
		this.source.makeTextFieldForKey(key, "NodeProxy(" ++ this.key.asString ++ ")");
	}

	makeSlidersForKey { |key, cols=16, rows=2, min=0, max=1, round=0.001|
		this.source.makeSlidersForKey(key, cols, rows, min, max, round, "NodeProxy(" ++ this.key.asString ++ ")")
	}
	
	makeMatrixForKey { |key, cols=16, rows=8, min=0, max=7|
		this.source.makeMatrixForKey(key, cols, rows, min, max, "NodeProxy(" ++ this.key.asString ++ ")")
	}
}