w = Window("test").front;
i = SCImage.open("~/Pictures/schneider.jpg".standardizePath);
w.view.backgroundImage_(i,10);
