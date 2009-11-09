// XML Quark alt
/*
DOMDocument("/Users/rukano/Documents/projects/SCTron/data/tronFCP.xml")
	.getElementsByTagName("xmeml").at(0)
	.getElementsByTagName("sequence").at(0)
	.getElementsByTagName("marker").collect({|element|
		element.getElementsByTagName("in").at(0)
		.getText.asInteger;
	});

DOMDocument("/Users/rukano/Documents/projects/SCTron/data/tronFCP.xml")
	.getElementsByTagName("xmeml").at(0)
	.getElementsByTagName("sequence").at(0)
	.getElementsByTagName("marker").collect({|element|
		element.getElementsByTagName("name").at(0)
		.getText;
	});


*/
