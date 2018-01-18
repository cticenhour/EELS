L = 10;
W = 20;
H = 80;
A = -1.996;
B = 9.799;
C = 17.6;
D = 13.79;
E = 19.597;
F = 4;

//Elementary Entities
  // points at port (right handed coordinate system)
Point(1) = {0, 0, 0};
Point(2) = {A, B, 0};
Point(3) = {C, D, 0};
Point(4) = {E, F, 0};

  //points at exit
Point(5) = {0, 0, H};
Point(6) = {A, B, H};
Point(7) = {C, D, H};
Point(8) = {E, F, H};

// Bottom (port)
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
// Top (exit)
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 5};
// Vertical Lines
Line(9) = {1, 5};
Line(10) = {2, 6};
Line(11) = {3, 7};
Line(12) = {4, 8};

Line Loop(1) = {1, 2, 3, 4};
Line Loop(2) = {5, 6, 7, 8};
Line Loop(3) = {1, 10, -5, -9};
Line Loop(4) = {-3, 11, 7, -12};
Line Loop(5) = {4, 9, -8, -12};
Line Loop(6) = {-2, 10, 6, -11};

// NOTE: labels are referenced facing the port, looking "down" the waveguide (in pos. Z direction, pos. X axis pointing left, pos. Y axis pointing up)
Plane Surface(1) = {1}; // port
Plane Surface(2) = {2}; // exit
Plane Surface(3) = {3}; // right
Plane Surface(4) = {4}; // left
Plane Surface(5) = {5}; // bottom
Plane Surface(6) = {6}; // top

Surface Loop(1) = {1, 2, 3, 4, 5, 6};

Volume(1) = {1};

// Physical Entities

//Physical Surface("walls") = {3, 4, 5, 6};
Physical Surface("top") = {6};
Physical Surface("bottom") = {5};
Physical Surface("left") = {4};
Physical Surface("right") = {3};
Physical Surface("port") = {1};
Physical Surface("exit") = {2};

Physical Volume(1) = {1};
