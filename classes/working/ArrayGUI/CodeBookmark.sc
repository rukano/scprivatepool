CodeBookmark {
	classvar <stamp;
	
	*initClass {
		stamp = "/* !!! bookmark: % !!! */";
	}
	
	*new { |num|
		Document.current.string_(
			Document.current.string.insert(
				Document.current.selectionStart,
				stamp.format(num);
			)
		);
		^"--- Bookmarked %".postf(num)
	}
	
	*goto { |num|
		Document.current.selectRange(
			Document.current.string.find(stamp.format(num)),
			nil
		);
		^"--- Went to %".postf(num)
	}
	
	*selectBalanced { |num|
		Document.current.selectRange(
			Document.current.string.find(stamp.format(num)),
			nil
		);
		Document.current.balanceParens(inf);
		^"--- Went to % and balanced".postf(num)
	}
	
}