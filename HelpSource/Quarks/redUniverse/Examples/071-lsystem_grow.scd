//growing lsystem - scrambled rules

(
var width= 512, height= 512, w,
cnt= 0, lsys, lplot;

//--world
w= RedWindow("lsystem grow test", Rect(128, 64, width, height)).front;

lsys= RedLSystem("F", ($F: "F[+F--F]+F"));
lplot= RedLTurtle(lsys, 5, 5);	//length, theta

//--loop
w.draw{
	if(cnt==0, {
		lsys.reset;
	}, {
		if(cnt==7, {  //max depth to draw
			lsys= RedLSystem("F", ($F: "F[+F--F]+F".scramble));
			lplot.noise= 0.75.linrand;
			lplot.theta= 20.0.rand2;
			lplot.lsystem= lsys;
			lsys.reset;
			cnt= -1;
		});
	});
	lsys.next;
	cnt= cnt+1;

	//--render
	Pen.strokeColor= Color.white;
	Pen.translate(width*0.5, height*0.667);
	lplot.draw;
};
w.play(2);  //fps
CmdPeriod.doOnce({w.close});
)
