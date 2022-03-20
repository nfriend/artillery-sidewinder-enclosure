include <variables.scad>

// Creates a bracket with a hinge pole and a fiberglass holder slot
module hinge_bracket() {
  cube(size=[leg_width, leg_width, leg_width * 2]);

  translate(v=[leg_width - epsilon, 0, leg_width]) {
    cube(size=[leg_width, leg_width, leg_width]);
  }

  module wood_bracket() {
    module wood_bracket_side() {
      bracket_radius = 5;

      difference() {
        linear_extrude(height=wood_bracket_width, convexity=10) {
          hull() {
            translate([leg_width * 3 - fiberglass_holder_total_width, bracket_radius]) {
              circle(r=bracket_radius);
            }

            square(size=[bracket_radius, bracket_radius]);

            translate([0, leg_width - fiberglass_holder_total_width]) {
              square(size=[bracket_radius, bracket_radius]);
            }

            translate([leg_width * 3 - fiberglass_holder_total_width, leg_width - fiberglass_holder_total_width]) {
              square(size=[bracket_radius, bracket_radius]);
            }
          }
        }

        translate([leg_width * 2.5 - fiberglass_holder_total_width / 2, leg_width / 2 - wood_bracket_width, -50]) {
          cylinder(h=100, r=screw_hole_radius);
        }
      }
    }

    translate(v=[0, fiberglass_holder_total_width, 0]) {
      wood_bracket_side();
    }

    translate(v=[0, leg_width, leg_width - (fiberglass_holder_total_width - wood_bracket_width)]) {
      rotate(a=[270, 0, 0]) {
        wood_bracket_side();
      }
    }
  }

  translate(v=[fiberglass_holder_total_width, -epsilon, leg_width - wood_bracket_width + epsilon]) {
    wood_bracket();
  }


  translate([-epsilon, leg_width + wood_bracket_width - epsilon, leg_width * 2 - fiberglass_holder_total_width]) {
    rotate(a=[90, 90, 0]) {
      wood_bracket();
    }
  }
}
