// https://openhome.cc/eGossip/OpenSCAD/SectorArc.html

module sector(radius, begin, end, fn) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(a = [begin : step : end - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(end), r * sin(end)]]
    );

    difference() {
        circle(radius, $fn = fn); // cilinder
        polygon(points);
    }
}

module arc(radius, begin, end, width, fn) {
    difference() {
        sector(radius + width, begin, end, fn);
        sector(radius, begin, end, fn);
    }
} 


module 3d_arc(height, radius, width, begin, end, fn) {
    linear_extrude(height) arc(radius, begin, end, width, fn);
}


