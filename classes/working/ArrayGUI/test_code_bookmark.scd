(
w = Window.new("I catch keystrokes").front;
w.view.keyDownAction_({ |view, char, modifiers, unicode, keycode|
	[char, modifiers, unicode, keycode].postln;
});

/*

Keys: 0..9
	[ 29, 18, 19, 20, 21, 23, 22, 26, 28, 25 ]

Modifiers:

	ctrl:				262401
	alt:				524576
	cmd:				1048840

	ctrl+alt:			786721
	ctrl+shift:			393475

	cmd+shift:			1179914
	cmd+ctrl:			1310985
	cmd+alt:			1573160

	alt+shift:			655650

	cmd+ctrl:alt:		1835305
	cmd+shift+alt:		1704234
	ctrl+shift+alt:		917795
	
	cmd+ctrl+alt+shift: 1966379

*/

)

(
Document.globalKeyDownAction_({ |v,c,m,u,k|
	
	var numberKeys =  [ 29, 18, 19, 20, 21, 23, 22, 26, 28, 25 ];
	
	// -------------------- ctrl 1..0 ... code replacer + gui
	(m == 262401).if {
	case
		{c == $1}{
			CodeReplacer().interpretReplace;
		}
		{c == $2}{
			ArraySliders(Document.current.selectedString, replaceCode:true);
		}
		{c == $3}{
			ArrayMatrix(Document.current.selectedString, replaceCode:true);
		};
	};
	
	// -------------------- cmd + alt ... go to bookmark #
	(m == 1573160).if {
		numberKeys.do{ |key, number|
			if (k == key) {
				number.postln;
			}
		}
	};
	// -------------------- cmd + ctrl ... place bookamrk #

	(m == 1310985).if {
		numberKeys.do{ |key, number|
			if (k == key) {
				number.postln;
			}
		}
	};

});
)

















