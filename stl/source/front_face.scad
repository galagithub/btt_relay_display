// LICENSE: Attribution 4.0 International
// Copyright: Dragos GALALAE - 2024
//
// front face shell
//
// requires 4 M2.5 heat inserts!

pcb_x = 30;
pcb_y = 20;
pcb_tolerance = 1;
pcb_thickness = 2;
screws_x = 24;
screws_y = 14;
screws_mth_peg_z = 8;
screws_mth_peg_dia = 6;
screws_mth_insert_dia = 3.6;
led_on_x = 5.5;
led_on_y = 10;
led_off_x = 12.5;
led_off_y = 10;
led_hole_dia = 3.5;
led_peg_dia = 6;
led_peg_z = 6;
btn_x = 20.5;
btn_y = 10;
btn_hole_dia = 4;
btn_peg_dia = 8;
btn_peg_z = 2;
btn_hat_lip_thick = 0.8;
btn_hat_lip_dia = btn_peg_dia-1.5;
btn_hat_z = 4;
btn_hat_dia = btn_hole_dia-0.5;
face_wall = 2;
text_depth = 0.4;
text_size = 2.5;
text_above = 1;
do_button_hat = 1;

screws_mth_insert_depth = screws_mth_peg_z-face_wall;
pcb_hole_x = pcb_x+pcb_tolerance;
pcb_hole_y = pcb_y+pcb_tolerance;
screws_x_offset = (pcb_hole_x-screws_x)/2-pcb_tolerance/2;
screws_y_offset = (pcb_hole_y-screws_y)/2-pcb_tolerance/2;
pcb_hole_z = screws_mth_peg_z+pcb_thickness+pcb_tolerance;
text_position = (text_above)?(-(btn_hole_dia+1)):(btn_hole_dia+1);
$fn=64;

