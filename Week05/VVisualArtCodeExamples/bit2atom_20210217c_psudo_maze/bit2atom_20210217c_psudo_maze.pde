int x, y, a, i=0;
size(1920, 1080);
background(32, 72, 128);
noStroke();
for (; i<6; i++) {
  fill(i==0?0xFFA0C0C0:0x40E0FFFF);
  for (y=i==0?0:15; y<1080; y+=60)
    for (x=i==0?0:15; x<1920; x+=60)
      if (i==0||random(1)<i*.15)
        rect(x, y, 30+(a=int(random(2))*30), 30+(a>1?0:30));
}
