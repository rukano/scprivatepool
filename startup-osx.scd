///////////////MENU BAR////////////////////////////
var menuTools =  SCMenuGroup(nil, "Tools");
var menuLC =  SCMenuGroup(menuTools, "LiveCoding");
var menuDirs =  SCMenuGroup(menuTools, "Open Directories");
var menuInit =  SCMenuGroup(menuTools, "Init Stuff");
var menuLayout =  SCMenuGroup(menuTools, "Layout");
var menuXtras =  SCMenuGroup(menuTools, "Xtras");


// SCMenuSeparator(menuTools, 21); // add a separator

SCMenuItem(menuXtras, "Recording Manager")
	.action_({ RecordingManager.new })
	.setShortCut("R", false, false); // CMD+SHIFT+r

SCMenuItem(menuDirs, "Open Recordings")
.action_({ ("open" + thisProcess.platform.recordingsDir.quote).unixCmd });

SCMenuItem(menuDirs, "Open Extensions")
.action_({ ("open" + Platform.userAppSupportDir.quote).unixCmd })
.setShortCut("e", true, true);

SCMenuItem(menuDirs, "Open My Synths")
.action_({ Document.open(Platform.userAppSupportDir +/+ "synths.scd") })
.setShortCut("s", true, true);


SCMenuItem(menuInit, "Init MIDI Client")
.action_({ MIDIClient.init });

SCMenuItem(menuInit, "Init Gamepad - Logitech")
.action_({
	var deviceID, spec = "Logitech";
	GeneralHID.buildDeviceList;
	deviceID = GeneralHID.findBy( 1133 );
	g = GeneralHID.open( deviceID );
	postf("\n\t***\tInitialized % Gamepad Environment >>>gamepad<<<\nuse ~gamepad to access the instance\n", spec);
	GeneralHID.startEventLoop;
	postf("\n>>>Event loop runing: ___%___\n", GeneralHID.eventLoopIsRunning.asString);
	g.setSpec(spec);
	postf("Spec map setted to: %\nFollowing pseudomethods acces the states and actions:\n", spec);
	g.spec.map.keys.asList.sort.do{ |key|
		postf("g['%']\n", key);
	};
});

SCMenuItem(menuInit, "Announce OSC")
.action_({
	"open -a AnnounceOSC.app".unixCmd;
	"If you don't have AnnounceOSC.app you have to download it from:".postln;
	"http://cloud.github.com/downloads/cappelnord/AnnounceOSC/AnnounceOSCMacApp.zip".postln;
	"and put it in your applications folder".postln;
	"";
});


SCMenuItem(menuXtras, "Maximise current Document")
.action_({ Document.current.bounds_(Rect(0,62,Window.screenBounds.width-400,Window.screenBounds.height-62)) })
.setShortCut("m", true, true); // CMD+ALT+CTR+m

SCMenuItem(menuXtras, "Count lines")
.action_({ (Document.current.string.occurrencesOf($\n) + 1).postln; });

SCMenuItem(menuXtras, "Count characters")
.action_({ Document.current.string.size.postln });


SCMenuItem(menuTools, "REBOOT!")
.action_({ Server.default.reboot })
.setShortCut("k", true, true); // CMD+SHIFT+r


SCMenuItem(menuLC, "ProxySpace push")
.action_({
	p = ProxySpace.push(s.boot);
	"ProxySpace pushed on default server".postln;
	fork{
		1.wait;
		~out.play;	"~out.ar is playing".postln;
		~snd.ar(2);	"~snd.ar is initialized (.ar) 2 channels".postln;
	};
})
.setShortCut("p", true, false); // CMD+SHIFT+r

SCMenuItem(menuLC, "Start History")
.action_({
	History.clear.end;
	History.start;
})
.setShortCut("h", true, true);

SCMenuItem(menuLC, "Stop History")
.action_({
	History.end;
	History.document;
})
.setShortCut("H", true, true);

SCMenuItem(menuLC, "Mandel Shout")
.action_({
	MandelClock.instance.notNil.if {
		MandelClock.instance.shoutWindow;
	} {
		"There is no MandeClock Instance".error;
	};
})
.setShortCut("1", false, false);


SCMenuItem(menuLayout, "Layout > EDU")
.action_({
	Document.listener
		.title_("post")
		.bounds_((0@20)@(Window.screenBounds.width@250))
		.font_(Font("Inconsolata", 22))
		.background_(Color.new(0,0,0.4,1))
		.stringColor_(Color.white)
		.alwaysOnTop_(true);
	Document.postColor_(Color.white);
});

