include <syringePumpConstants.scad>



wall_thickness = 5;
part_thickness = 8;

frame_width = motor_width + (wall_thickness + 1)*2;
bolt = 4;
height= threadedAxisHeight;

module fake_extrusion(){
    
    translate([wall_thickness+1,-50,-(extrusionThickness/2 +wall_thickness)])  //voodoo
    {
    rotate([0,0,90]){
        cube([100,extrusionThickness,extrusionThickness]);
    }
    }
    
    translate([wall_thickness+nemaWidth+extrusionThickness+1,-55,-(extrusionThickness/2 +wall_thickness)])
    {
    rotate([0,0,90]){
        cube([100,extrusionThickness,extrusionThickness]);
    }
    }
}

rotate([90,0,0]){
translate([0,0,wall_thickness]){
barrel_mount();
}
}
    module barrel_mount()
    {
        //center the whole thing in X
        translate([-frame_width/2, 0, 0])
        {
            difference()
            {
                //positive
                union()
                {
                    translate([0,0,-(frame_width+10)/2]){
                    cube([frame_width, part_thickness, frame_width]);
                        translate([-12,0,10]){
                    cube([frame_width+24, part_thickness, frame_width/2]);    
                        }
                }
            }


//negative
            fake_extrusion();
            rotate([90, 0, 0])
            // todo remove that rotation
                {
                    translate([frame_width/2+0.5, height - 5, -wall_thickness])
                    {
                        translate([0, 0, -10])  //wtf? double voodoo
                        cylinder(r=barrelDiameter/2, h=4*wall_thickness+1);

                    }
                    translate([(barrelDiameter/2)-0.6,-5,-10]){
                    cube([barrelDiameter,barrelDiameter,barrelDiameter]);
                }
                
              translate([-frame_width, -wall_thickness, -part_thickness/2]){
                    rotate([0,90,0]){
                        #cylinder(r=screwRadius,h=frame_width);
                    }
                }
             translate([frame_width, -wall_thickness, -part_thickness/2]){
                    rotate([0,90,0]){
                        #cylinder(r=screwRadius,h=frame_width);
                    }
                }
                
                }
            }
        }
    }
