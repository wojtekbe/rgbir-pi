module camera_mount_holes() {
  $fn=50;
  translate([ 21/2,  12.5/2]) circle(d=2);
  translate([-21/2, -12.5/2]) circle(d=2);
  translate([ 21/2, -12.5/2]) circle(d=2);
  translate([-21/2,  12.5/2]) circle(d=2);
}

module camera() {
  /* board + holes */
  color("Green") linear_extrude(1) difference() {
    translate([0, -3.75]) square([25, 24], center=true);
    camera_mount_holes();
  }

  /* lens mount */
  color([0.1, 0.1, 0.1]) difference() {
    union() {
	  translate([0, 0, 1]) linear_extrude(3.5) square([13.6, 13.2], center=true);
	  translate([0, 0, 1+3.5]) linear_extrude(4) circle(d=13.6, $fn=50);
	}
	translate([0, 0, 2]) cylinder(10, r=11/2, $fn=100);
  }
}
