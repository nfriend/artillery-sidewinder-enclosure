use <hinge_bracket.scad>
use <regular_bracket.scad>

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
