///////////////MENU BAR////////////////////////////
var menuTools =  SCMenuGroup(nil, "Tools", 10);

var recManager = SCMenuItem(menuTools, "Recording Manager");
var openRecordings = SCMenuItem(menuTools, "Open Recordings");
var openExtensions = SCMenuItem(menuTools, "Open Extensions");

var sep1 = SCMenuSeparator(menuTools, 3); // add a separator

var initMidi = SCMenuItem(menuTools, "Init MIDI Client");
var initGamepad = SCMenuItem(menuTools, "Init Gamepad - Logitec");

var sep2 = SCMenuSeparator(menuTools, 6); // add a separator

var docAutocomplete = SCMenuItem(menuTools, "Turn On Autocomplete");
var countLines = SCMenuItem(menuTools, "Count lines");
var countChars = SCMenuItem(menuTools, "Count characters");

var sep3 = SCMenuSeparator(menuTools, 10); // add a separator

var loadMySynths = SCMenuItem(menuTools, "Load My Synths");

var sep4 = SCMenuSeparator(menuTools, 12); // add a separator

var startHistory = SCMenuItem(menuTools, "Start History");
var stopHistory = SCMenuItem(menuTools, "Stop History");

var sep5 = SCMenuSeparator(menuTools, 15); // add a separator

var gitCommit = SCMenuItem(menuTools, "GIT Commit");
var svnCommit = SCMenuItem(menuTools, "SVN Commit");
var svnUpdate = SCMenuItem(menuTools, "SVN Update");

var sep6 = SCMenuSeparator(menuTools, 19); // add a separator

var eduWindow = SCMenuItem(menuTools, "Layout > EDU");
var normalWindow = SCMenuItem(menuTools, "Layout > DEV");


//////////////ACTIONS//////////////////////////

recManager.action = { RecordingManager.new };
recManager.setShortCut("R", false, false); // CMD+SHIFT+r
openRecordings.action = { ("open" + thisProcess.platform.recordingsDir.quote).unixCmd };
openExtensions.action = { ("open" + Platform.userAppSupportDir.quote).unixCmd };
openExtensions.setShortCut("e", true, true);
//////////////////////////////////////////////
initMidi.action = { MIDIClient.init };
initGamepad.action = {
	var deviceID, spec = "Logitech";
	GeneralHID.buildDeviceList;
	deviceID = GeneralHID.findBy( 1133 );
	~gamepad = GeneralHID.open( deviceID );
	postf("\n\t***\tInitialized % Gamepad Environment >>>gamepad<<<\nuse ~gamepad to access the instance\n", spec);
	GeneralHID.startEventLoop;
	postf("\n>>>Event loop runing: ___%___\n", GeneralHID.eventLoopIsRunning.asString);
	~gamepad.setSpec(spec);
	postf("Spec map setted to: %\nFollowing pseudomethods acces the states and actions:\n", spec);
	~gamepad.spec.map.keys.asList.sort.do{ |key|
		postf("~gamepad['%']\n", key);
	};
};
/////////////////////////////////////////////
docAutocomplete.action = { Document.current.autoComplete; };
countLines.action_({ (Document.current.string.occurrencesOf($\n) + 1).postln; });
countChars.action_({ Document.current.string.size.postln });
loadMySynths.action_({ (Platform.userAppSupportDir +/+ "__SYNTHLIB.scd").load; });
/////////////////////////////////////////////
startHistory.action_({
	History.clear.end;
	History.start;
});
stopHistory.action_({
	History.end;
	History.document;	// you have to manually choose your destination !
});
gitCommit.action_({
	var myGitDir = "~/dev/__git/scprivatepool/";
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

svnCommit.action_({
	var mySvnDir = "~/dev/__svn/sctutorium/";
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

	txt.string_("repository aktualisiert");
	btn.states_([["commit"]]);
	btn.action_({
		runInTerminal(
			"cd " ++ mySvnDir ++ " && " ++
			"svn add **" ++ " && " ++
			"svn ci -m '" ++ txt.string ++ "'"
		);
		win.close;
	});
});
//////////////////////////////////////////////////

eduWindow.action_({
	Document.listener
		.title_("post")
		.bounds_((295@0)@(Window.screenBounds.width@250))
		.font_(Font("Monaco", 16))
		.background_(Color.new(0,0,0.4,1))
		.stringColor_(Color.white)
		.alwaysOnTop_(true);
	Document.postColor_(Color.white);
});

normalWindow.action_({
	Document.listener
		.title_("console")
		.bounds_(
			(Window.screenBounds.width-400 @ 0) @
			(Window.screenBounds.width @ Window.screenBounds.height)
		)
		.font_(Font("Monaco", 9))
		.background_(Color.new(0,0,0,0.96))
		.stringColor_(Color.green)
		.alwaysOnTop_(false);
	Document.postColor_(Color.green);
});

////////////////SERVERS///////////////////////////

svnUpdate.action_({
	var mySvnDir = "~/dev/__svn/sctutorium/";
	runInTerminal( "cd " ++ mySvnDir ++ " && " ++ "svn update" );
});


////////////////SERVERS///////////////////////////
s = Server.default;
Server.default = Server.local;
s.options.memSize_(2**15);

// Server.local.options.device = "aggro";
// Server.internal.options.device = "aggro";
// Server.local.options.device = "MOTU UltraLite";
// Server.internal.options.device = "MOTU UltraLite";
// Server.default.options.numOutputBusChannels=16;
// ServerOptions.new.numOutputBusChannels=20;
//s.recSampleFormat_("int16");

// close the shit
//Server.internal.window.close;
//Server.local.window.close;

// make little ones
//Server.internal.gui(Rect(0,0,270,30));
//Server.local.gui(Rect(270,0,270,30));

// boot
s.boot;

////////////////DEFAULT_ACTIONS///////////////////
Document.listener
	.title_("console")
	.bounds_(
		(Window.screenBounds.width-400 @ 0) @
		(Window.screenBounds.width @ Window.screenBounds.height)
	)
	.font_(Font("Monaco", 9))
	.background_(Color.new(0,0,0,0.96))
	.stringColor_(Color.green)
	.alwaysOnTop_(false);
Document.postColor_(Color.green);

Document.themes.put
(\rukano,
	(
		classColor: Color.new255(53, 74, 187),
		textColor: Color.new255(0, 0, 0),
		stringColor: Color.new255(96, 129, 158),
		commentColor: Color.new255(206, 27, 28),
		symbolColor: Color.new255(57, 154, 20),
		numberColor: Color.new255(157, 80, 65)
	)
);

Document.setTheme(\rukano);

AutoBackup.start;

//ToolsMenu.add(
//	[ 
//	Platform.userAppSupportDir +/+ "startup.rtf",
//	Platform.userAppSupportDir.quote
//	];
//); 

