include <variables.scad>

module hinge() {
  difference() {
    cylinder(r=hinge_outer_radius, h=bottom_leg_attachment_clip_height, center=true);
    cylinder(r=hinge_hole_inner_radius, h=bottom_leg_attachment_clip_height + epsilon, center=true);
  }

  translate(v=[0, -hinge_length/2 - hinge_outer_radius + (hinge_outer_radius - hinge_hole_inner_radius) / 2, 0]) {
    cube(size=[fiberglass_holder_total_width, hinge_length, bottom_leg_attachment_clip_height], center=true);
  }
}
