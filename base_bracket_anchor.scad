include <variables.scad>
use <helpers.scad>

// Creates a flat square with rounded edges, with a cone and screw hole cutout
module base_bracket_anchor() {
  difference() {
    union() {
      // Create the thin, square base
      hull() {
        translate(v = [corner_offset, corner_offset, 0]) cylinder(r=1, h=bottom_leg_attachment_anchor_height, center=true);
        translate(v = [-corner_offset, corner_offset, 0])  cylinder(r=1, h=bottom_leg_attachment_anchor_height, center=true);
        translate(v = [-corner_offset, -corner_offset, 0]) cylinder(r=1, h=bottom_leg_attachment_anchor_height, center=true);
        translate(v = [corner_offset, -corner_offset, 0])  cylinder(r=1, h=bottom_leg_attachment_anchor_height, center=true);
      }

      // The cone is sunk into the square by this much. This
      // provides a tiny bit of wiggle room so that the cone fits
      // into its inverted counterpart in the bracket.
      wiggle_room = 0.5;

      // Add the cone to the square base
      translate(v = [0, 0, -cone_height / 2 - bottom_leg_attachment_anchor_height / 2 + epsilon + wiggle_room]) {
        rotate(a = [180, 0, 0]) {
          rounded_cone(sphere_radius=cone_small_r, end_radius=cone_large_r, height=cone_height);
        }
      }
    }

    // Cut out the screw hole
    cylinder(h=1000, r=screw_hole_radius, center=true);

    // Cut out clearance for the screw head
    translate(v = [0, 0, -cone_height / 2 - bottom_leg_attachment_anchor_height / 2]) {
      cylinder(h=cone_height, r=screw_head_clearance_radius, center=true);
    }
  }
}