// front face
difference()
{
    // main body 
    union() {
        // pcb mth pegs
        translate([screws_x_offset,screws_y_offset,0]) {
            translate([0,0,0]) cylinder(screws_mth_peg_z,screws_mth_peg_dia/2,screws_mth_peg_dia/2);
            translate([screws_x,0,0]) cylinder(screws_mth_peg_z,screws_mth_peg_dia/2,screws_mth_peg_dia/2);
            translate([screws_x,screws_y,0]) cylinder(screws_mth_peg_z,screws_mth_peg_dia/2,screws_mth_peg_dia/2);
            translate([0,screws_y,0]) cylinder(screws_mth_peg_z,screws_mth_peg_dia/2,screws_mth_peg_dia/2);
        }
        // pcb pegs stiffner left bottom
        for(a=[0,screws_mth_peg_dia/2])
            translate([-pcb_tolerance/2+a,-pcb_tolerance/2,0]) cube([screws_mth_peg_dia/2,screws_mth_peg_dia/2,screws_mth_peg_z]);
        translate([-pcb_tolerance/2,-pcb_tolerance/2+screws_mth_peg_dia/2,0]) cube([screws_mth_peg_dia/2,screws_mth_peg_dia/2,screws_mth_peg_z]);
        // pcb pegs stiffner right bottom
        for(a=[1,2])
            translate([pcb_hole_x-screws_mth_peg_dia/2*a-pcb_tolerance/2,-pcb_tolerance/2,0]) cube([screws_mth_peg_dia/2,screws_mth_peg_dia/2,screws_mth_peg_z]);
        translate([pcb_hole_x-screws_mth_peg_dia/2-pcb_tolerance/2,screws_mth_peg_dia/2-pcb_tolerance/2,0]) cube([screws_mth_peg_dia/2,screws_mth_peg_dia/2,screws_mth_peg_z]);
        // pcb pegs stiffner right upper
        for(a=[1,2])
            translate([pcb_hole_x-screws_mth_peg_dia/2*a-pcb_tolerance/2,pcb_hole_y-screws_mth_peg_dia/2-pcb_tolerance/2,0]) cube([screws_mth_peg_dia/2,screws_mth_peg_dia/2,screws_mth_peg_z]);
        translate([pcb_hole_x-screws_mth_peg_dia/2-pcb_tolerance/2,pcb_hole_y-screws_mth_peg_dia-pcb_tolerance/2,0]) cube([screws_mth_peg_dia/2,screws_mth_peg_dia/2,screws_mth_peg_z]);
        // pcb pegs stiffner left upper
        for(a=[0,screws_mth_peg_dia/2])
            translate([-pcb_tolerance/2+a,pcb_hole_y-screws_mth_peg_dia/2-pcb_tolerance/2,0]) cube([screws_mth_peg_dia/2,screws_mth_peg_dia/2,screws_mth_peg_z]);
        translate([-pcb_tolerance/2,pcb_hole_y-screws_mth_peg_dia-pcb_tolerance/2,0]) cube([screws_mth_peg_dia/2,screws_mth_peg_dia/2,screws_mth_peg_z]);
        // led pegs
        translate([led_on_x,led_on_y,0]) cylinder(led_peg_z,led_peg_dia/2,led_peg_dia/2);
        translate([led_off_x,led_off_y,0]) cylinder(led_peg_z,led_peg_dia/2,led_peg_dia/2);
        // button
        translate([btn_x,btn_y,0]) cylinder(btn_peg_z,btn_peg_dia/2,btn_peg_dia/2);
        // face
        translate([-pcb_tolerance/2,-pcb_tolerance/2,0]) cube([pcb_hole_x,pcb_hole_y,face_wall]);
        // wall left
        translate([-pcb_tolerance/2-face_wall,-pcb_tolerance/2,0]) cube([face_wall,pcb_hole_y,pcb_hole_z]);
        // wall right
        translate([pcb_hole_x-pcb_tolerance/2,-pcb_tolerance/2,0]) cube([face_wall,pcb_hole_y,pcb_hole_z]);
        // wall bot
        translate([-pcb_tolerance/2-face_wall,-pcb_tolerance/2-face_wall,0]) cube([pcb_hole_x+2*face_wall,face_wall,pcb_hole_z]);
        // wall top
        translate([-pcb_tolerance/2-face_wall,pcb_hole_y-pcb_tolerance/2,0]) cube([pcb_hole_x+2*face_wall,face_wall,pcb_hole_z]);
    }
    // cutouts
    union() {
        // pcb mth holes
        translate([screws_x_offset,screws_y_offset,screws_mth_peg_z-screws_mth_insert_depth]) {
            translate([0,0,0]) cylinder(screws_mth_insert_depth+0.01,screws_mth_insert_dia/2,screws_mth_insert_dia/2);
            translate([screws_x,0,0]) cylinder(screws_mth_insert_depth+0.01,screws_mth_insert_dia/2,screws_mth_insert_dia/2);
            translate([screws_x,screws_y,0]) cylinder(screws_mth_insert_depth+0.01,screws_mth_insert_dia/2,screws_mth_insert_dia/2);
            translate([0,screws_y,0]) cylinder(screws_mth_insert_depth+0.01,screws_mth_insert_dia/2,screws_mth_insert_dia/2);
        }
        // led holes
        translate([led_on_x,led_on_y,-0.005]) cylinder(led_peg_z+0.01,led_hole_dia/2,led_hole_dia/2);
        translate([led_off_x,led_off_y,-0.005]) cylinder(led_peg_z+0.01,led_hole_dia/2,led_hole_dia/2);
        // button hole
        translate([btn_x,btn_y,-0.005]) cylinder(btn_peg_z+0.01,btn_hole_dia/2,btn_hole_dia/2);
        // "text" on
        translate([led_on_x,led_on_y+text_position,-0.005]) rotate([0,0,180])
        mirror([1,0,0]) linear_extrude(height=text_depth) {
            text("I",size=text_size,font="Verdana:style=Bold",direction="ltr",halign="center",valign="center");
        }
        // "text" off
        translate([led_off_x,led_off_y+text_position,-0.005]) rotate([0,0,180])
        mirror([1,0,0]) linear_extrude(height=text_depth) {
            text("O",size=text_size,font="Verdana:style=Bold",direction="ltr",halign="center",valign="center");
        }
        // "text" reset
        translate([btn_x,btn_y+text_position,-0.005]) rotate([0,0,180])
        mirror([1,0,0]) linear_extrude(height=text_depth) {
            text("R",size=text_size,font="Verdana:style=Bold",direction="ltr",halign="center",valign="center");
        }
    }
}

if (do_button_hat)
{
    // reset button
    translate([0,pcb_hole_y+btn_peg_dia/2+face_wall+2,0]) {
        cylinder(btn_hat_lip_thick,btn_hat_lip_dia/2,btn_hat_lip_dia/2);
        cylinder(btn_hat_z+btn_hat_lip_thick,btn_hat_dia/2,btn_hat_dia/2);
    }
}