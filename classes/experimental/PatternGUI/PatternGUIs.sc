/*

This is just an attempt to make livecoding easier when fooling around wih list patterns
I know it's not well programmed, too much restrictions, etc... but it's for my private use and it approaches the way I would like to change things on the go.
At the moment it only changes the list in some list patterns and the string to array conversion is'nt good either.
It is just the beginning. The idea would be to build grids or sequencers for this lists, and modifythem via gui and then change them back to the pattern.
Experimental, and work in progress...

r

TEST CODE:

// on Pdefs...
Pdef(\x, PmonoArtic(\default, \degree, Pseq([0,2,3,4], inf), \dur, 0.25)).play;
Pdef(\x).changeListForKey(\degree, [[4,5,6,7], [0,3,2,4]].choose.postln);
Pdef(\x).changeListWithTextField(\degree);

// on Pbinds as Node Proxies...
p = ProxySpace.push(s);
~bla.play;
~bla[0]= Pbind(
	\degree, Pseq([0], inf),
	\amp, Pseq([0.1], inf), 
	\dur, Pseq([0.25], inf)
);
~bla.changeListForKey(\degree, (0..7));
~bla.changeListWithTextField(\degree);



*/

// Replace list in Pattern

+ Pseq {
	changeList { |list|
		this.list = list;
		^this
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
	
	changeListWithTextField { |key, name("a Pattern")|
		( this.checkForClass ).if {
			var window, field, default;
			( this.checkForClass ).if {
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
}


+ Pdef {
	changeListForKey { |key, list|
		this.source.changeListForKey(key, list)
	}

	changeListWithTextField { |key|
		this.source.changeListWithTextField(key, "Pdef:" ++ this.key.asString);
	}
}

+ NodeProxy {
	changeListForKey { |key, list|
		this.source.changeListForKey(key, list)
	}

	changeListWithTextField { |key|
		this.source.changeListWithTextField(key, "NodeProxy:" ++ this.key.asString);
	}
}





