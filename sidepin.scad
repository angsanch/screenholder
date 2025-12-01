module sidepin(
	screw_diameter,
	screw_depth,
	pin_depth,
	pin_length
){
	union() {
		cube([
			screw_diameter,
			pin_length,
			pin_depth
		]);

		translate([
			screw_diameter / 2,
			pin_length,
			0
		])
		cylinder(
			screw_depth + pin_depth,
			d1=screw_diameter,
			d2=screw_diameter
		);
	}
}