include <variables.scad>
use <helpers.scad>

// Creates a square with rounded edges and a conical cutout with a screw hole
module base_bracket(include_hinge_corner=false) {
  difference() {
    // Create a cube with rounded corners. One corner is more rounded than the others
    hull() {

      if (include_hinge_corner) {
        // Create the corner with the hinge
        translate(v = [corner_offset - (hinge_pole_inner_radius - corner_radius), corner_offset - (hinge_pole_inner_radius - corner_radius), 0]) {
          cylinder(r=hinge_pole_inner_radius, h=bottom_leg_attachment_clip_height, center=true);
        }
      } else {
        // Create a regular corner
        translate(v = [corner_offset, corner_offset, 0]) cylinder(r=1, h=bottom_leg_attachment_clip_height, center=true);
      }

      // Create the other 3 corners
      translate(v = [-corner_offset, corner_offset, 0])  cylinder(r=1, h=bottom_leg_attachment_clip_height, center=true);
      translate(v = [-corner_offset, -corner_offset, 0]) cylinder(r=1, h=bottom_leg_attachment_clip_height, center=true);
      translate(v = [corner_offset, -corner_offset, 0])  cylinder(r=1, h=bottom_leg_attachment_clip_height, center=true);
    }

    cone_z_translation = (cone_height / 2) - (bottom_leg_attachment_clip_height / 2) + (bottom_leg_attachment_clip_height - cone_height) + epsilon;

    // Cut out the cone shape
    translate(v = [0, 0, cone_z_translation]) {
      rotate(a = [0,180,0]) {
        rounded_cone(sphere_radius=cone_small_r, end_radius=cone_large_r, height=cone_height + epsilon);
      }
    }

    // Cut out the screw hole
    cylinder(h=bottom_leg_attachment_total_height * 2, r=screw_hole_radius, center=true);

    // Cut out clearance for the screw head
    translate(v = [0, 0, cone_z_translation - screw_head_clearance_depth]) {
      cylinder(h=cone_height, r=screw_head_clearance_radius, center=true);
    }
  }
}
