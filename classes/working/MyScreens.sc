MyScreens : Object {

	classvar result;

	*resolution {
		(result == nil).if{ this.refresh };
		^result;
	}
	
	*numScreens {
		^this.resolution.size;
	}
	
	*refresh {
		Êvar systemProfiler;
		ÊsystemProfiler = "system_profiler SPDisplaysDataType | grep Resolution".unixCmdGetStdOut;
		Êresult = systemProfiler
			Ê .findRegexp("(?<!@ )[0-9]{3,}")
			Ê .collect({|item| item[1].asInteger})
			Ê .clump(2);
		Ê^result;
	}
}