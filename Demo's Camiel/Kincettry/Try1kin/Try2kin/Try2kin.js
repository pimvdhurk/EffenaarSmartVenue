import KinectPV2.*;  
KinectPV2 kinect;  

void setup() {   
  size(1024, 768);   
  kinect = new KinectPV2(this);   
  kinect.enableDepthMaskImg(true);
  kinect.enableSkeletonDepthMap(true);
  kinect.enableColorImg(true);
  kinect.enableFaceDetection(true);
  kinect.init();
}  
void draw() {
  background(0);
  image(kinect.getColorImage(), 0, 0);
  
  //get the face data as an ArrayList 
  ArrayList<FaceData> faceData =  kinect.getFaceData();
  for (int i = 0; i < faceData.size(); i++) {
     FaceData faceD = faceData.get(i);
     if (faceD.isFaceTracked()) {
       //obtain the face data from the colo frame
       PVector [] facePointsColor = faceD.getFacePointsColorMap();
       KRectangle rectFace = faceD.getBoundingRectColor();
       FaceFeatures [] faceFeatures = faceD.getFaceFeatures();
       //get the color of the user
       int col = faceD.getIndexColor();
       fill(col);
       //display the face freatures and states
       for (int j = 0; j < 8; j++) {
          int st   = faceFeatures[j].getState();
          int type = faceFeatures[j].getFeatureType();
          String str = getStateTypeAsString(st, type);
          fill(255);
          text(str, nosePos.x + 150, nosePos.y - 70 + j*25);
        }
      //draw a rectangle around the face
      stroke(255, 0, 0);
      noFill();
      rect(rectFace.getX(), rectFace.getY(), rectFace.getWidth(), rectFace.getHeight());
    }
  }
}
