// -------------------------------------------- //
// --- DEFAULT STARTUP!!!
// -------------------------------------------- //

QuarkSVNRepository.svnpath_("/usr/bin/svn");

// SwingOSC

//SwingOptions.default.javaOptions = SwingOptions.default.javaOptions + "-Xdock:icon=/Users/rukano/dev/SwingOSC/application.icns";
SwingOSC.program = "/Users/rukano/dev/SwingOSC/build/SwingOSC.jar";
g = SwingOSC.default;

// GUI.qt;

// Split startups Emacs vs. SC.app

if ( thisProcess.platform.hasFeature( \emacs ) ) {
	// -------------------------------------------- //
	// --- EMACS STARTUP!!!
	// -------------------------------------------- //

	"****************************************".postln;
	"sclang in emacs started: you are a geek!".postln;
	"****************************************".postln;
	
	GUI.swing;
	g.boot;


	("~/dev/__git/scprivatepool/startup-emacs.scd".standardizePath).load;

} {
	// -------------------------------------------- //
	// --- SCAPP STARTUP!!!
	// -------------------------------------------- //
	"****************************************".postln;
	"normal scapp started. lame...".postln;
	"****************************************".postln;

	("~/dev/__git/scprivatepool/startup-osx.scd".standardizePath).load;

};