SCMenuItem(menuLayout, "Layout > DEV")
.action_({
	Document.listener
		.title_("console")
		.bounds_(
			(Window.screenBounds.width-400 @ 0) @
			(Window.screenBounds.width @ Window.screenBounds.height)
		)
		.font_(Font("Inconsolata", 14))
		.background_(Color.new(0,0,0,0.96))
		.stringColor_(Color.green)
		.alwaysOnTop_(false);
	Document.postColor_(Color.green);
});

SCMenuItem(menuLayout, "Layout > LC")
.action_({
	s.scope.window.bounds_(Rect(Window.screenBounds.width - 356, Window.screenBounds.height - 223, 223, 230));
	s.meter;
	Document.listener
		.bounds_(Rect(Window.screenBounds.width-355, 226, 355, 400))
		.alwaysOnTop_(true)
		.unfocusedFront;
	Document.current.bounds_(
		Rect(0, Window.screenBounds.height, Window.screenBounds.width-360, Window.screenBounds.height-250)
	);
	p.isNil.if
		{ "No proxy space found in 'p'".warn }
		{ ProxyMixer(p, 6, bounds: Rect(0, 40, 1094, 156)).switchSize(2) };
	m.isNil.if
		{ "No MandelClock found in 'm'".warn }
		{ m.gui(1094@40) };
	
	// mandelbrot clock gui
	// another widgets on the right?
})
.setShortCut("p", true, true);

SCMenuItem(menuTools, "Interpret All")
.action_({
	var selectionStart = Document.current.selectionStart;
	var selectionSize  = Document.current.selectionSize;
	Document.current.balanceParens(inf).selectedString.interpret;
	Document.current.selectRange(selectionStart, selectionSize);
})
.setShortCut("x", false, true);

SCMenuItem(menuTools, "Balance All")
.action_({
	Document.current.balanceParens(inf);
})
.setShortCut("X", false, true);

SCMenuSeparator(menuTools, 5); // add a separator
SCMenuSeparator(menuTools, 9); // add a separator

SCMenuItem(menuTools, "Search Documentation")
.action_({
	var w = Window.new("  ???   ", Rect(500, 500, 150, 30), false).front;
	TextField(w, Rect(10, 5, 130, 16))
		.focus(true)
		.action_({ |view|
			view.string.openHelpFile;
			w.close;
		});
})
.setShortCut("o", true, false);

SCMenuItem(menuTools, "Interpret Box")
.action_({
	var w = Window.new(">>> interpret <<<", Rect(500, 500, 300, 30), false).front;
	TextField(w, Rect(10, 5, 280, 16))
		.focus(true)
		.action_({ |view|
			view.string.interpret;
			w.close;
		});
})
.setShortCut("i", true, false);

////////////////DEFAULT_ACTIONS///////////////////
Document.listener
	.title_("console")
	.bounds_(
		(Window.screenBounds.width-400 @ 0) @
		(Window.screenBounds.width @ Window.screenBounds.height)
	)
	.font_(Font("Inconsolata", 14))
	.background_(Color.new(0,0,0,0.85))
	.stringColor_(Color.green)
	.alwaysOnTop_(false);
Document.postColor_(Color.green);

CocoaDocument.defaultFont_(Font("Inconsolata", 16));

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

// load macros!!!
"*****************************".postln;
"Loading Macro Expander Commands...".postln;
"~/dev/__git/scprivatepool/macros.scd".standardizePath.load;
"Macro Expander Commands LOADED!".postln;
"*****************************".postln;

// make me Shortcuts!
// TODO: load a file with all shortcuts and make a menu item for it!
(
Document.globalKeyDownAction_({ |v,c,m,u,k|
	// -------------------- ctrl
	(m == 262401).if {
	case
		{c == $1}{
			CodeReplacer().interpretReplace;
		}
		{c == $2}{
			ArraySliders(Document.current.selectedString, replaceCode:true);
		}
		{c == $3}{
			ArrayMatrix(Document.current.selectedString, replaceCode:true);
		};
	};
	// -------------------- alt
	// -------------------- cmd
	// -------------------- shift
	// -------------------- cmd + alt
	// -------------------- cmd + ctrl
	// -------------------- cmd + shift + alt
	// -------------------- ctrl + alt
	// -------------------- ctrl + shift + alt

});
);

// why has to be defered???
{ GUI.skin.at(\plot).put(\gridFont, Font("Inconsolata", 10)) }.defer(1);


////////////////SERVERS///////////////////////////
Server.default = Server.internal;
s = Server.default;
s.options.memSize_(2**15);

//Server.local.options.device = "MOTU UltraLite";
//Server.internal.options.device = "MOTU UltraLite";

Server.default.options.numOutputBusChannels = 2;
Server.default.options.numInputBusChannels = 2;

// s.recSampleFormat_("int16");

s.boot;
