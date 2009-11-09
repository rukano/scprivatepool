BCR2000 : Object {
	classvar <active = false;
	classvar <>midiID;
	classvar maxCC = 104;

	classvar <responders;

	classvar <bus;
	classvar busResponders;

	classvar <debug;
	classvar debugResponders;

	classvar <oscActive;
	classvar oscResponders;
	
	// TODO:  .kr as bus
	// TODO:  OSC sender
	// TODO:  SCALING???
	// TODO:  MIDIOUT !!!
	
	*new { |aBus|
		if(active && bus.isNil.not){
			^bus[aBus]
		}{
			postf("\nBCR2000 not initialized\nuse BCR2000.open to acces the CCResponders\n");		}
	}
	
	*open { 
		active = true;
		debug = false;
		^this.init;
	}
	
	*init {
		midiID = 1540615793;
		^this.makeGlobalAction;
	}
	
	*close {
		active = false;
		responders.remove;
		this.debug_(false);
	}

	*makeGlobalAction {
		responders = ();
		(1..maxCC).do{ |cc|
			responders[cc] = CCResponder({ |src,chan,num,value|
				nil
				},
				midiID, 	//  source
				nil,		//  channel
				cc, 		//  CC number
				nil 		//  value
			)
		};
	}
	
	*action { |aResp|
		^this.cc(aResp).function
	}

	*action_ { |aResp, aFunc|
		^responders[aResp].function_(aFunc)
	}

	*debug_ { |bool|
		debug = bool;
		if(bool){
			debugResponders = ();
			(1..maxCC).do{ |cc|
				debugResponders[cc] = CCResponder({ |src,chan,num,value|
					[src,chan,num,value].postln;
				},
				midiID, 	//  source
				nil,		//  channel
				cc, 		//  CC number
				nil 		//  value
			)};
			postf("\n\t***DEBUG MODE ON***\n");
		}{
			debugResponders.do{ |aResp|
				aResp.remove;
			};
			postf("\n\t***DEBUG MODE OFF***\n");
		}
		
	}
	
	*makeBuses {
		if(Server.default.serverRunning){
			busResponders = ();
			bus = ();
			(1..maxCC).do{ |aBus|
				bus[aBus] = Bus.control(Server.default, 1);
			};
			(1..maxCC).do{ |cc|
				busResponders[cc] = CCResponder({ |src,chan,num,value|
					value.postln;
					bus[cc].set(value / 127);
				},
				midiID, 	//  source
				nil,		//  channel
				cc, 		//  CC number
				nil 		//  value
				);
			}
		}{
			"Server is not running !!!".warn;
			"Try booting the server first in order to create the busses".postln;
		}
	}
	
	*info {
		postf("\nused busses: %\n", maxCC);
		
		
		"get some info biatch".postln
	}

}