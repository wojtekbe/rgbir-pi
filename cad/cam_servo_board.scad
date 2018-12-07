use <servo.scad>
use <camera.scad>
use <spectro_sensor.scad>

module rpi_holes() {
  a=[58, 49]; dia=3; // hole xy
  translate([-a[0]/2, -a[1]/2]) circle(d=dia);
  translate([ a[0]/2, -a[1]/2]) circle(d=dia);
  translate([ a[0]/2,  a[1]/2]) circle(d=dia);
  translate([-a[0]/2,  a[1]/2]) circle(d=dia);
}

module cam_servo_board() {
  A=65; B=56; // hole dims
  camera_pos=[10, 5];
  servo_pos=[-20, 5];
  sensor1_pos=[39,  14];
  sensor2_pos=[39, -14];
  color([0.2, 0.2, 0.2]) {
    linear_extrude(2) difference() {
      translate([-A/2, -B/2]) square([85, B]);

      // rpi mounting holes
      rpi_holes($fn=10);

      // pin headers
      translate([-A/2+3.5+29,  B/2-3, 0]) square([51, 6], center=true);
      translate([-A/2+3.5+29, -B/2+3, 0]) square([51, 6], center=true);

      //camera mount
      translate(camera_pos) {
        camera_mount_holes();
        // ribbon cable hole
        translate([0, -21]) square([16.5, 4], center=true);
      }

      //servo mount
      translate(servo_pos) rotate([0, 0, -90]) servo_mount();

      //spectro sensors mount
	  translate(sensor1_pos) rotate([0, 0, 180]) spectro_sensor_mounting_holes();
	  translate(sensor2_pos) rotate([0, 0,   0]) spectro_sensor_mounting_holes();
    }
    /* camera mount distance tubes */
    translate(camera_pos) translate([0, 0, 2]) linear_extrude(1) difference() {
      camera_mount_holes(drill=4);
      camera_mount_holes(drill=2);
    }

    /* sensor mount distance tubes */
    translate(sensor1_pos) translate([0, 0, 2]) rotate([0, 0, 180]) linear_extrude(2) difference() {
      spectro_sensor_mounting_holes(drill=5);
      spectro_sensor_mounting_holes(drill=3);
    }
    translate(sensor2_pos) translate([0, 0, 2]) linear_extrude(2) difference() {
      spectro_sensor_mounting_holes(drill=5);
      spectro_sensor_mounting_holes(drill=3);
    }
  }
}

cam_servo_board();
