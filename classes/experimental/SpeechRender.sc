/*
Little class to render terminal voices into a temp folder (or a given path)
Also can be loaded as buffer. Subclass SpeechBuffer calls the render and loads the buffer automatically
2010
r
*/

SpeechRender {
	
	classvar <>voices, <>defaultVoice;
	classvar <>tempDir, <>tempPrefix;
	
	var <cmd, <filePath;
	
	*initClass {
		voices = ();
		voices.all = [			
			'Agnes', 'Kathy', 'Princess', 'Vicki', 'Victoria',
			'Bruce', 'Fred', 'Junior', 'Ralph', 'Alex',
			'Albert', 'Bad News', 'Bahh', 'Bells', 'Boing', 'Bubbles',
			'Cellos', 'Deranged', 'Good News', 'Hysterical', 'Pipe Organ',
			'Trinoids', 'Whisper', 'Zarvox'
		];
		voices.male = ['Bruce', 'Fred', 'Junior', 'Ralph', 'Alex'];
		voices.female = ['Agnes', 'Kathy', 'Princess', 'Vicki', 'Victoria'];
		voices.others = [
			'Albert', 'Bad News', 'Bahh', 'Bells', 'Boing', 'Bubbles',
			'Cellos', 'Deranged', 'Good News', 'Hysterical', 'Pipe Organ',
			'Trinoids', 'Whisper', 'Zarvox'
		];

		defaultVoice = voices.male[0];
		tempPrefix = "temp_speech_";
		tempDir = thisProcess.platform.recordingsDir +/+ "SpeechRenderings";
		File.exists(tempDir).not.if {
			("mkdir -p " + tempDir).systemCmd;
		};

	}
	
	*new { |string, voice, path, opt|
		^super.new.init(string, voice, path, opt)
	}
	
	*cleanUpDir {
		("rm" + (tempDir.escapeChar($ )) +/+ tempPrefix ++ "*").systemCmd;
	}
	
	init { |string, voice, path, opt|
		// start the command
		cmd = "say";

		// add the voice
		voice.isNil.if { voice = defaultVoice };
		cmd = cmd + "-v" + voice.asString;
		
		// add more options
		opt.isNil.if { opt = "" };
		cmd = cmd + opt;

		// add output file path
		path.isNil.if
			{ filePath = tempDir +/+ tempPrefix ++ Date.localtime.stamp ++ ".aiff" }
			{ filePath = path };
		
		// cmd is ready!!!		
		cmd = cmd + "-o" + (filePath.escapeChar($ )) + string;

		cmd.systemCmd; // works ok? sync for buffer?

		^this
	}
	
	asBuffer { |server|
		server.isNil.if { server = Server.default };
		^Buffer.read(server, filePath)
	}
}

SpeechBuffer : SpeechRender {
	*new { |string, voice, path, opt, server|
		^super.new(string, voice, path, opt).asBuffer(server)
	}
}

