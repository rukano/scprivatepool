// Basic and experimental class to get times, names an durations of clips or markers
// from movie editor like FCP, iMovie or Cinelarra (xml export)

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
		types = [\fcp, \cinelarra];
	}
	
	*open {|path, type|
		// check XML and delegate to subclass
		^this.new(path, type);
//		^this.checkType;
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

	checkType {
	
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


