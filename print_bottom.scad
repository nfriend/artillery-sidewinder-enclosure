include <variables.scad>
use <hinge_bracket.scad>
use <regular_bracket.scad>
use <regular_bracket_anchor.scad>
use <hinge_bracket_anchor.scad>
use <hinge.scad>

// I somehow ended up accidentially modeling everything upside down.
// This top-level rotation flips everything so it's right-side up.
rotate(a=[0, 180, 0]) {

  translate(v=[0, 0, -bottom_leg_attachment_anchor_height / 2]) {
    translate(v=[-45, -20, 0]) {
      regular_bracket_anchor();
    }

    translate(v=[-45, 65, 0]) {
      regular_bracket_anchor();
    }

    translate(v=[45, 90, 0]) {
      hinge_bracket_anchor();
    }

    translate(v=[45, -45, 0]) {
      rotate(a=[0, 0, 270]) {
        hinge_bracket_anchor();
      }
    }
  }

  translate(v=[0, 0, -bottom_leg_attachment_clip_height / 2]) {
    rotate(a=[0, 0, 90]) {
      regular_bracket();
    }

    translate(v=[0, 45, 0]) {
      rotate(a=[0, 0, 0]) {
        regular_bracket();
      }
    }

    translate(v=[45, 45, 0]) {
      rotate(a=[0, 0, 180]) {
        hinge_bracket();
      }
    }

    translate(v=[45, 0, 0]) {
      mirror(v= [1, 0, 0]) {
        hinge_bracket();
      }
    }

    translate(v=[0, -85, 0]) {
      rotate(a=[0, 180, 0]) {
        hinge();
      }
    }

    translate(v=[-15, -30, 0]) {
      rotate(a=[0, 180, 180]) {
        hinge();
      }
    }
  }
}
