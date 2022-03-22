include <variables.scad>
include <hinge_bracket.scad>
include <../shared/hinge.scad>

hinge_bracket();

// translate([60, leg_width * 2, leg_width * 2]) {
//   rotate([0, 180, 90]) {
//     hinge_bracket();
//   }
// }

// translate([0, 0, bottom_leg_attachment_clip_height / 2]) {
//   rotate([0, 180, 0]) {
//     hinge(type="top");
//   }
// }

// translate([-20, 55, bottom_leg_attachment_clip_height / 2]) {
//   rotate([0, 180, 180]) {
//     hinge(type="top");
//   }
// }
