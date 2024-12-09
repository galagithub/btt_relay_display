// LICENSE: Attribution 4.0 International
// Copyright: Dragos GALALAE - 2024
//
// front face

pcb_x = 30;
pcb_y = 20;
pcb_tolerance = 1;
pcb_thickness = 2;
screws_x = 24;
screws_y = 14;
screws_mth_peg_z = 10;
screws_mth_peg_dia = 5.6;
screws_mth_insert_dia = 3.6;
screws_mth_insert_depth = 8;
led_on_x = 5.5;
led_on_y = 10;
led_off_x = 12.5;
led_off_y = 10;
led_hole_dia = 3.5;
led_peg_dia = 8;
led_peg_z = 7;
btn_x = 20.5;
btn_y = 10;
btn_hole_dia = 4;
btn_peg_dia = 9;
btn_peg_z = 4;
face_wall = 2;

screws_x_offset = (pcb_x-screws_x)/2;
screws_y_offset = (pcb_y-screws_y)/2;
pcb_hole_x = pcb_x+pcb_tolerance;
pcb_hole_y = pcb_y+pcb_tolerance;
pcb_hole_z = screws_mth_peg_z+pcb_thickness+pcb_tolerance;
$fn=64;

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
}
}