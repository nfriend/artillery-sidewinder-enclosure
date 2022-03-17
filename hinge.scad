include <variables.scad>

module hinge() {
  hinge_circle_width = hinge_outer_radius - hinge_hole_inner_radius;

  difference() {
    // Create the body of the hinge
    linear_extrude(height=bottom_leg_attachment_clip_height, center=true, convexity=10, twist = 0) {
      offset(r=-corner_radius * 4) offset(delta=corner_radius * 4) {
        difference() {
          circle(r=hinge_outer_radius);
          circle(r=hinge_hole_inner_radius);
        }

        translate(v=[0, hinge_length / 2 + hinge_outer_radius - hinge_circle_width, 0]) {
          square(size=[fiberglass_holder_total_width, hinge_length], center=true);
        }
      }
    }

    // Cut out the fiberglass slot
    translate(v=[0, hinge_length / 2 + hinge_outer_radius - hinge_circle_width + fiberglass_holder_width, -fiberglass_holder_width]) {
      cube(size=[fiberglass_width, hinge_length, bottom_leg_attachment_clip_height], center=true);
    }

    // Cut out space where the hinge sits on the hinge pole
    translate(v=[0, 0, bottom_leg_attachment_clip_height / 2 - hinge_pole_base_thickness / 2 + epsilon]) {
      cube(size=[hinge_outer_radius * 2, hinge_outer_radius * 2, hinge_pole_base_thickness], center=true);
    }
  }
}
