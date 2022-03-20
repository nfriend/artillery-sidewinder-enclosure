include <variables.scad>

// Creates a bracket with a hinge pole and a fiberglass holder slot
module hinge_bracket() {
  cube(size=[leg_width, leg_width, leg_width * 2]);

  translate(v=[leg_width - epsilon, 0, leg_width]) {
    cube(size=[leg_width, leg_width, leg_width]);
  }

  module wood_bracket() {
    module wood_bracket_side() {
      cube(size=[leg_width * 3 - fiberglass_holder_total_width, leg_width - fiberglass_holder_total_width + wood_bracket_width, wood_bracket_width]);
    }

    translate(v=[0, fiberglass_holder_total_width, 0]) {
      wood_bracket_side();
    }

    translate(v=[0, wood_bracket_width + leg_width, 0]) {
      rotate(a=[90, 0, 0]) {
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
