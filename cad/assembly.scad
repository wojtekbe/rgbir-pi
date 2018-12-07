use <servo.scad>
use <camera.scad>
use <spectro_sensor.scad>
use <cam_servo_board.scad>
use <filterwheel.scad>

cam_servo_board();

translate([-20, 5, 2]) {
  rotate([0, 0, -90]) servo();
  translate([0, 0, 10]) rotate([0, 0, 0]) filterwheel(2, 30, draw_filters=true);
}

translate([10, 5, 3]) camera();

translate([39,  14, 4]) rotate([0, 0, 180]) spectro_sensor();
translate([39, -14, 4]) rotate([0, 0,   0]) spectro_sensor();
