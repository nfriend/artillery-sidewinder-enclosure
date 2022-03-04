include <variables.scad>
use <base_bracket.scad>
use <fiberglass_panel_holder.scad>

// Creates a regular bracket with two fixed fiberglass panel holders
module regular_bracket() {
  base_bracket();

  translate(v = [-corner_offset - corner_radius + epsilon, -corner_offset + fiberglass_holder_total_width / 2 + corner_radius, -bottom_leg_attachment_clip_height / 2]) {
    fiberglass_panel_holder();
  }

  rotate(a=[0, 0, 270]) {
    translate(v = [-corner_offset - corner_radius + epsilon, corner_offset - fiberglass_holder_total_width / 2 - corner_radius, -bottom_leg_attachment_clip_height / 2]) {
      fiberglass_panel_holder();
    }
  }
}
