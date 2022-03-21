include <../variables.scad>

module hinge(type) {
  hinge_circle_width = hinge_outer_radius - hinge_hole_inner_radius;

  intersection() {
    difference() {
      // Create the body of the hinge
      linear_extrude(height=bottom_leg_attachment_clip_height, center=true, convexity=10) {
        offset(r=-4) offset(delta=4) {
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
    }

    // This shape is used to cut out space where the hinge sits on the hinge pole
    // as well as the trianglur notch in the corner of the fiberglass holder
    rotate(a=[0, 90, 0]) {
      linear_extrude(height=hinge_outer_radius * 3, center=true, convexity=10) {
        cutout_height = 8;
        rounded_radius = 4;

        offset(r=rounded_radius) offset(delta=-rounded_radius) {

          if (type == "bottom") {
            polygon(points=[
              [bottom_leg_attachment_clip_height / 2, -hinge_outer_radius - rounded_radius],
              [-bottom_leg_attachment_clip_height / 2 + hinge_pole_base_thickness, -hinge_outer_radius - rounded_radius],
              [-bottom_leg_attachment_clip_height / 2 + hinge_pole_base_thickness, hinge_outer_radius],
              [-bottom_leg_attachment_clip_height / 2 - rounded_radius, hinge_outer_radius],
              [-bottom_leg_attachment_clip_height / 2 - rounded_radius, hinge_outer_radius + hinge_length - hinge_circle_width],
              [bottom_leg_attachment_clip_height / 2 - cutout_height, hinge_outer_radius + hinge_length - hinge_circle_width],
              [bottom_leg_attachment_clip_height / 2, hinge_outer_radius + hinge_length - hinge_circle_width - cutout_height]
            ]);
          } else if (type == "top") {
            polygon(points=[
              [bottom_leg_attachment_clip_height / 2, hinge_outer_radius],
              [bottom_leg_attachment_clip_height / 2 - hinge_pole_base_thickness, hinge_outer_radius],
              [bottom_leg_attachment_clip_height / 2 - hinge_pole_base_thickness, -hinge_outer_radius - rounded_radius],
              [-bottom_leg_attachment_clip_height / 2 - rounded_radius, -hinge_outer_radius - rounded_radius],
              [-bottom_leg_attachment_clip_height / 2 - rounded_radius, hinge_outer_radius + hinge_length - hinge_circle_width],
              [bottom_leg_attachment_clip_height / 2 - cutout_height, hinge_outer_radius + hinge_length - hinge_circle_width],
              [bottom_leg_attachment_clip_height / 2, hinge_outer_radius + hinge_length - hinge_circle_width - cutout_height]
            ]);
          } else {
            assert(false, "type parameter must be provided and must be either \"bottom\" or \"top\"");
          }
        }
      }
    }
  }
}
