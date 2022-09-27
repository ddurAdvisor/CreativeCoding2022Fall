class TextDisplayer
{
  private PFont font;
  private String txt;
  private int s; // fontSize
  private float totalHeight; // total height for displaying all text;
  private float startY /* position of first row of the text*/, sliderY /*position of slider*/, sliderWidth;
  private HashMap colors;
  private int x, y, w, h, padding;
  private String [] splitted;
  private PImage bg;
  private boolean listed;

  TextDisplayer (String txt, int [] borders, int s, HashMap colors, boolean listed)
  {
    this.listed = listed;
    this.s = s;
    this.txt = txt;
    this.font = createFont ("Arial", s);
    bg = createImage (borders [2], borders [3], ARGB);
    splitted = split (txt, " ");
    x = borders [0];
    y = borders [1];
    w = borders [2];
    h = borders [3];
    padding = borders [4];
    this.colors = colors;
    startY = sliderY = borders [1] + borders [4];
    createTotalHeight();
  }

  TextDisplayer (String [] txt, int [] borders, int s, HashMap colors, boolean listed)
  {
    this.listed = listed;
    this.s = s;
    this.txt = "";
    bg = createImage (borders [2], borders [3], ARGB);
    for (int i = 0; i < txt.length; i++)
    {
      this.txt += txt[i];
    }

    this.font = createFont ("Arial", s);
    splitted = txt;
    x = borders [0];
    y = borders [1];
    w = borders [2];
    h = borders [3];
    padding = borders [4];
    this.colors = colors;
    startY = sliderY = borders [1] + borders [4];
    createTotalHeight(); // check if the text fits into the created window and / or calculate how much height the next needs == totalHeight
  }

  public void setTxt (String [] txt)
  {
    this.txt = "";
    bg = createImage (w, h, ARGB);
    for (int i = 0; i < txt.length; i++)
    {
      this.txt += txt[i];
    }

    splitted = txt;
    createTotalHeight(); 
  }

  public void setBG (PImage img)
  {
    System.arraycopy(img.pixels, 0, bg.pixels, 0, bg.pixels.length);
    bg.updatePixels();
  }

  public int getX ()
  {
    return x;
  }

  public int getY ()
  {
    return y;
  }

  public int getWidth ()
  {
    return w;
  }

  public int getHeight ()
  {
    return h;
  }

  public void createTotalHeight()
  {
    float textx = x + padding, texty = y + padding + s;
    textFont (this.font, s);
    textAlign (LEFT);

    for (int i = 0; i < splitted.length; i++)
    {     
      if (!listed)
      {
        textx += textWidth (splitted[i] + " ");
        if (i < splitted.length-1 && checkNext (splitted [i+1], textx) )
        {
          textx = x + padding;
          texty += s * 1.5;
        }
      }
      else texty += s * 1.5;
    }
    if ( texty > h ) 
    {
      totalHeight = texty + padding;
      sliderWidth = padding * 3/5;
    }
    else {
      totalHeight = h;
      sliderWidth = 0;
    }
  }

  public void display()
  {
    image (bg, x, y);
    fill ((Integer) colors.get("bg"));
    rect (x, y, w, h);
    fill ((Integer) colors.get("text"));

    float textx = x + padding, texty = startY + s;
    textFont (this.font, s);
    textAlign (LEFT);

    for (int i = 0; i < splitted.length; i++)
    {
      if (!listed)
      {
        if ( texty >= y + padding + s && texty < y + h - padding ) text (splitted [i]+ " ", textx, texty);
        textx += textWidth (splitted[i] + " ");
        if (i < splitted.length-1 && checkNext (splitted [i+1], textx) )
        {
          textx = x + padding;
          texty += s * 1.5;
        }
      }
      else {
        if ( texty >= y + padding + s && texty < y + h - padding ) text (splitted [i]+ " ", textx, texty);
        texty += s * 1.5;
      }
    }

    if (totalHeight > h)
    {
      noStroke ();
      fill ((Integer) colors.get("scrollbarBG"));

      rect (x + w - sliderWidth, y + padding, sliderWidth, h - 2 * padding);

      float mapped = ((float) h - 2.0 * (float) padding) / (float) totalHeight * 100; // == sliderBth height
      if (mapped <  10) mapped = 10;

      if (checkHover (x + w - sliderWidth, y + padding, sliderWidth, h - 2 * padding)) {
        fill ((Integer) colors.get("highlight"));
        if (mousePressed)
        {
          sliderY = mouseY;
          if (sliderY + mapped > y + h - padding) sliderY = y + h - padding - mapped;
          if (sliderY < y +padding) sliderY = y + padding;
          startY =  map (sliderY, y + padding, y + h - padding - mapped, y + padding, y - totalHeight + h + 2 * padding);
        }
      }
      else fill ((Integer) colors.get("scrollbar"));
      rect (x + w - sliderWidth, sliderY, sliderWidth, mapped);
    }
  }

  private boolean checkNext (String next, float currentx)
  {
    if ( (currentx += textWidth (next)) > x - padding + w ) return true;
    else return false;
  }
}
