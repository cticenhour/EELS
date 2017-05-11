length = 80;
width = 10;
height = 5;

//Elementary Entities

Point(1) = {0, width, 0};
Point(2) = {0, width, length};
Point(3) = {0, 0, length};
Point(4) = {0, 0, 0};
Point(5) = {height, width, 0};
Point(6) = {height, width, length};
Point(7) = {height, 0, length};
Point(8) = {height, 0, 0};

// Bottom
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
// Top
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

// NOTE: left/right directions are referenced facing the port, looking down the waveguide
Plane Surface(1) = {1}; // bottom
Plane Surface(2) = {2}; // top
Plane Surface(3) = {3}; // right
Plane Surface(4) = {4}; // left
Plane Surface(5) = {5}; // port
Plane Surface(6) = {6}; // exit

Surface Loop(1) = {1, 2, 3, 4, 5, 6};

Volume(1) = {1};

// Physical Entities

Physical Surface("walls") = {1, 3, 2, 4};
Physical Surface("port") = {5};
Physical Surface("exit") = {6};

Physical Volume(1) = {1};
