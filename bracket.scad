$fa = 1;
$fs = 0.4;

epsilon = 0.001;

// The width of each table leg.
// The legs are square, so this is also the length.
leg_width = 38.1;

// The radius for screw holes.
screw_hole_radius = 3.0;

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
cone_large_r = (leg_width / 2) - (3 * 2);
cone_height = bottom_leg_attachment_total_height - bottom_leg_attachment_anchor_height - 5.0;

// The primary corner radius
corner_radius = 1;

// The center point of each of the 3 standard rounded corners
corner_offset = leg_width / 2 - corner_radius;

// The radius of the cylinder carved out to fit the hinge
hinge_enclosure_radius = 8;

// The outer radius of the hinge itself
hinge_outer_radius = 7.5;

// The radius of the hinge hole (that slides onto the hingle pole)
hinge_hole_inner_radius = 4.5;

// The radius of the hinge pole
hinge_pole_inner_radius = 4.0;

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
      cylinder(h=cone_height, r1=cone_large_r, r2=cone_small_r, center=true);
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
