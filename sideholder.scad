include <sidepin.scad>

module sideholder(
	screw_diameter,
	screw_depth,
	pin_depth,
	overhang,
	pin_lengths,
	distances
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
		cube([
			width,
			screw_diameter,
			pin_depth
		]);
	};

	translate([
		left,
		0,
		0
	])
	cube([
		width,
		overhang[1],
		overhang[0] + pin_depth
	]);
	};
};