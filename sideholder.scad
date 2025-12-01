include <sidepin.scad>

module sideholder(
	screw_diameter,
	screw_depth,
	pin_depth,
	pin_lengths,
	distances
)
{
	assert(len(pin_lengths) == len(distances), "Lengths and distances must be the same length");
	
	for (i = [0 : len(distances) - 1])
		translate([
			distances[i],
			0,
			0
		])
		sidepin(screw_diameter, screw_depth, pin_depth, pin_lengths[i]);
	
	translate([
		min(distances),
		0,
		0
	])
	cube([
		max(distances) - min(distances),
		screw_diameter,
		pin_depth
	]);
};