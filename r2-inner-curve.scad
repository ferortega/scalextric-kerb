// https://openhome.cc/eGossip/OpenSCAD/SectorArc.html

// width is the angle
// lenght is distance from the center of the circunference
// height is the thinkness

include <3d_arc.scad>

fn = 1000;

// kerb

kerb_radius = 214; // mm
kerb_length = 39; // mm
kerb_height = 8.5; // mm
kerb_width = 45; // deg

3d_arc(kerb_height, kerb_radius - kerb_length, kerb_length, 0, kerb_width, fn);

// hooks

hook_offset = 2; // deg
hook_width = 2; // deg
hook_bend_height = 2.2; // mm
hook_bend_lentgh = 2.4; // mm
hook_barb_height = 6; // mm
hook_barb_lentgh = 1; // mm

3d_arc(hook_bend_height, kerb_radius, hook_bend_lentgh, hook_offset, hook_offset + hook_width, fn);
3d_arc(hook_barb_height, kerb_radius + hook_bend_lentgh, hook_barb_lentgh, hook_offset, hook_offset + hook_width, fn);

3d_arc(hook_bend_height, kerb_radius, hook_bend_lentgh, kerb_width - hook_offset, kerb_width - hook_offset - hook_width, fn);
3d_arc(hook_barb_height, kerb_radius + hook_bend_lentgh, hook_barb_lentgh, kerb_width - hook_offset, kerb_width - hook_offset - hook_width, fn);

// strips

strip_count = 9; // #
strip_width = 0.5; // %
strip_length = 0.7; // %
strip_height = 0.2; // mm

strip_angle = kerb_width / strip_count;

for(i = [0 : strip_count - 1]) {
    strip_offset = i * strip_angle;
    strip_center = strip_offset + strip_angle / 2;
    begin = strip_center - strip_width * strip_angle / 2;
    end = strip_center + strip_width * strip_angle / 2;

    3d_arc(kerb_height + strip_height, kerb_radius - kerb_length, strip_length * kerb_length, begin, end, fn);
}
