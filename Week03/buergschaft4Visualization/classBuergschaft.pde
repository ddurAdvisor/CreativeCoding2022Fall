class Buergschaft
{
  private Word [] txt;
  private int fullSize, aninmationCount, animationMode = 1;
  private PVector pos = new PVector (width /2, height / 2);
  private float measure = 0.25;
  private float dBig = 300, dSmal = 150;
  private float strokeW = 0.5;
  private TextDisplayer rawTxt, listed;
  private PGraphics pg; 
  private HashMap colors;
  private String title;
  private PFont font;
  private boolean showText, showHeadline, animate;
  private TextAnalyzer textAnalyzer;

  public Buergschaft (TextAnalyzer txt, String title)
  {
    this.animate = txt.getMode();
    this.txt = txt.getWordArray();
    this.title = title;
    this.font = createFont ("Rockwell", 24);
    fullSize = txt.getFullSize();
    showText = false;
    showHeadline = true;
    if (animate) {
      this.textAnalyzer = txt;
      aninmationCount = 0;
    }

    HashMap txtColors = new HashMap();
    txtColors.put ("text", new Integer (color (0, 0, 20)));
    txtColors.put ("highlight", new Integer (color (355, 95, 50)));
    txtColors.put ("bg", new Integer (color (0, 0, 97, 15)));
    txtColors.put ("scrollbar", new Integer (color (0, 0, 3, 150)));
    txtColors.put ("scrollbarBG", new Integer (color (0, 0, 3, 60))); 

    int [] bordersBlock = {
      110, 70, 350, 600, 15
    };   

    int [] bordersList = {
      500, 70, 250, 600, 15
    };   

    pg = createGraphics (width, height, JAVA2D);

    rawTxt = new TextDisplayer (txt.getRawTxt(), bordersBlock, 12, txtColors, false);
    listed = new TextDisplayer (wordArrayToStringArray(this.txt), bordersList, 12, txtColors, true);

    colors = new HashMap();
    colors.put ("stroke", new Integer (color (0, 0, 3, 80)));
    colors.put ("bg", new Integer (color (0, 0, 97)));
    colors.put ("bgRect", new Integer (color (0, 0, 92)));
    colors.put ("highlight", new Integer (color (355, 95, 50)));
    colors.put ("ellipse", new Integer (color (0, 0, 20)));
    colors.put ("ellipseStroke", new Integer (color (355, 95, 50, 200)));
    colors.put ("connections", new Integer (color (0, 0, 3, 30)));

    if (showText) createBluredBG();
  }

  // ----------------------------------------------------------------------------------------------------
  // IO / Set / Get
  // ----------------------------------------------------------------------------------------------------

  public void measureUp ()
  {
    measure += 0.01;
    if (measure > 1.0) measure = 1.0;
  }

  public void measureDown ()
  {
    measure -= 0.01;
    if (measure < 0.0) measure = 0.0;
  }

  public void displayMode ()
  {
    showText = !showText;

    if (showText) createBluredBG ();
    else colorMode (HSB, 360, 100, 100, 255);
  }

  public void toggleHeadline ()
  {
    showHeadline = !showHeadline;

    createBluredBG ();
  }
  
  public void toggleAnimationMode ()
  {
    animationMode++;
    if (animationMode > 1) animationMode = 0;
  }

  private void createBluredBG ()
  {
    colorMode (RGB, 255, 255, 255, 255);
    pg.beginDraw();
    pg.smooth();
    displayBG (true, 10);
    displayGraph(true);
    if (showHeadline) displayHeadline(true, 0, int (height/2.0 - height/5.0), 30, 15);
    pg.endDraw();
    rawTxt.setBG(createCroppedImg(pg, rawTxt.getX(), rawTxt.getY(), rawTxt.getWidth(), rawTxt.getHeight()));
    listed.setTxt(wordArrayToStringArray(txt));
    listed.setBG(createCroppedImg(pg, listed.getX(), listed.getY(), listed.getWidth(), listed.getHeight()));
  }

  private PImage createCroppedImg (PImage source, int x, int y, int w, int h)
  {
    PImage blur = createImage (source.width, source.height, ARGB);
    System.arraycopy(source.pixels, 0, blur.pixels, 0, blur.pixels.length);
    fastblur(blur, 30);
    PImage result = createImage (w, h, ARGB);

    source.loadPixels();

    int count = 0;
    for (int i = y; i < y+h; i++)
    {
      for (int j = x; j < x+w; j++)
      {
        int index = j+i*blur.height;
        result.pixels[count] = blur.pixels[index];
        count++;
      }
    }
    result.updatePixels();
    return result;
  }

  // ----------------------------------------------------------------------------------------------------
  // Switch
  // ----------------------------------------------------------------------------------------------------

  public void display()
  {
    if (showText)
    {
      image (pg, 0, 0);
      rawTxt.display();
      listed.display();
    }
    else {
      if (animate)
      {
        if (textAnalyzer.getAnimation())
        {
          textAnalyzer.createWordArrayList("utf", aninmationCount);
          txt = textAnalyzer.getWordArray();
          aninmationCount++;
        }
      }
      displayBG(false, 10);
      displayGraph(false);
      if (showHeadline) displayHeadline(false, 0, int (height/2.0 - height/5.0), 30, 15);
    }
  }

  private void displayBG (boolean writeToImage, int padd)
  {
    if (writeToImage)
    {
      pg.background ((Integer) colors.get("bg"));
      pg.noStroke();
      pg.fill ((Integer) colors.get("bgRect"));
      pg.rect (padd, padd, width-padd*2, height-padd*2);
    }
    else
    {
      background ((Integer) colors.get("bg"));
      noStroke();
      fill ((Integer) colors.get("bgRect"));
      rect (padd, padd, width-padd*2, height-padd*2);
    }
  }

  private void displayHeadline (boolean writeToImage, int x, int y, int s, int padd)
  {

    color c = (Integer) colors.get("highlight");

    if (writeToImage)
    {
      pg.textFont (this.font, s);
      pg.textAlign (LEFT);
      pg.noStroke();

      pg.fill (red (c), green(c), blue (c), 200);
      pg.rect (x, y, padd*2 + textWidth (title), s*1.4);

      pg.fill ((Integer) colors.get("bgRect"));
      pg.text (title, x+padd, y+s);
    }
    else {
      textFont (this.font, s);
      textAlign (LEFT);
      noStroke();

      fill (hue (c), saturation(c), brightness (c), 200);
      rect (x, y, padd*2 + textWidth (title), s*1.4);

      fill ((Integer) colors.get("bgRect"));
      text (title, x+padd, y+s);
    }
  }

  // ----------------------------------------------------------------------------------------------------
  // Graph
  // ----------------------------------------------------------------------------------------------------

  private void displayGraph (boolean writeToImage)
  {
    textFont (font);
    float angle = 0.0;
    float steps = 360.0 / (float) fullSize;
    if (animationMode == 1 && animate) {
      if (textAnalyzer.getAnimation()) {
        if (aninmationCount != 0) steps = 360.0 / (float) aninmationCount;
        else steps = 360.0;
      }
      else steps = 360.0 / (float) fullSize;
    }
    boolean active = false, hover = false;
    int id = -1;
    int [] index;

    for (int i = 0; i < txt.length; i++)
    {
      hover = false;
      index = txt[i].getIndex();

      angle += steps*(float) index.length/2.0;

      PVector p1 = createPos (angle, dBig, pos);  

      if (!active && checkHover(p1.x, p1.y, steps*(float) index.length*2.0)) 
      {
        addText (str (txt[i].getCount()) + "x " + txt[i].getTxt(), pos.x, 40, 24, "center", 'u');
        active = true;
        hover = true;
        id = i;
      }
      else {       
        hover = false;
      }

      showConnections (writeToImage, angle, index, i, p1);

      showWordIndex (writeToImage, index, p1.x, p1.y, steps*(float) index.length*4.0, angle, strokeW, hover);
      //addEllipse (p1.x, p1.y, steps*(float) index.length*4.0, txt[i].getLength(), hover);
      angle += steps*(float) index.length/2.0;
    }

    angle = 0.0;

    for (int i = 0; i < txt.length; i++)
    {
      index = txt[i].getIndex();
      angle += steps*(float) index.length/2.0;
      PVector p1 = createPos (angle, dBig, pos);  

      if (i == id) addEllipse (writeToImage, p1.x, p1.y, steps*(float) index.length*4.0, txt[i].getLength(), true);
      else addEllipse (writeToImage, p1.x, p1.y, steps*(float) index.length*4.0, txt[i].getLength(), false);
      angle += steps*(float) index.length/2.0;
    }
  }

  private void showConnections (boolean writeToImage, float angle, int [] index, int i, PVector p1)
  {
    ArrayList apositions = new ArrayList();
    float mangle = lerp (angle, 360.0 / (float) txt.length *txt [i].getLast(), 0.5);
    if (angle - 360.0 / (float) txt.length *txt [i].getLast() > 180) mangle -= 180;

    apositions.add (p1);
    apositions.add (createPos (mangle, dBig + dBig / (float) index.length / 2.0, pos));
    apositions.add (createPos (360.0 / (float) txt.length *txt [i].getLast(), dBig, pos));
    if (angle - 360.0 / (float) txt.length *txt [i].getLast() > 90) apositions.add (2, createPos (lerp (angle, 360.0 / (float) txt.length *txt [i].getLast(), 0.75), dBig + abs (width-2*dBig) / (float) index.length, pos));

    PVector [] positions = arrayListToPVector(apositions);
    if (index.length > 2) addCurve (writeToImage, positions, (Integer) colors.get("connections"), strokeW+0.12*(float)index.length);
  }

  private void showWordIndex (boolean writeToImage, int [] index, float x, float y, float xd, float angle, float strokeW, boolean hover)
  {
    PVector [] positions = new PVector [4];

    for (int j = 0; j < index.length; j++)
    {
      positions [0] = createPos (360.0 / (float) index.length * (float) j, xd/2, new PVector (x, y));
      positions [3] = createPos (360.0 / (float) fullSize * (float) index [j], dSmal, pos);
      positions [1] = createPos (lerp (angle, 360.0 / (float) fullSize * (float) index [j], measure), lerp (dBig, dSmal, (float) j / (float) index.length), pos);
      positions [2] = createPos (lerp (360.0 / (float) fullSize * (float) index [j], angle, measure), lerp (dSmal, dBig, (float) j / (float) index.length), pos );

      addCurve (writeToImage, positions, strokeW / (float) index.length, hover);
    }
  }

  // ----------------------------------------------------------------------------------------------------
  // Visuals
  // ----------------------------------------------------------------------------------------------------

  private void addText (String txt, float x, float y, int s, String align, char h)
  {
    noStroke ();
    fill ((Integer) colors.get("highlight"));
    if (align.equals ("left")) textAlign (LEFT);
    else if (align.equals ("center")) textAlign (CENTER);
    else textAlign (RIGHT);
    if (h == 'u') txt = txt.toUpperCase();
    textFont (this.font, s);
    text (txt, x, y);
  }

  private void addCurve (boolean writeToImage, PVector [] positions, float sW, boolean hover)
  {

    if (hover) 
    {
      sW = strokeW;
      if (writeToImage) {
        color t = (Integer) colors.get("highlight");
        pg.stroke ((Integer) colors.get("highlight"));
      }
      else stroke ((Integer) colors.get("highlight"));
    }
    else {
      if (writeToImage) {
        color t = (Integer) colors.get("stroke");
        pg.stroke ((Integer) colors.get("stroke"));
      }
      else stroke ((Integer) colors.get("stroke"));
    }
    if (writeToImage) {
      pg.noFill();
      pg.strokeWeight (sW);
      pg.beginShape();
    }
    else {
      noFill();
      strokeWeight (sW);
      beginShape();
    }
    for (int i = 0; i < positions.length; i++)
    {
      if (writeToImage) {
        pg.curveVertex (positions[i].x, positions[i].y);
        if (i == 0 ||i ==  positions.length-1)  pg.curveVertex (positions[i].x, positions[i].y);
      } 
      else {
        curveVertex (positions[i].x, positions[i].y);
        if (i == 0 ||i ==  positions.length-1)  curveVertex (positions[i].x, positions[i].y);
      }
    }
    if (writeToImage) pg.endShape();
    else endShape();
  }

  private void addCurve (boolean writeToImage, PVector [] positions, int c, float sW)
  {
    if (writeToImage)
    {
      pg.strokeWeight (sW);
      pg.stroke (c);
      pg.noFill();
      pg.beginShape();
    } 
    else
    {
      strokeWeight (sW);
      stroke (c);
      noFill();
      beginShape();
    }
    for (int i = 0; i < positions.length; i++)
    {
      if (writeToImage) {
        pg.curveVertex (positions[i].x, positions[i].y);
        if (i == 0 ||i ==  positions.length-1)  pg.curveVertex (positions[i].x, positions[i].y);
      } 
      else {
        curveVertex (positions[i].x, positions[i].y);
        if (i == 0 ||i ==  positions.length-1)  curveVertex (positions[i].x, positions[i].y);
      }
    }
    if (writeToImage) pg.endShape();
    else endShape();
  }

  private void addEllipse (boolean writeToImage, float x, float y, float d, float sW, boolean hover)
  {
    if (writeToImage) {
      if (hover) pg.fill ((Integer) colors.get("highlight"));
      else pg.fill ((Integer) colors.get("ellipse"));
    }
    else
    {
      if (hover) fill ((Integer) colors.get("highlight"));
      else fill ((Integer) colors.get("ellipse"));
    }

    if (sW < d)
    {
      if (writeToImage) {
        pg.strokeWeight (sW);
        pg.stroke ((Integer) colors.get("ellipseStroke"));
      }
      else {
        strokeWeight (sW);
        stroke ((Integer) colors.get("ellipseStroke"));
      }
    }
    else {
      if (writeToImage) pg.noStroke();
      else noStroke();
    }
    if (writeToImage) pg.ellipse (x, y, d, d);
    else ellipse (x, y, d, d);
  }
}
