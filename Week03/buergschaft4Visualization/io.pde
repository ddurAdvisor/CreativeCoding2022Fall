boolean animate = false;

void keyPressed ()
{
  if (key == CODED) {
    if (keyCode == BACKSPACE) vis.displayMode();
    if (keyCode == RIGHT) vis.measureUp();
    if (keyCode == LEFT) vis.measureDown();
  }
  if (key == 'H') vis.toggleHeadline();
  if (key == 'S') vis.toggleAnimationMode();
  if (key == 'A') {
    animate = !animate;
    vis = new Buergschaft (new TextAnalyzer (txtSource, txtInputType, animate), txtTitle);
  }

  /*
  if (keyCode == KeyEvent.VK_M) {
   saveMov = !saveMov;
   if (saveMov) {
   mm = new MovieMaker(this, width, height, "export/" + timestamp() + "_data.mov", 30, MovieMaker.ANIMATION, MovieMaker.HIGH);
   vis = new Buergschaft (new TextAnalyzer (txtSource, txtInputType, animate), txtTitle);
   }
   }
   
   if (keyCode == KeyEvent.VK_E)
   {
   if (saveMov) mm.finish();
   saveMov = false;
   }
   if (keyCode == KeyEvent.VK_P) savePDF = !savePDF;
   if (keyCode == KeyEvent.VK_O) saveFrame ( "export/" + timestamp() + ".png");
   */
}
