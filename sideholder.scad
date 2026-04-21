include <sidepin.scad>

module sideholder(
	screw_diameter,
	screw_depth,
	pin_depth,
	overhang,
	pin_lengths,
	distances,
	tilt,
	support
)
{
	assert(len(pin_lengths) == len(distances), "Lengths and distances must be the same length");
	
	let(
		width=max(distances) - min(distances) + screw_diameter,
		left=min(distances)
	) {
	translate([
		0,
		overhang[1],
		overhang[0]
	])
	union (){
		for (i = [0 : len(distances) - 1])
			rotate([0, 0, tilt])
			translate([
				distances[i],
				0,
				0
			])
			sidepin(screw_diameter, screw_depth, pin_depth, pin_lengths[i]);
		
		translate([
			left,
			0,
			0
		])
		linear_extrude(height=pin_depth)
		polygon(points=[
			[0, 0],
			[width * cos(tilt), width * sin(tilt)],
			[width, 0]]
		);
	};

	translate([
		left - support,
		0,
		0
	])
	cube([
		width + support,
		overhang[1],
		overhang[0] + pin_depth
	]);
	};
};