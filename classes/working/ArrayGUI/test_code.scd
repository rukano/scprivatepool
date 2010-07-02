// hot keys... 
// dont try to replace code at the beginning of a doc
// app crashes...

Document.globalKeyDownAction_({ |v,c,m,u,k|
	(m == 262401).if {
	case
		{c == $3}{
			CodeReplacer().interpretReplace;
		}
		{c == $1}{
			a = ArraySliders(Document.current.selectedString, replaceCode:true);
		}
		{c == $2}{
			a = ArrayMatrix(Document.current.selectedString, replaceCode:true);
		};
	}
});



a = CodeReplacer.new
a.replace("hello")

ArrayMatrix([1,2,3,\,3,2,9,5,6,4,4,3,5], 16, 8, [0, 7])
ArraySliders([1,2,3,4,3,2,2,3], 16)