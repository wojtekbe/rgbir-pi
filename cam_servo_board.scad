use <servo.scad>
use <camera.scad>

module rpi_holes() {
  a=[58, 49]; dia=3; // hole xy
  translate([-a[0]/2, -a[1]/2]) circle(d=dia);
  translate([ a[0]/2, -a[1]/2]) circle(d=dia);
  translate([ a[0]/2,  a[1]/2]) circle(d=dia);
  translate([-a[0]/2,  a[1]/2]) circle(d=dia);
}

module cam_servo_board() {
  A=65; B=56; // board dims
  color([0.2, 0.2, 0.2]) linear_extrude(2) difference() {
    square([A, B], center=true);

    // rpi mounting holes
    rpi_holes($fn=10);

	// pin headers
	translate([-A/2+3.5+29,  B/2-3, 0]) square([51, 6], center=true);
	translate([-A/2+3.5+29, -B/2+3, 0]) square([51, 6], center=true);

    //camera mount
    cam_p=[-10, 5]; //camera position
    translate(cam_p) {
	  camera_mount_holes();
	  // ribbon cable hole
	  translate([0, -21]) square([16.5, 4], center=true);
	}

    //servo mount
    servo_p=[20, 5];
	translate(servo_p) rotate([0, 0, -90]) servo_mount();
  }
}
