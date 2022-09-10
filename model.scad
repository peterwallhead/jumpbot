module spring_end(width) {
    difference() {
        cylinder(h=width,d=5,$fn=36);
        translate([0,0,-1]) cylinder(h=width+2,d=3.6,$fn=36);
    }
}

module rubber_band_clip(width) {
   difference() {
       cylinder(h=width,d=6,$fn=36); 
       translate([0,0,-1]) cylinder(h=width+2,d=4,$fn=36);
   }
}

module spring(length, width, thickness) {
    union() {
        translate([-length/2-1.8,0,0]) spring_end(width);
        translate([length/2+1.8,0,0]) spring_end(width);
        translate([-length/2,-thickness/2,0]) cube([length,thickness,width]);
        translate([0,-thickness,0]) rubber_band_clip(width);
        translate([-length/4,-thickness,0]) rubber_band_clip(width);
        translate([length/4,-thickness,0]) rubber_band_clip(width);
    }
}

module end(length, width) {
    difference() {
        hull() for(i = [0,90,180,270]) {
            rotate([0,0,i]) translate([-width/2-2,-20,length/2-2]) cube([width+4,5,10]);
        }

        union() {
            for(i = [0,90,180,270]) {
                rotate([0,0,i]) translate([-width/2-10,-16.5,length/2+1.8])rotate([0,90,0]) cylinder(h=width+20,d=4.4,$fn=36);
            }
            for(i = [0,90,180,270]) {
                rotate([0,0,i]) translate([-width/2-0.5,-16.5,length/2+1.8])   rotate([0,90,0]) cylinder(h=width+1,d=11,$fn=36);
            }
            
            for(i = [0,90,180,270]) {
                rotate([0,0,i]) translate([-14,-16.5,length/2+1.8])   rotate([0,90,0]) cylinder(h=6,d=6,$fn=36);
                rotate([0,0,i]) translate([8,-16.5,length/2+1.8])   rotate([0,90,0]) cylinder(h=6,d=6,$fn=36);
            }
            
            
        translate([0,0,length/2-3]) cylinder(h=13,d=4,$fn=36);
        }
    }
}

length = 100;
width = 10;
thickness = 3;

//for(i = [0,90,180,270]) {
//    rotate([0,0,i]) translate([-width/2,16.5,0]) rotate([0,90,0]) spring(length, width, thickness);    
//}

end(length, width);
//translate([0,0,0]) rotate([180,0,0]) end(length, width);

//spring(length, width, thickness);


