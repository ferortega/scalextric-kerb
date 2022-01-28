// kerb

kerb_length = 80; // mm
kerb_width = 39; // mm
kerb_height = 8.5; // mm
kerb_angle = 0.2; // %

linear_extrude(kerb_height) polygon([
    [0, 0], 
    [kerb_length, 0], 
    [kerb_length * kerb_angle, kerb_width], 
    [0, kerb_width]
]);

// hooks

hook_width = 8; // mm
hook_bend_height = 2.2; // mm
hook_bend_length = 2.1; // mm
hook_barb_height = 6; // mm
hook_barb_length = 1; // mm

linear_extrude(hook_bend_height) polygon([
    [0.05*kerb_length, 0], 
    [0.05*kerb_length + hook_width, 0], 
    [0.05*kerb_length + hook_width, -hook_bend_length], 
    [0.05*kerb_length, -hook_bend_length]
]);


linear_extrude(hook_barb_height) polygon([
    [0.05*kerb_length, -hook_bend_length], 
    [0.05*kerb_length + hook_width, -hook_bend_length], 
    [0.05*kerb_length + hook_width, -hook_bend_length-hook_bend_length], 
    [0.05*kerb_length, -hook_bend_length-hook_bend_length]
]);

linear_extrude(hook_bend_height) polygon([
    [0.95*kerb_length - hook_width, 0], 
    [0.95*kerb_length, 0], 
    [0.95*kerb_length, -hook_bend_length], 
    [0.95*kerb_length - hook_width, -hook_bend_length]
]);


linear_extrude(hook_barb_height) polygon([
    [0.95*kerb_length - hook_width, -hook_bend_length], 
    [0.95*kerb_length, -hook_bend_length], 
    [0.95*kerb_length, -hook_bend_length-hook_bend_length], 
    [0.95*kerb_length - hook_width, -hook_bend_length-hook_bend_length]
]);

// strips

strip_count = 1; // #
strip_width = 0.5; // %
strip_length = 0.7; // %
strip_height = 0.2; // mm

for(i = [0 : strip_count - 1]) {
    strip_size = strip_width * kerb_length * kerb_angle / strip_count;
    strip_offset = i * kerb_length * kerb_angle / strip_count + (1-strip_width) * kerb_length * kerb_angle / (2 * strip_count);

    linear_extrude(kerb_height + strip_height) polygon([
        [strip_offset, kerb_width],
        [strip_offset + strip_size, kerb_width],
        [strip_offset + strip_size, (1-strip_length) * kerb_width],
        [strip_offset, (1-strip_length) * kerb_width]
    ]);
}