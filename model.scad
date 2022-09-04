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

module spring(length, width) {
    union() {
        translate([-length/2-1.8,0,0]) spring_end(width);
        translate([length/2+1.8,0,0]) spring_end(width);
        translate([-length/2,-1,0]) cube([length,2,width]);
        translate([0,-2,0]) rubber_band_clip(width);
        translate([-length/4,-2,0]) rubber_band_clip(width);
        translate([length/4,-2,0]) rubber_band_clip(width);
    }
}

module end(length, width) {
    difference() {
        hull() for(i = [0,90,180,270]) {
            rotate([0,0,i]) translate([-width/2-2,-17.5,length/2-0.8]) cube([width+4,5,5]);
        }

        union() {
            for(i = [0,90,180,270]) {
                rotate([0,0,i]) translate([-width/2-10,-15,length/2+1.8])rotate([0,90,0]) cylinder(h=width+20,d=3.6,$fn=36);
            }
            for(i = [0,90,180,270]) {
            rotate([0,0,i]) translate([-width/2-0.5,-15,length/2+1.8])   rotate([0,90,0]) cylinder(h=width+1,d=8,$fn=36);
            }
            for(i = [0,90,180,270]) {
                rotate([0,0,i]) translate([-width/2-8.5,-15,length/2+1.8])rotate([0,90,0]) cylinder(h=5,d=7.25,$fn=36);
            
            rotate([0,0,i]) translate([-width/2+13.5,-15,length/2+1.8])rotate([0,90,0]) cylinder(h=5,d=7.25,$fn=36);
            }
            
        translate([0,0,length/2-1]) cylinder(h=6,d=4,$fn=36);
        }
    }
}

length = 50;
width = 10;

//for(i = [0,90,180,270]) {
//    rotate([0,0,i]) translate([-width/2,15,0]) rotate([0,90,0]) spring(length, width);    
//}

end(length, width);
//translate([0,0,0]) rotate([180,0,0]) end(length, width);

//spring(length, width);


