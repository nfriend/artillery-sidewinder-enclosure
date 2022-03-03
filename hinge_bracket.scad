include <variables.scad>

module hinge_bracket() {
  // Creates a cone with a spherical top
  module rounded_cone(sphere_radius, end_radius, height) {
    hull() {
      sphere(r = sphere_radius);
      translate(v = [0, 0, -height / 2]) {
        cylinder(h=0.001, r=end_radius, center=true);
      }
    }
  }

  difference() {
    // Create a cube with rounded corners. One corner is more rounded than the others
    hull() {

      // Create the corner with the hinge
      translate(v = [corner_offset - (hinge_pole_inner_radius - corner_radius), corner_offset - (hinge_pole_inner_radius - corner_radius), 0]) {
        cylinder(r=hinge_pole_inner_radius, h=bottom_leg_attachment_clip_height, center=true);
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
        rounded_cone(sphere_radius=cone_small_r, end_radius=cone_large_r, height=cone_height);
      }
    }

    // Cut out the screw hole
    cylinder(h=bottom_leg_attachment_total_height * 2, r=screw_hole_radius, center=true);

    // Cut out clearance for the screw head
    translate(v = [0, 0, cone_z_translation - 2.0]) {
      cylinder(h=cone_height, r=(cone_small_r + screw_hole_radius) / 2, center=true);
    }

    // Cut a cylinder for the hinge
    translate(v = [corner_offset - (hinge_pole_inner_radius - corner_radius), corner_offset - (hinge_pole_inner_radius - corner_radius), -5]) {
      cylinder(r=hinge_enclosure_radius + epsilon, h=bottom_leg_attachment_clip_height + epsilon, center=true);
    }
  }

  // Create the hinge pole
  translate(v = [corner_offset - (hinge_pole_inner_radius - corner_radius), corner_offset - (hinge_pole_inner_radius - corner_radius), -epsilon]) {
    cylinder(r=hinge_pole_inner_radius, h=bottom_leg_attachment_clip_height, center=true);
  }
}
