//multiple objects within a world with gravity force and also collision detection
//color and size depends on object's mass

(
	var width= 300, height= 300, w, wgrav, world, n= 20;
	
	//--world
	w= GUI.redWindow.new("collision test", Rect(128, 64, width, height)).front;
	wgrav= RedVector2D[-0.1, 0.98];					//world xy gravity
	world= RedWorld3(RedVector2D[width, height], wgrav, 10, 0.6); //dim,grav,maxvel,damp
	
	//--objects
	{
		var vel= RedVector2D[2.rand2, -5];			//random initial velocity for each object
		var mass= 0.5.rrand(4);						//random mass for each object
		RedObject(world, RedVector2D[width, height].rand, vel, 0, mass, mass*5); //world,loc,vel,acc,mass,size
	}.dup(n);
	
	//--loop
	w.draw{
		world.objects.do{|o, i|
			o.addForce(world.gravity);
			world.objects.do{|oo, j| if(i!=j, {o.collide(oo)})};
			o.update;
			world.contain(o);
			
			//--render
			GUI.pen.strokeColor_(Color.grey(o.mass/4));
			GUI.pen.strokeOval(Rect.aboutRedObject2D(o));
		};
	}.play;
)