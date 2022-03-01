$fa = 1;
$fs = 0.4;

epsilon = 0.001;

// The width of each table leg.
// The legs are square, so this is also the length.
leg_width = 38.1;

// The radius for screw holes.
screw_hole_radius = 1.0;

// The height of all bottom leg attachments, when
// stacked in their final arrangement
bottom_leg_attachment_total_height = 25.4;

// The height of the narrow portion of the bottom
// leg attachment anchor piece
bottom_leg_attachment_anchor_height = 2.0;

// The height of the upper clip of the bottom leg attachment.
bottom_leg_attachment_clip_height = bottom_leg_attachment_total_height - bottom_leg_attachment_anchor_height;

// The dimensions of the conical protrusion that
// attach to the base
cone_small_r = 8;
cone_large_r = (leg_width / 2) - (2.5 * 2);
cone_height = bottom_leg_attachment_total_height - bottom_leg_attachment_anchor_height - 5.0;

difference() {
  cube([leg_width, leg_width, bottom_leg_attachment_clip_height], center=true);

  cone_z_translation = (cone_height / 2) - (bottom_leg_attachment_clip_height / 2) + (bottom_leg_attachment_clip_height - cone_height) + epsilon;

  // Cut out the cone shape
  translate(v = [0, 0, cone_z_translation]) {
    rotate(a = [0,180,0]) {
      cylinder(h=cone_height, r1=cone_large_r, r2=cone_small_r, center=true);
    }
  }

  // Cut out the screw hole
  cylinder(h=bottom_leg_attachment_total_height * 2, r=screw_hole_radius, center=true);

  // Cut out clearance for the screw head
  translate(v = [0, 0, cone_z_translation - 2.0]) {
    cylinder(h=cone_height, r=(cone_small_r + screw_hole_radius) / 2, center=true);
  }
}
