Logitech : Object {
	classvar <active;
	classvar <loopIsRunning;
	classvar deviceList;
	classvar logitechID;
	classvar logitechDevice;

	*new {
		"initialize class with >>>Logitec.open<<<".postln;
	}
	
	*initClass{
		loopIsRunning = GeneralHID.eventLoopIsRunning;
	}
	
	*init {
		// create bindings
		GeneralHID.buildDeviceList;
		deviceList = GeneralHID.deviceList;
		logitechID = GeneralHID.findBy( 1133 );
		logitechDevice = GeneralHID.open( logitecID );
		loopIsRunning = GeneralHID.eventLoopIsRunning.if;
	}

	*open {
		this.init;
		active = true;
	}

	*close {
		// free busses
		// free responders
		// free actions
		active = false;
	}

	*stop {
		GeneralHID.eventLoopIsRunning.if {
			GeneralHID.stopEventLoop;
			loopIsRunning = false;
		}{
			"Loop is not running".postln;
		};
	}
	
	*start {
		GeneralHID.eventLoopIsRunning.if.not {
			GeneralHID.startEventLoop;
			loopIsRunning = true;
		}{
			"Loop is already running".postln;
		};
	}
	
	// create buses
	// create responders
	// create action lib
	// scaling
}


//GeneralHID.eventLoopIsRunning.if { "bang".postln } { "no bang".postln }