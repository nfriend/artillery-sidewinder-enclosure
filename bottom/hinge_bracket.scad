include <../variables.scad>
use <helpers.scad>
use <base_bracket.scad>
use <../shared/fiberglass_panel_holder.scad>

// Creates a bracket with a hinge pole
module hinge_bracket() {
  difference() {
    base_bracket(include_hinge_corner=true);

    // Cut a cylinder for the hinge
    translate(v = [corner_offset - (hinge_pole_inner_radius - corner_radius), corner_offset - (hinge_pole_inner_radius - corner_radius), -hinge_pole_base_thickness]) {
      cylinder(r=hinge_enclosure_radius + epsilon, h=bottom_leg_attachment_clip_height + epsilon, center=true);
    }
  }

  // Create the hinge pole
  translate(v = [corner_offset - (hinge_pole_inner_radius - corner_radius), corner_offset - (hinge_pole_inner_radius - corner_radius), -epsilon]) {
    cylinder(r=hinge_pole_inner_radius, h=bottom_leg_attachment_clip_height, center=true);
  }

  translate(v = [-corner_offset - corner_radius + epsilon, -corner_offset + fiberglass_holder_total_width / 2 + corner_radius, -bottom_leg_attachment_clip_height / 2]) {
    fiberglass_panel_holder();
  }
}
