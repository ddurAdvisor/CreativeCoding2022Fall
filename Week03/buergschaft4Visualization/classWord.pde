class Word 
{
  private String txt;
  private int count;
  private int last;
  private int letters;
  private ArrayList index = new ArrayList();

  public Word (String txt, int index, int last)
  {
    this.txt = txt.toLowerCase();
    this.last = last;
    letters = this.txt.length();
    count = 1;
    this.index.add (new Float (index));   
  }

  public int [] getIndex ()
  {
    int [] indexArray = new int [index.size()];

    for (int i = 0; i < index.size(); i++)
    { 
      indexArray [i] = int ( (Float) index.get(i) );
    }
    
    return indexArray;
  }
  
  public int getLength()
  {
    return letters;
  }
  
  public int getLast()
  {
    return last;
  }

  public int getFirstIndex ()
  {
    return int ( (Float) index.get(0) );
  }

  public String getTxt ()
  {
    return txt;
  }

  public int getCount()
  {
    return count;
  }

  public void increase (int index)
  {
    this.index.add (new Float (index));
    count++;
  }
}
