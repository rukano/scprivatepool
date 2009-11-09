CinelarraXML : MovieMarkers {
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


}