/*
Corrupt.video + OpenCV Face Tracking = FaceGLitching
Made with Processing by Recyclism aka Benjamin Gaulon
Paris. May 2014.
Fill free to use / hack / modify this code
*/


import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

PImage photo;
PImage faceSave;

void setup() {
  background(0);
  size(640, 480);

  video = new Capture(this, width, height);
  opencv = new OpenCV(this, width, height);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
}

void draw() {
  scale(1);

  image(video, 0, 0 );
  noFill();
  noStroke();
  strokeWeight(1);
 
  

 

    photo = loadImage("partialSave.jpg");
    rect(0, 0, width, height);
   
   PImage partialSave = get(0, 0, width, height);
   partialSave.save("partialSave.jpg");
  
 
   byte b[] = loadBytes("partialSave.jpg");
   
   // glitch faces
   
     byte bCopy[] = new byte[b.length];
     arrayCopy(b, bCopy);
     // load binary of file

     int scrambleStart = 10;
     // scramble start excludes 10 bytes///
     
     int scrambleEnd = b.length;
     // scramble end ///
     
     int nbOfReplacements = int (random(1, 30));
     // Number of Replacements - Go easy with this as too much will just kill the file ///

     // Swap bits ///
     for(int g = 0; g < nbOfReplacements; g++)

     {
       int PosA = int(random (scrambleStart, scrambleEnd));

       int PosB = int(random (scrambleStart, scrambleEnd));

       byte tmp = bCopy[PosA];

       bCopy[PosA] = bCopy[PosB];

       bCopy[PosB] = tmp;

    saveBytes("partialSave.jpg", bCopy);
     }

    
  image(photo, 0, 0, width, height );
 
 
 
}

void captureEvent(Capture c) {
  c.read();
}