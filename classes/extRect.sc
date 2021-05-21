// this file is part of redUniverse toolkit /redFrik


+Rect {
	*aboutRedVector2D {|redVec, size|
		^this.aboutPoint(Point(redVec[0], redVec[1]), size, size)
	}

	//!!!TODO. clean up focal and scaling
	*aboutRedVector3D {|redVec, size, width, height, depth, s= 1, f= 0.5|
		var x, y, z, ox, oy, w;
		z= (depth-redVec[2]/(depth*s)).linlin(0, 1, f, 1);
		x= redVec[0]*z;
		y= redVec[1]*z;
		ox= 1-z*(width*0.5)+x;
		oy= 1-z*(height*0.5)+y;
		w= size*z.linlin(0, 1, 0.01, 1);
		^Rect(ox-w, oy-w, w*2, w*2)
	}
	*aboutRedObject2D {|redObj|
		^this.aboutRedVector2D(redObj.loc, redObj.size)
	}
	*aboutRedObject3D {|redObj, s= 1, f= 0.5|
		^this.aboutRedVector3D(
			redObj.loc,
			redObj.size,
			redObj.world.dim[0],
			redObj.world.dim[1],
			redObj.world.dim[2],
			s,
			f
		)
	}
}
