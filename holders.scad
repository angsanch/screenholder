include <sideholder.scad>

screw_diameter = 3;
screw_depth = 10;
pin_depth = 1;
pin_lengths = [30, 30];
distances = [0, 50];
overhang = [3, 2];
tilt = 15;
support = 30;

$fn = $preview ? 8 : 64;
sideholder(screw_diameter, screw_depth, pin_depth, overhang, pin_lengths, distances, tilt, support);