include <variables.scad>

// Creates a bracket with a hinge pole and a fiberglass holder slot
module hinge_bracket() {

  // Creates the basic structure of the bracket.
  module basic_structure() {
    cube(size=[leg_width, leg_width, leg_width * 2]);

    translate(v=[leg_width - epsilon, 0, leg_width]) {
      cube(size=[leg_width, leg_width, leg_width]);
    }

    // Creates the bracket that attaches to two sides of the wooden leg
    module wood_bracket() {

      // Creates one side of the bracket
      module wood_bracket_side(screw_offset = false) {
        bracket_radius = 5;

        difference() {

          // Create a rectangle with one rounded corner
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

          x_offset = (screw_offset ? -1 : 1) * screw_hole_radius * 2;

          // Cut out the screw holes
          translate([leg_width * 2.5 - fiberglass_holder_total_width / 2 + x_offset, leg_width / 2 - wood_bracket_width / 2, -50]) {
            cylinder(h=100, r=screw_hole_radius);
          }
        }
      }

      translate(v=[0, fiberglass_holder_total_width, 0]) {
        wood_bracket_side();
      }

      translate(v=[0, leg_width, leg_width - (fiberglass_holder_total_width - wood_bracket_width)]) {
        rotate(a=[270, 0, 0]) {
          wood_bracket_side(screw_offset=true);
        }
      }
    }

    // Bracket for the horizontal beam
    translate(v=[fiberglass_holder_total_width, -epsilon, leg_width - wood_bracket_width + epsilon]) {
      wood_bracket();
    }


    // Bracket for the leg
    translate([-epsilon, leg_width + wood_bracket_width - epsilon, leg_width * 2 - fiberglass_holder_total_width]) {
      rotate(a=[90, 90, 0]) {
        wood_bracket();
      }
    }
  }

  difference() {
    basic_structure();

    translate([hinge_pole_inner_radius - epsilon, leg_width - hinge_pole_inner_radius + epsilon, leg_width * 2 - hinge_pole_height]) {

      // Using 1 here instead of epsilon, because I was still getting
      // artifacts when using just epsilon.
      cylinder(h=hinge_pole_height + 1, r=hinge_enclosure_radius);
    }

    translate([-hinge_enclosure_radius / 2, leg_width - hinge_enclosure_radius / 2, leg_width * 2 - hinge_pole_height]) {
      cube(size=[hinge_enclosure_radius * 2, hinge_enclosure_radius * 3, hinge_pole_height + 1]);
    }
  }

  translate([hinge_pole_inner_radius - epsilon, leg_width - hinge_pole_inner_radius + epsilon, leg_width * 2 - hinge_pole_height + epsilon]) {
    cylinder(h=hinge_pole_height, r=hinge_pole_inner_radius);
  }
}
