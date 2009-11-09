FinalCutProXML : MovieMarkers {

	// FCP / iMovie

	findFCPfps {
		^domDoc
			.getElementsByTagName("xmeml").at(0)
			.getElementsByTagName("sequence").at(0)
			.getElementsByTagName("rate").at(0)
			.getElementsByTagName("timebase").at(0).getText.asFloat
	}

	
	makeClips {
		clipNames = this.findClipInfo("name").collect(_.asSymbol);
		clipFrames = this.findClipInfo("start").collect(_.asInteger);
		clipTimes = clipFrames.framesecs;
		clipLengths =
			this.findClipInfo("end").collect(_.asInteger) - 
			this.findClipInfo("start").collect(_.asInteger);
		clipDurations = this.clipLengths.collect { |x| if(x < 0) { nil } { x.framesecs(fps) } };
	}
	
	makeMarkers {
		markerNames = this.findMarkerInfo("name").collect(_.asSymbol);
		markerFrames = this.findMarkerInfo("in").collect(_.asInteger);
		markerTimes = markerFrames.framesecs;
		markerLengths = this.findMarkerInfo("out").collect(_.asInteger);
		markerDurations = this.markerLengths.collect { |x| if(x < 0) { nil } { x.framesecs(fps) } };
	}
	
	findMarkerInfo { |tag|
		^domDoc
			.getElementsByTagName("xmeml").at(0)
			.getElementsByTagName("sequence").at(0)
			.getElementsByTagName("marker").collect({|element|
				element
					.getElementsByTagName(tag)
					.at(0)
					.getText;
			});
	}

	findClipInfo { |tag|
		^domDoc
			.getElementsByTagName("xmeml").at(0)
			.getElementsByTagName("sequence").at(0)
			.getElementsByTagName("media").at(0)
			.getElementsByTagName("video").at(0)
			.getElementsByTagName("track").at(0)
			.getElementsByTagName("clipitem").collect({|element|
				element
					.getElementsByTagName(tag)
					.at(0)
					.getText;
			});
	}

}