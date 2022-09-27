class TextAnalyzer
{
  private ArrayList fullTxt, words;
  private Word [] wordArray;
  private int last;
  private String [] rawTxt;
  private PFont font;
  private boolean animate, isAnimating;

  public TextAnalyzer (String loadPath, String inputFormat, boolean animate)
  {
    this.animate = animate;
    if (animate) isAnimating = true;
    fullTxt = new ArrayList();
    words = new ArrayList();
    this.font = createFont ("Verdana", 12);

    splitText (loadStrings (loadPath));
    if (!animate) createWordArrayList(inputFormat);
    //createWordArray();
  }

  public TextAnalyzer (String loadString, boolean animate)
  {
    this.animate = animate;
    if (animate) isAnimating = true;
    fullTxt = new ArrayList();
    words = new ArrayList();
    this.font = createFont ("Verdana", 12);

    String [] temp = { 
      loadString     };
    splitText (temp);
    if (!animate) createWordArrayList("ansi");
    //createWordArray();
  }

  public boolean getAnimation ()
  {
    if (animate && isAnimating) return true;
    else return false;
  }

  public boolean getMode ()
  {
    return animate;
  }

  public int getFullSize()
  {
    return fullTxt.size();
  }

  public Word [] getWordArray()
  {
    createWordArray();
    return wordArray;
  }

  public String getRawTxt ()
  {
    String raw = "";

    for (int i = 0; i < rawTxt.length; i++)
    {
      raw += rawTxt [i] + " ";
    }
    return raw;
  }

  private void splitText (String [] rawTxt)
  {
    this.rawTxt = rawTxt;
    String tokens = ",.;:-_!?&\"□▫¶~ +%=()[]{}«»#&%§'|";
    for (int i = 0; i < rawTxt.length; i++)
    {
      String [] rowTxt = splitTokens (rawTxt [i], tokens);

      for (int j = 0; j < rowTxt.length; j++)
      {
        fullTxt.add (new String (rowTxt [j]));
      }
    }
  }

  private String removeFirstChar (String word)
  {
    char [] c = new char [word.length()-1];
    for (int k = 0; k < c.length; k++)
    {
      c [k] = word.charAt(k+1);
    }

    return new String (c);
  }

  private void createWordArrayList (String textFormat)
  {
    // ertser Eintrag
    // words.add (new String ((String) fullTxt.get (0)));

    boolean found = false;

    for (int i = 0; i < fullTxt.size(); i++)
    {
      String full = (String) fullTxt.get(i);
      //println(i + ", Words: " + words.size());
      if (words.size() == 0)
      {
        //erster Eintrag
        if (textFormat.equals("utf")) full = removeFirstChar(full);
        words.add (new Word (full, 0, 0));
      }
      else {
        found = false;

        for (int j = 0; j < words.size(); j++)
        {
          Word temp = (Word) words.get (j);

          if (temp.getTxt().equals ( full.toLowerCase()))
          {
            // wort in liste gefunden
            temp.increase(i);
            found = true;
          }

          if (found)
          {
            j =  words.size();
            continue;
          }
        }

        if (!found)
        {
          //neues Wort
          quicksort (full.toLowerCase(), words.size(), 0, i);
        }

      }
    }
  }

  private void createWordArrayList (String textFormat, int count)
  {
    // ertser Eintrag
    // words.add (new String ((String) fullTxt.get (0)));

    boolean found = false;

    if (count < fullTxt.size())
    {
      String full = (String) fullTxt.get(count);
      //println(i + ", Words: " + words.size());
      if (words.size() == 0)
      {
        //erster Eintrag
        if (textFormat.equals("utf")) full = removeFirstChar(full);
        words.add (new Word (full, 0, 0));
      }
      else {
        found = false;

        for (int j = 0; j < words.size(); j++)
        {
          Word temp = (Word) words.get (j);

          if (temp.getTxt().equals ( full.toLowerCase()))
          {
            // wort in liste gefunden
            temp.increase(count);
            found = true;
          }

          if (found)
          {
            j =  words.size();
            continue;
          }
        }

        if (!found)
        {
          //neues Wort
          quicksort (full.toLowerCase(), words.size(), 0, count);
        }

      }
    }
    else {
      isAnimating = false;
    }
  }

  private void quicksort (String input, float iSize, float index, int txtIndex)
  {

    if (round (iSize) == 1)
    {
      int i = round (index);
      Word listedWord = (Word) words.get (i);
      String listed = listedWord.getTxt(); 

      if (compareString (input, listed)) addWord (input, i+1, txtIndex);
      else addWord (input, i, txtIndex);
    }
    else {
      int i = floor (index+iSize/2.0);

      Word listedWord = (Word) words.get (i);
      String listed = listedWord.getTxt(); 

      if (compareString (input, listed)) quicksort (input, iSize/2.0, index+iSize/2.0, txtIndex);
      else quicksort (input, iSize/2.0, index, txtIndex);
    }
  }

  private boolean compareString (String input, String listed)
  {

    int dir  = input.compareTo(listed);

    if (dir > 0 ) return true;
    else return false;
  }

  private void addWord (String input, int pos, int txtIndex)
  {
    words.add (pos, new Word (input, txtIndex, last));
    last = pos;
  }

  private void createWordArray()
  {
    wordArray = new Word [words.size()];

    for (int i = 0; i < wordArray.length; i++)
    {
      wordArray [i] = (Word) words.get (i);
    }
  }

  public void displayArrayList ()
  {
    textFont (this.font, 12);
    fill (5);
    noStroke();

    float x = 20, y = 20;

    for (int i = 0; i < words.size(); i++)
    {
      Word temp = (Word) words.get(i);

      text (nf (i, 3, 0) + ". " + temp.getTxt() + ", " + str (temp.getCount()), x, y);

      y+= 15;

      if (y >= height -15)
      {
        y = 20;
        x += 100;
      }
    }
  }

  public void display ()
  {
    textFont (this.font, 12);
    fill (5);
    noStroke();

    float x = 20, y = 20;

    for (int i = 0; i < wordArray.length; i++)
    {
      text (nf (i, 3, 0) + ". " + wordArray[i].getTxt() + ", " + str (wordArray[i].getCount()), x, y);

      y+= 15;

      if (y >= height -15)
      {
        y = 20;
        x += 100;
      }
    }
  }
}
