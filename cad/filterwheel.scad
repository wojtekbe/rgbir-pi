module filterwheel(nf, R, f_dia=25, draw_filters=false) {
  $fn = 50;
  r = f_dia/2;
  da = 2*asin(r/R) + 5;
  color([0.2, 0.2, 0.2]) {
    linear_extrude(2.5) difference() {
      for (a=[0:da:(nf-1)*da]) hull() {
        circle(d=18);
        rotate([0, 0, a]) translate([R, 0, 0]) circle(d=f_dia+4);
      }
      for (a=[0:da:(nf-1)*da]) {
        rotate([0, 0, a]) translate([R, 0, 0]) circle(d=f_dia);
      }
      circle(d=2); // center screw
    }
    /* rings holding filters */
	/*
    rt=0.6; // ring thickness
    translate([0, 0, -rt]) for (a=[0:da:(nf-1)*da]) {
      rotate([0, 0, a]) translate([R, 0, 0]) linear_extrude(rt) difference() {
        circle(d=f_dia+1);
        circle(d=f_dia-1);
      }
    }
	*/
    /* servo horn mount */
    translate([0, 0, -1]) linear_extrude(1) difference() {
      circle(d=17);
      circle(d=2);
      rotate([0, 0, da]) {
        square([17, 3.5], center=true);
        rotate([0, 0, 90]) square([17, 3.5], center=true);
      }
      circle(d=6);
    }
  }

  /* filters */
  if (draw_filters) color("Aquamarine", alpha=0.3) linear_extrude(2.5) for (a=[0:da:(nf-1)*da]) {
    rotate([0, 0, a]) translate([R, 0, 0]) circle(d=f_dia);
  }
}

rotate([0, 180, 0]) filterwheel(2, 30);
