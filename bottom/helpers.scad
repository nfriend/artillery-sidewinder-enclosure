include <../variables.scad>

// Creates a cone with a spherical top
module rounded_cone(sphere_radius, end_radius, height) {
  hull() {
    sphere(r = sphere_radius);
    translate(v = [0, 0, -height / 2]) {
      cylinder(h=0.001, r=end_radius, center=true);
    }
  }
}
