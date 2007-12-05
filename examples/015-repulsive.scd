//one object pushes away the other in a world without bounds

(
	var width= 300, height= 300, w, wgrav, world, rep, obj;
	
	//--world
	w= GUI.redWindow.new("repulsive test1", Rect(128, 64, width, height)).front;
	wgrav= RedVector2D[0, 0.98];
	world= RedWorld2(RedVector2D[width, height], wgrav, 10); //dim,grav,maxvel,damp
	
	//--objects
	rep= RedObject(world, RedVector2D[100, 100], RedVector2D[0, 0], RedVector2D[0, 0], 105, 5);
	obj= RedObject(world, RedVector2D[130, 30], RedVector2D[1.5, 1], RedVector2D[0, 0], 1.5, 10);
	
	//--loop
	w.draw{
		obj.addForce(obj.gravityForce(rep).neg);
		obj.addForce(world.gravity);
		obj.update;
		world.contain(obj);
		
		//--render
		GUI.pen.strokeColor_(Color.green);
		GUI.pen.strokeRect(Rect.aboutRedObject2D(rep));
		GUI.pen.strokeColor_(Color.white);
		GUI.pen.strokeRect(Rect.aboutRedObject2D(obj));
	}.play;
)