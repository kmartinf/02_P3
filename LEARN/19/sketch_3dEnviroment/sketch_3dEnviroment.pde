//libraries
import peasy.*;
PeasyCam cam;

//Definition
PShape shp_gizmo;


//Passive
void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

//Active
void draw() {
  rotateX(-.5);
  rotateY(-.5);
  background(0);
  displayGizmo();
  shape(shp_gizmo);
}

//Axis
public void displayGizmo() {
  if (shp_gizmo == null) {
    strokeWeight(1);
    shp_gizmo = createShape();
    shp_gizmo.beginShape(LINES);
    shp_gizmo.stroke(255, 0, 0); shp_gizmo.vertex(0, 0, 0); shp_gizmo.vertex(10, 0, 0);
    shp_gizmo.stroke(0, 255, 0); shp_gizmo.vertex(0, 0, 0); shp_gizmo.vertex(0, 10, 0); 
    shp_gizmo.stroke(0, 0, 255); shp_gizmo.vertex(0, 0, 0); shp_gizmo.vertex(0, 0, 10); 
    shp_gizmo.endShape();
  }
}
