(
GeneralHID.buildDeviceList;
a = GeneralHID.findBy( 1133 );
b = GeneralHID.open( a );

c =  GeneralHIDSpec.new( b );

x = #[
	b1, b2, b3, b4,
	b5, b6, b7, b8,
	b9, b10,
	
	dpad,
	joyLX, joyLY,
	joyR, joyRY

];

y = [
	[1,1], [1,2], [1,3], [1,4],
	[1,5], [1,6], [1,7], [1,8],
	[1,9], [1,10],
	[3,57],
	[3,48], [3,49],
	[3,50], [3,53]
];

z = [x,y].flop;

z.do{ |pair|
	c.add(pair[0], pair[1]  );
};

c.save("Logitech");

// then:
// b.setSpec( "Logitech" )

)