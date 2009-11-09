+ String {
	splitSlash {
		var array;
		this.beginsWith("/").if
			{ array = this.copyToEnd(1).split }
			{ array = this.split };
		this.endsWith("/").if
			{ array.removeAt(array.size-1) }
		^array;
	}
	
	splitLast {
		var array;
		array = [this.copyFromStart(this.size-2), this.last];
		^array;
	}
	
	splitLastNumber {
		var array, count=0;
		var temp = this;
		while ( { temp.last.isDecDigit }, { temp = temp.butLast; count = count+1 });
		array = [this.copyFromStart(this.size-(1+count)), this.copyToEnd(this.size-count)];
		^array;
	}
}

+ SimpleNumber {
	oscmidi {
		^(this * 127).round;
	}
	
	midiosc { |n|
		^(this / 127);
	}
}

+ SequenceableCollection {
	butLast { ^this.copyFromStart(this.size-2) }
	oscmidi { ^this.performUnaryOp('oscmidi') }
	midiosc { ^this.performUnaryOp('midiosc') }
	splitSlash { ^this.performUnaryOp('splitSlash') }
	splitLast { ^this.performUnaryOp('splitLast') }
}

+ Object {
	decreaseAsInt {
		^((this.asSymbol.asInteger)-1);
	}
	
	decreaseAsSymbol {
		^((this.asSymbol.asInteger)-1).asSymbol;
	}


}