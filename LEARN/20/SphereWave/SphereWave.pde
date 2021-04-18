int radius = 100;
float nScale = 200;
 
import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
 
float noiseMulti = 300;
 
void setup() {
  size(700, 700, P2D);
  background(0);
  smooth();
  minim = new Minim(this);
  player = minim.loadFile("seenghost.mp3");
  player.loop();
  meta = player.getMetaData();
  beat = new BeatDetect(player.bufferSize(), player.sampleRate());
  beat.setSensitivity(300);
}
 
void draw() {
  noStroke();
  fill(0);
  rect(0, 0, width, height);
  translate(width/2, height/2);
 
  beat.detect(player.mix);
  if (beat.isKick()) {
    noiseMulti = 300;
    nScale = 150;
  } else {
    if (nScale > 100) nScale *= 0.9;
    noiseMulti *= 0.5;
  }
 
  stroke(255);
  for (int lat = -90; lat < 90; lat+=2)
  {
    for (int lng = -180; lng < 180; lng+=2)
    {
      float _lat = radians(lat);  
      float _lng = radians(lng);  
      // noise
      float n = noise(_lat * noiseMulti / 100, _lng * noiseMulti / 100 + millis() );
 
      float x = (radius + n * nScale) * cos(_lat) * cos(_lng);
      float y = (radius + n * nScale) * sin(_lat) * (-1);
      float z = (radius + n * nScale) * cos(_lat) * sin(_lng);
     
      point(x, y, z);
    }
  }
  // saveFrame();
}
 
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
