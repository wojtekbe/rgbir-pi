module spectro_sensor_mounting_holes() {
	b=20.32;
	translate([ b/2, b/2]) circle(d=3);
	translate([-b/2, b/2]) circle(d=3);
}

module spectro_sensor() {
	color(c=[224/255, 49/255, 29/255]) linear_extrude(1.5) difference() {
		square([26, 26], center=true);
		spectro_sensor_mounting_holes();
	}

	translate([0, 0, 1.5]) color("Gray") linear_extrude(2) difference() {
		square([4.5, 4.5], center=true);
		circle(d=0.7);
	}
}
