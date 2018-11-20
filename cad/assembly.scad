use <servo.scad>
use <camera.scad>
use <cam_servo_board.scad>

cam_servo_board();
translate([20, 5, 2]) rotate([0, 0, -90]) servo();
translate([-10, 5, 6]) camera();
