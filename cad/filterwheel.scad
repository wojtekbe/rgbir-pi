module filterwheel(nf, R, f_dia=25) {
  $fn = 50;
  r = f_dia/2;
  da = 2*asin(r/R) + 5;
  color([0.2, 0.2, 0.2]) {
    linear_extrude(2.5) difference() {
      for (a=[0:da:(nf-1)*da]) hull() {
        circle(d=8);
        rotate([0, 0, a]) translate([R, 0, 0]) circle(d=f_dia+4);
      }
      for (a=[0:da:(nf-1)*da]) {
        rotate([0, 0, a]) translate([R, 0, 0]) circle(d=f_dia);
      }
    }
    translate([0, 0, -3]) linear_extrude(3) difference() {
      circle(d=5.5);
      circle(d=4.5);
    }
  }

  /* filters */
  color("Aquamarine", alpha=0.3) linear_extrude(2.5) for (a=[0:da:(nf-1)*da]) {
    rotate([0, 0, a]) translate([R, 0, 0]) circle(d=f_dia);
  }
}
