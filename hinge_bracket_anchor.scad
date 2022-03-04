include <variables.scad>
use <base_bracket_anchor.scad>

// Creates a bracket anchor for a hinge bracket
module hinge_bracket_anchor() {
  union() {
    base_bracket_anchor();

    translate(v=[leg_width / 2 - hinge_pole_inner_radius, leg_width / 2 - hinge_pole_inner_radius, -bottom_leg_attachment_anchor_height / 2]) {
      cylinder(h=bottom_leg_attachment_anchor_height, r=hinge_enclosure_radius);
    }
  }
}
