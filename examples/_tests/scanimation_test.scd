(
var width = 400, height = 400, xspeed = 3, yspeed = 2, x = width*0.5, y = height*0.5;
w = Window("my first sc animation", Rect(200, 200, width, height));
a = AnimationView(w, Rect(0, 0, width, height));
a.drawFunc = {|view, i|
a.background = Color.blue(sin(i/50));
	10.do{ |j|
		var bigCircle = sin(i/100) * (1+(j*20));
		Pen.strokeColor = Color.blue(j/10);
		Pen.strokeOval(Rect.aboutPoint(Point(width/2,height/2), bigCircle, bigCircle));
	}
};
w.front;
)