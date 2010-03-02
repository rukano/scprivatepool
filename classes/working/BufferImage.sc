BufferImage {
	var <window, <image, <buffer, <array, <colorArray;

	*new { |server, path, width=600|
		^super.new.init(server, path, width)
	}
	
	init { |server, path, width|
		buffer = Buffer.read(server, path, action: {
			buffer.loadToFloatArray( action: { |frames|
				array = frames;
				colorArray = this.framesToColors(frames);
				this.makeWindow(width);
			})
		});
		^this
	}

	framesToColors { |frames|
		// here maybe change color mapping?
		^frames.collect{ |amp| Color(*(((amp+1)/2).round(0.00005)!3)) }
	}
		
	clumpArrayToWidth {
		colorArray = colorArray.clump(image.width);
	}
	
	makeWindow { |width|
		{
			image = SCImage(width@(buffer.numFrames/width).asInteger);
			this.clumpArrayToWidth;
			(image.height.asInteger).do{ |y|
				(image.width.asInteger).do { |x|
					image.setColor(colorArray[y][x], x, y);
				};
			};
			window = image.plot(showInfo:false);
		}.defer;
	}
	
}