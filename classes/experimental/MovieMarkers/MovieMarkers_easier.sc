// Basic and experimental class to get times, names an durations of clips or markers
// from movie editor like FCP, iMovie or Cinelarra (xml export)

// TODO:  make a set fo all cuts (because of the different video tracks)
// TODO:  make subclassing for specific methods

MovieMarkers : Object {
	classvar <types;
	var <domDoc;
	var <fps;
	var <clipNames, <clipFrames, <clipTimes, <clipLengths, <clipDurations;
	var <markerNames, <markerFrames, <markerTimes, <markerLengths, <markerDurations;
	
	*new {|path, type|
		^super.new.init(path, type)
	}
	
	*initClass {
		// wtf with cinelarra?
		types = [\fcp, \iMovie, \cinelarra];
	}
	
	init {|path, type|
		if(path.isNil) {
			Error("No path entered.\nPlease specify a .xml file").throw
		}{
			domDoc = DOMDocument(path);
		};
		
		if(types.includes(type)){
			switch(type,
				\fcp, {
					this.setFPS(\fcp);
					this.makeClips;
					this.makeMarkers;
				},
				\iMovie, {
					this.setFPS(\fcp);
					this.makeClips;
				},
				\cinelarra, {
					this.setFPS(\cinelarra);
					this.makeLabels;	//	and with the times !!!
					this.makeEdits;	//	have problems with the XML
				}
			);
		}{
			Error("You must type a valid type (MovieMarkers.types)").throw
		}	
	}

	// FCP / iMovie
	
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
	
	// Cinelarra
	
	makeLabels {
		markerNames = this.findLabelInfo("TEXTSTR").collect(_.asSymbol);
		markerTimes = this.findLabelInfo("TIME").collect(_.asFloat);
		markerFrames = this.markerTimes.collect(_ * fps);
		// make FPS variable or get from project !!!
	}
	
	findLabelInfo { |attr|
		^domDoc
			.getElementsByTagName("LABELS").at(0)
			.getElementsByTagName("LABEL")
			.collect{ |element|
				element.getAttribute(attr)
			}
	}

	makeEdits {
//		clips dont have names in cinelarra.. use filename???
//		clipNames = this.findClipInfo("name").collect(_.asSymbol);

		clipFrames = this.findEditInfo("STARTSOURCE").collect(_.asInteger);
		clipTimes = clipFrames.framesecs(fps);
		clipLengths = this.findEditInfo("LENGTH");
		clipDurations = clipLengths.framesecs(fps);
		("Cinelarra gives arrays with the cuts (edits) array for every video track").warn;
		("Use: the clipXXX methods with an index [int] to get the values of a video track").postln;
	}
	
	findEditInfo { |attr|
		^domDoc
			.getElementsByTagName("TRACK").select({|el| el.getAttribute("TYPE") == "VIDEO";})
			.collect{ |aTrack|
				aTrack
					.getElementsByTagName("EDITS").at(0)
					.getElementsByTagName("EDIT")
					.collect{ |element|
						element.getAttribute(attr).asInteger
					}
			}
	}


	// FPS stuff
	
	setFPS { |type|
		switch(type,
			\fcp, 		{ fps = this.findFCPfps },
			\cinelarra, 	{ fps = this.findCinelarraFPS }
		)
	}
	
	/*findCinelarraFPS {
		^domDoc
			.getElementsByTagName("VIDEO").at(0)
			.getAttribute("FRAMERATE").asFloat
	}
*/	/*
	findFCPfps {
		^domDoc
			.getElementsByTagName("xmeml").at(0)
			.getElementsByTagName("sequence").at(0)
			.getElementsByTagName("rate").at(0)
			.getElementsByTagName("timebase").at(0).getText.asFloat
	}
	*/
	
	findCinelarraFPS {
		^DOMDocument.getLeaf(domDoc, ["VIDEO"]).getAttribute("FRAMERATE").asFloat
	}

	findFCPfps {
		^DOMDocument.getLeaf(domDoc, ["xmeml", "sequence", "rate", "timebase"]).getText.asFloat
	}

	
	

}

// simple extensions
+ SimpleNumber {
	framesecs { |fps=25|
		^this/fps
	}
}

+ SequenceableCollection {
	relativeTime {
		^this.differentiate
	}
	framesecs { |fps|
		^this.performUnaryOp('framesecs', fps)
	}
}

+ DOMDocument {
	*getLeaf { |branch, keys|
		var res, key;
		if(keys.isEmpty or: { branch.isNil }) { ^branch };
		key = keys.removeAt(0);
		branch = branch.getElementsByTagName(key);
		if(branch.isNil) { Error("DOM Element not found:" + key).throw };
		^DOMDocument.getLeaf(branch.at(0), keys)
	}
	
}


