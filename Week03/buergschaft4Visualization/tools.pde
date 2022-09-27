// ----------------------------------------------------------------------------------------------------
// Tools
// ----------------------------------------------------------------------------------------------------

String [] wordArrayToStringArray(Word [] words)
{
  String [] txt = new String [words.length];
  
  for (int i = 0; i < txt.length; i++)
  {
    txt[i] = nf(i, 4, 0) + " [" + nf(words[i].getFirstIndex(), 4, 0) + "] " + words[i].getTxt() + " " + str(words[i].getCount()) + "x";
  }
  
  return txt;
}

PVector [] arrayListToPVector (ArrayList listed)
{
  PVector [] vector = new PVector [listed.size()];

  for (int i = 0; i < vector.length; i++)
  {
    vector [i] = (PVector) listed.get(i);
  }

  return vector;
}

int [] arrayListToInt (ArrayList listed)
{
  int [] in = new int [listed.size()];

  for (int i = 0; i < in.length; i++)
  {
    in [i] = (Integer) listed.get(i);
  }

  return in;
}

PVector createPos (float angle, float d, PVector pvCenter)
{
  PVector position = new PVector (pvCenter.x + cos (radians (angle))*d, pvCenter.y + sin (radians (angle))*d);
  return position;
}

boolean checkHover (float x, float y, float d)
{
  if (dist (mouseX, mouseY, x, y) < d) return true;
  else return false;
}

boolean checkHover (float x, float y, float w, float h)
{
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) return true;
  else return false;
}

String timestamp()
{
  String time, year, month, day, hour, minute, second;

  year = nf( year(), 4 );
  month = nf( month(), 2 );
  day = nf( day(), 2 );
  hour = nf( hour(), 2 );
  minute = nf( minute(), 2 );
  second = nf( second(), 2 );

  time = year + "_" + month + "_" + day + "_" + hour + "_" + minute + "_" + second;

  return time;
}
