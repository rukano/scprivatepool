LiveCodePublisher : Object {
	var <isActive, <>ftpserver, <lastRecording;
	
	*start {
		// set activeness -> active
		// start history
		// start recording
	}
	
	*stop {
		// set activeness -> false
	
		// stop history
		// export history to temp folder
		
		// stop recording
		// process audio to mp3 || aif 16-bit
		
	}
	
	*send {
		// check the latest recording
		// ftp to server
		// create folder with date
		// upload history.scd
		// upload mp3
	}

}