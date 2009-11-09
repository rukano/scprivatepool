TouchOSC {

	var <>sendAddr, localAddr, <>layout, layouts, defaultPort, defaultLayout, <>debug;	var pages, <currentPage;
	var accResponder, pingResponder, <>accStatus, <>pingStatus;
	var commands, cmdArray, funx;

	*new { |address, outPort, layoutName|
	^super.new.init(address, outPort, layoutName);
	}
	
	init { |address, outPort, layoutName|
		debug = false;
		pingStatus = false;
		accStatus = false;
		layouts = ["Beatmachine", "Keys", "Mix 16", "Mix 2", "Simple"];
		defaultPort = 99999;
		defaultLayout = "Simple";
		pages = Array.newClear(4);

		this.setAddr(address, outPort);
		this.setLayout(layoutName);
	}

	setAddr { |address, outPort|
		if (address.class == String,
			{	// set port
				if ( outPort != nil,
					{
						sendAddr = NetAddr(address, outPort);
					},
					{
						sendAddr = NetAddr(address, defaultPort);
						("Using default port" + defaultPort).postcln;
					}
				)
			},
			{
				"Please give the IP address of the TouchOSC device as \"x.x.x.x\"".error;
			}
		);
	}

	setLayout { |layoutName|
		if (
			layouts.detect{|aString| aString == layoutName}.notNil,
			{
				layout = layoutName;
				("Using layout:" + layout).postcln;
			},
			{
				layout = defaultLayout;
				("Using default layout:" + layout).postcln;
				("You can choose a layout from:" + layouts).postcln;
			}
		);
		this.initLayout(layout);
	}
	
	initLayout { |layoutName|
		switch (layoutName)
			{ "Beatmachine" }	{
				4.do{ |i| pages[i] = () };
			}
			{ "Keys" }		{
				3.do{ |i| pages[i] = () };
			}
			{ "Mix 16" }		{
				4.do{ |i| pages[i] = () };
			}
			{ "Mix 2" }		{
				3.do{ |i| pages[i] = () };
			}
			{ "Simple" }		{
				4.do{ |i| pages[i] = ()
			};
		};
		this.initCommands(layoutName)
	}
	
	initCommands { |layoutName|
		commands = ();
		switch (layoutName)
		{ "Beatmachine" } {
			commands[layoutName.asSymbol] = [
			// page 1
				(1..12).collect{ |i| "/1/push" ++ i } ++
				(1..2).collect{ |i| "/1/fader" ++ i } ++
				(1..2).collect{ |i| "/1/toggle" ++ i },
			// page 2
				(1..16).collect{ |i| "/2/led" ++ i } ++
				(1..6).collect{ |j|
					(1..16).collect{ |i| "/2/multitoggle" +/+ j +/+ i }
				}.flatten ++
				(1..16).collect{ |i| "/2/multifader" +/+ i },
			// page 3
				(1..6).collect{ |i| "/3/rotary" ++ i } ++
				(1..5).collect{ |i| "/3/toggle" ++ i },
			// page 4
				(1..5).collect{ |i| "/4/toggle" ++ i } ++
				["/4/xy"]
			].flatten;
		}
		{ "Keys" } {
			commands[layoutName.asSymbol] = [
			// page 1
				(1..12).collect{ |i| "/1/push" ++ i },
			// page 2
				(1..12).collect{ |i| "/2/push" ++ i },
			// page 3
				(1..5).collect{ |i| "/3/fader" ++ i } ++
				(1..3).collect{ |i| "/3/toggle" ++ i } ++
				(1..4).collect{ |i| "/3/push" ++ i } ++
				(1..1).collect{ |i| "/3/rotary" ++ i }
			].flatten;
		}
		{ "Mix 16" } {
			commands[layoutName.asSymbol] = [
			// page 1
				(1..4).collect{ |i| "/1/fader" ++ i } ++
				(1..3).collect{ |i| "/1/toggle" ++ i } ++
				(1..5).collect{ |i| "/1/push" ++ i } ++
				["/1/xy"],
			// page 2
				(1..8).collect{ |i| "/2/fader" ++ i } ++
				(1..8).collect{ |i| "/2/toggle" ++ i },
			// page 3
				(1..8).collect{ |i| "/3/fader" ++ i } ++
				(1..8).collect{ |i| "/3/toggle" ++ i },
			// page 4
				(1..24).collect{ |i| "/2/multifader" +/+ i } ++
				(1..24).collect{ |i| "/2/multifader" +/+ i },
			].flatten;
		}
		{ "Mix 2" } {
			commands[layoutName.asSymbol] = [
			// page 1
				(1..4).collect{ |i| "/1/toggle" ++ i } ++
				(1..3).collect{ |i| "/1/fader" ++ i } ++
				(1..6).collect{ |i| "/1/rotary" ++ i } ++
				(1..4).collect{ |i| "/1/push" ++ i },
			// page 2
				(1..16).collect{ |i| "/2/multifader1" +/+ i } ++
				(1..16).collect{ |i| "/2/multifader2" +/+ i },
			// page 3
				(1..2).collect{ |i| "/3/xy" ++ i }
			].flatten;
		}
		{ "Simple" } {
			commands[layoutName.asSymbol] = [
			// page 1
				(1..5).collect{ |i| "/1/fader" ++ i } ++
				(1..4).collect{ |i| "/1/toggle" ++ i },
			// page 2
				(1..16).collect{ |i| "/2/push" ++ i } ++
				(1..4).collect{ |i| "/2/toggle" ++ i },
			// page 3
				(1..4).collect{ |i| "/3/toggle" ++ i } ++
				["/3/xy"],
			// page 4
				(1..4).collect{ |i| "/4/toggle" ++ i } ++
				(1..8).collect{ |j|
					(1..8).collect{ |i| "/4/multitoggle" +/+ j +/+ i }
				}.flatten
			].flatten;
		};
		this.makeArray(layoutName);
	}

	makeArray { |layoutName|
		cmdArray = Array.newClear(commands[layoutName.asSymbol].size);
		commands[layoutName.asSymbol].do{ |cmd, i|
			var array, mini;
			mini = cmd.splitSlash;
			switch (mini.size)
				// would be better if all the indexed would be after a "/"
				// so here's the trick to separate the index from the keyword
				{2}{
					(mini[1].last.isDecDigit).if {
					array =
						[cmd]
						++ mini[0].decreaseAsInt
						++ [mini[1].splitLastNumber[0]]
						++ [mini[1].splitLastNumber[1].decreaseAsInt]
					}{
					array =
						[cmd]
						++ mini[0].decreaseAsInt
						++ [mini[1].splitLastNumber[0]] // oder doch ein 0 ?
					}
				}
				{3}{ array =
					[cmd]
					++ mini[0].decreaseAsInt
					++ [mini[1].asSymbol]
					++ mini[2].decreaseAsInt;
				}
				{4}{ array =
					[cmd]
					++ mini[0].decreaseAsInt
					++ [mini[1].asSymbol]
					++ [[mini[2].decreaseAsInt, mini[3].decreaseAsInt]];
				};
			cmdArray.put(i, array);
		};
		this.makeDict(layoutName);
	}
	
	makeDict { |layoutName|
		this.initFunx(layoutName);
		
		
		
	}
	
	initFunx { |layoutName|
		this.initResponders(layoutName);
	}
	
	initResponders { |layoutName|
		cmdArray.do{ |array|
			pages[array[1]][array[2]] = { |in| ("Bang" + in).postln };
			OSCresponder(nil, array[0], { |t,r,m,a|
				debug.if { m.postln };
				pages[array[1]][array[2]].value(m[1]);
			}).add;
		};
	}
	
///////////////////////////
/////END INIT METHODS//////
///////////////////////////

	acc_ { |onoff|
		onoff.if {
			accResponder = OSCresponder(nil, "/accxyz", {|t,r,m,a|
				debug.if { m.postln };
				// inser acc funx hier
			}).add;
			accStatus = true;
		}
		{
			accResponder.remove;
			accStatus = false;
		};
	}
	
	acc {
		^accStatus
	}
	
	ping_ { |onoff|
		onoff.if {
			pingResponder = OSCresponder(nil, "/ping", {|t,r,m,a| [t,r,m,a].postln }).add;
			pingStatus = true;
		}
		{
			pingResponder.remove;
			pingStatus = false;
		}
		
	}
	
	ping {
		^pingStatus
	}

	currentLayout {
		^layout;
	}
	
	currentAddr {
		^sendAddr;
	}
	allPages {
		^pages;
	}
	
	verbose_ { |onoff|
		debug = onoff;
	}
	
	showCommands {
		^commands[layout.asSymbol];
	}
	
	showPage { |n|
		^pages[n];
	}
	
	showArray {
		^cmdArray;
	}
	
	removeResponders {
		OSCresponder.removeAddr(nil)
	}

}


/* TODO
- aus command entdecken ob fader, toggle, push, rotary (1 wert)
- aus command entdecken ob xy, (2 wert2)
- func für acc adden können
- func dictionary bauen:
  - Class.page(0).add(\fader1, { nil })
- redirect (to another address)
- remap (bus)
- GUI
- Help File

*/


