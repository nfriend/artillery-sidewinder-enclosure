include <variables.scad>

// Creates the triangle fiberglass panel holder
module fiberglass_panel_holder() {
  // Creates the triangle shape
  module holder_triangle(width) {
    hull() {
      translate(v=[bottom_leg_attachment_clip_height / 2, corner_radius / 2, 0]) {
        cube(size = [bottom_leg_attachment_clip_height, corner_radius, width], center=true);
      }

      translate(v=[corner_radius, fiberglass_holder_width + corner_radius, 0]) {
        cylinder(h=width, r=corner_radius, center=true);
      }

      translate(v=[bottom_leg_attachment_clip_height - corner_radius - fiberglass_holder_width, bottom_leg_attachment_clip_height, 0]) {
        cylinder(h=width, r=corner_radius, center=true);
      }

      translate(v=[bottom_leg_attachment_clip_height, bottom_leg_attachment_clip_height + corner_radius / 2, 0]) {
        cube(size = [corner_radius, corner_radius, width], center=true);
      }
    }
  }

  // Used to round out the concave corner where the holder meets the bracket
  module concave_fillet(height) {
    difference() {
      cube(size=[height, corner_radius, corner_radius], center=true);
      translate(v = [0, corner_radius / 2, -corner_radius / 2]) {
        rotate(a=[0, 90, 0]) {
          cylinder(r=corner_radius, h=height+epsilon, center=true);
        }
      }
    }
  }

  rotate(a = [90, 270, 0]) {
    difference() {
      holder_triangle(width=fiberglass_holder_total_width);

      // Cut out the slot for the fiberglass panel
      translate(v = [-fiberglass_holder_width, fiberglass_holder_width, 0]) {
        holder_triangle(width=fiberglass_width);
      }
    }

    translate(v = [bottom_leg_attachment_clip_height / 2, corner_radius / 2, -fiberglass_holder_total_width / 2 - corner_radius / 2]) {
      concave_fillet(height=bottom_leg_attachment_clip_height);
    }

    translate(v = [bottom_leg_attachment_clip_height / 2, corner_radius / 2, fiberglass_holder_total_width / 2 + corner_radius / 2]) {
      rotate(a = [90, 0, 0]) {
        concave_fillet(height=bottom_leg_attachment_clip_height);
      }
    }
  }
}
