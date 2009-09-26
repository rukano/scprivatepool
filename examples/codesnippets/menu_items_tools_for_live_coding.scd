var startHistory = SCMenuItem(menuTools, "Start History");
var stopHistory = SCMenuItem(menuTools, "Stop History");
var gitCommit = SCMenuItem(menuTools, "Git Commit");

startHistory.action_({
	History.clear.end;
	History.start;
});

stopHistory.action_({
	History.end;
	History.document;	// you have to manually choose your destination !
});

gitCommit.action_({
	var myGitDir = "~/scwork/history/logs/";	// or whatever folder you have your repo
	var win = Window("commit msg",
		Rect(
			(Window.screenBounds.width/2)-200,
			(Window.screenBounds.height/2)-35,
			400,
			70
		)
	).front;
	var txt = TextField(win, Rect(10, 10, 380, 20));
	var btn = Button(win, Rect(150, 40, 100, 20));

	txt.string_("updated my sc repository with new code");
	btn.states_([["commit"]]);
	btn.action_({
		runInTerminal(
			"cd " ++ myGitDir ++ " && " ++
			"git add ." ++ " && " ++
			"git commit -am '" ++ txt.string ++ "' && " ++
			"git push"
		);
		win.close;
	});
});
