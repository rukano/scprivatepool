/*
Inspired by Batuhan Bozkurt's TouchNet
Still some thing to do like
	* default actions
	* clamp to window for very large buffer
	* color mapping (not only greyscale)
And other stuff...

USAGE:

b = BufferImage(s,"sounds/a11wlk01.wav", 400)
b.play
b.buffer
b.window
b.image

*/

BufferImage {

	var <window, <image, <buffer, <array, <colorArray;
	var dimensions;

	*new { |server, path, width=600|
		^super.new.init(server, path, width)
	}
	
	init { |server, path, width|
		dimensions = Point(width,nil);
		buffer = Buffer.read(server, path, action: {
			buffer.loadToFloatArray( action: { |frames|
				array = frames;
				colorArray = this.framesToColors(frames);
				this.makeWindow;
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
	
	makeWindow {
		dimensions.y.isNil.if { dimensions.y_((buffer.numFrames/dimensions.x).asInteger) };
		{
			image.isNil.if {
				image = SCImage(dimensions);
				this.clumpArrayToWidth;
				(image.height.asInteger).do{ |y|
					(image.width.asInteger).do { |x|
						image.setColor(colorArray[y][x], x, y);
					};
				};
				this.buildWindow;
			} {
				this.buildWindow;
			};
		}.defer;
	}
	
	buildWindow {
		window = image.plot(showInfo:false);
		window
			.name_(buffer.path.basename)
			.acceptsMouseOver_(true);
	}
	
	play {
		buffer.play
	}
	
}