a = TouchOSC("10.0.0.4")
a = TouchOSC("10.0.0.4", 66666)
a = TouchOSC("10.0.0.4", 66666, "Simple")

INIT
a = TouchOSC("ip", port, "layout")

INFO

a.currentAddr
a.currentLayout
a.ping
a.ping_(true)
a.acc
a.acc_(true)
a.showCommands
a.showPage(1)
a.showArray
a.allPages
a.showArray.postcs

x = a.checkCommands
x.flatten

SETTERS

a.setAddr("ip", port)
a.setLayout("Beatmachine")

a.currentLayout
a.page(0)

a = TouchOSC("10.0.0.4", 66666, "Beatmachine")
a.acc_(false)
a.ping_(true)
a.verbose_(true)


a.removeResponders



c = a.collect{ |i, j| [i, b[j]] }

a.showPage(0)
a.showArray.do{ |item| item.postln}
Char

# Cmds
SIMPLE
Page 1 -> 9
/1/fader1..5
/1/toggle1..4
Page 2 -> 20
/2/push1..16
/2/toggle1..4
Page 3 -> 5
/3/xy
/3/toggle1..4
Page 4 -> 68
/4/multitoggle/1..8/1..8
/4/toggle1..4

MIX 2
Page 1 -> 17
/4/toggle1..4
/4/fader1..3
/4/rotary1..6
/4/push1..4
// ??? /4/ @ Page 1 ???
Page 2 -> 32
/2/multifader1..2/1..16
Page 3 -> 2
/3/xy1..2

MIX 16
Page 1 -> 13
/1/fader1..4
/1/toggle1..3
/1/push1..5
/1/xy
Page 2 -> 16
/2/fader1..8
/2/toggle1..8
Page 3 -> 16
/3/fader1..8
/3/toggle1..8
Page 4 -> 48
/4/multifader1/1..24
/4/multifader2/1..24

BEATMACHINE
Page 1 ->	16
/1/push1..12
/1/fader1..2
/1/toggle1..2
Page 2 -> 128
/2/multitoggle/1..6/1..16
/2/led1..16
/2/multifader/1..16
Page 3 -> 11
/3/rotary1..6
/3/toggle1..5
Page 4 -> 6
/4/xy
/4/toggle1..5

KEYS
Page 1 -> 12
/1/push1..12
Page 2 -> 12
/2/push1..12
Page 3 -> 13
/3/fader1..5
/3/toggle1..3
/3/push1..4
/3/rotary1


z = (1..12).collect{|i| "/1/push" ++ i } ++ (1..12).collect{|i| "/2/push" ++ i }


a = ["/fader1","/fader2","/fader3"]
b = ( );
4.do{ |ele, i| b[i] = () }
b

(
f = { |aString|
	var page, type, index;
	type = aString.copyToEnd(1, aString.size-1);
	index = aString.last;
	b[page.asSymbol][type.asSymbol].isNil.if {
		b[page.asSymbol][type.asSymbol] = ();
		b[page.asSymbol][type.asSymbol][index.asSymbol] = "hello";
	} {
		b[page.asSymbol][type.asSymbol][index.asSymbol] = "hello"
	}
	[page, type, index].postln;
}
)

f.value(a[0])


a
c = a[0]

c.class

String

c.findRegexp("/")
c
a[0].copyToEnd(1).split
a[0].beginsWith("/")

a[0].splitSlash

d[3]

d = c.findAll("/")

c.copyRange(d[0]+1, d[1]-1)
x = c.copyToEnd(d[d.size-1]+1)
x.last


a = ["/1/fader1","/1/fader2","/1/fader3"]
b = a.splitSlash
b[0]
b[0].removeAt(b[0].size-1)
b[0]

("/mama/hallo").do{ |aString|
	var slashPos, sortedArray;
	slashPos = aString.findAll("/");
	slashPos.collect{ |slash, counter|
		(aString.copyRange(slashPos[counter]+1, slashPos[counter]-1)).postln;
	};
	sortedArray.postln;
//	sortedArray.add();
//	slashPos.postln;
}

a = ["/1/fader1","/1/fader2","/1/fader3"];
v = { |arrayOrString|
	arrayOrString.do { |aString, counter|
		var page, type, index, array;
		array = aString.splitSlash;
		page = array[0];
		type = array[1].butLast;
		index = array[1].last;
		[page, type, index].postln
	}
}

v.value(["/hello/mama", "/hello/papa"])

("/hahaha/hehehe/hihihi".splitSlash)[0].butLast

a.page(0)

["string", i(page), symbol, i, i]

(("/2/multitoggle/1/1").splitSlash).insert(0, "command")

a = ["/1/fader1","/1/fader2","/1/fader3"];
a.collect{ |command| command.splitSlash.insert(0, command)}

