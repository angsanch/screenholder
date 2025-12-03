include <sideholder.scad>

screw_diameter = 4;
screw_depth = 5;
pin_depth = 0.4;
pin_lengths = [26, 23, 23, 26];
distances = [0, 14, 48, 62];
overhang = [3, 1];

$fn = $preview ? 8 : 64;
sideholder(screw_diameter, screw_depth, pin_depth, overhang, pin_lengths, distances);