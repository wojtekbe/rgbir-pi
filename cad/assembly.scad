use <servo.scad>
use <camera.scad>
use <spectro_sensor.scad>
use <cam_servo_board.scad>
use <filterwheel.scad>

cam_servo_board();
translate([20, 5, 2]) {
  rotate([0, 0, -90]) servo();
  translate([0, 0, 10]) rotate([0, 0, 125]) filterwheel(2, 30);
}
translate([-10, 5, 3]) camera();

translate([-45,  15, 2]) rotate([0, 0, -90]) spectro_sensor();
translate([-45, -15, 2]) rotate([0, 0, -90]) spectro_sensor();
