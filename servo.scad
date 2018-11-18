servo_dims=[18.6, 7.6];
servo_a=[4.5, 0]; //distance between servo axle and servo center

module servo() {
  $fn=30;
  color("DarkGray", alpha=0.9) {
    translate(servo_a) {
      linear_extrude(height=1) difference() {
        square([27, 7.6], center=true);
        translate([-11.7, 0]) circle(d=2);
        translate([ 11.7, 0]) circle(d=2);
      }
      translate([0, 0, -11.5]) linear_extrude(height=13.5) square([18.6, 7.6], center=true);
      translate([0, 0, 2])     linear_extrude(height=1) square([15.7, 7.6], center=true);
    }
    translate([0, 0, 3]) cylinder(1.4, r=5/2, $fn=50); //gear
  }
  color([0.4, 0.4, 0.4]) translate([0, 0, 3+1.4]) cylinder(4, r=4/2);
}

module servo_mount() {
  $fn=30;
  translate(servo_a) {
	square([servo_dims[0]+0.4, servo_dims[1]+0.4], center=true);
    translate([-11.7, 0]) circle(d=2);
    translate([ 11.7, 0]) circle(d=2);
  }
}
