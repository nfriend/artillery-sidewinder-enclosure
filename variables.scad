$fa = 1;
$fs = 0.4;

epsilon = 0.001;

// The width of each table leg.
// The legs are square, so this is also the length.
leg_width = 38.1;

// The radius for screw holes.
screw_hole_radius = 3.0;

// The depth of the cutout that makes space for the screw head
screw_head_clearance_depth = 2.0;

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

// The radius of the cutout that makes space for the screw head
screw_head_clearance_radius = (cone_small_r + screw_hole_radius) / 2;

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

// The length of the hinge
hinge_length = 50.0;

// The width of the fiberglass panels
fiberglass_width = 3.0;

// The width of the material on either side of the fiberglass panel
// that holds the panels in place
fiberglass_holder_width = 2.0;

// The total width of the fiberglass panel holders
fiberglass_holder_total_width = fiberglass_width + fiberglass_holder_width * 2;

// The amount of material underneath the base of the hinge pole
hinge_pole_base_thickness = 5;
