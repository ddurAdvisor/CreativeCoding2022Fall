/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2016-05-08 13:15:21
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 08:46:16
* @detail
*/
// Hamilton path by Nathan Clisby
// http://clisby.net/projects/hamiltonian_path/

int[][] path;
int xmax, ymax, n;
boolean left_end = true;

ArrayList<ArrayList<Dot>> getHamiltonPath(PGraphics pg, float step) {
  xmax = floor(outW/step);
  ymax = floor(outH/step);
  n = xmax * ymax;
  path = new int[xmax*ymax][2];
  float offx = (outW-((xmax-1)*step))/2f;
  float offy = (outH-((ymax-1)*step))/2f;

  ArrayList<ArrayList<Dot>> out = new ArrayList<ArrayList<Dot>>();
  
  HPath result = generate_hamilton_circuit();
  //int n = result.n;
  int[][] respath = result.path;
  
  ArrayList<Dot> h_path = new ArrayList<Dot>();
  
  int num = respath.length;
  for (int i=0; i<=num; i++) {
    int id = i<num?i:0;
    int x = respath[id][0];
    int y = respath[id][1];
    PImage temp = pg.get(round(x*step), round(y*step), round(step), round(step));
    float val = luminosityAverage(temp);
    val = level(val);
    Dot d = new Dot(offx+x*step, offy+y*step, 1-val);
    h_path.add(d);
    if (d.z>threshold) d.drilled = true;
  }
  
  out.add(h_path);
  
  return out;
}

boolean inSublattice(int x, int y) {
  if (x<0)    return false;
  if (x>=xmax) return false;
  if (y<0)    return false;
  if (y>=ymax) return false;
  return true;
}

void reversePath(int i1, int i2, int[][] path) {
  int i;
  int jlim = (i2-i1+1)/2;
  int[] temp;
  for (int j=0; j<jlim; j++) {
    temp = path[i1+j];
    path[i1+j] = path[i2-j];
    path[i2-j] = temp;
  }
}

int backbite_left(int[] step, int n, int[][] path) {
  int[] neighbour = {path[0][0] + step[0], path[0][1] + step[1]};
  if (inSublattice(neighbour[0], neighbour[1])) {
    boolean inPath = false;
    int j;
    for (j=1; j<n; j+=2) {
      if ((neighbour[0] == path[j][0]) && (neighbour[1] == path[j][1])) {
        inPath = true;
        break;
      }
    }
    if (inPath) {
      reversePath(0,j-1,path);
    } else {
      left_end = !left_end;
      reversePath(0,n-1,path);
      n++;
      path[n-1] = neighbour;
    }
  }
  return n;
}

int backbite_right(int[] step, int n, int[][] path) {
  int[] neighbour = {path[n-1][0] + step[0], path[n-1][1] + step[1]};
  if (inSublattice(neighbour[0], neighbour[1])) {
    boolean inPath = false;
    int j;
    for (j=n-2; j>=0; j-=2) {
      if ((neighbour[0] == path[j][0]) && (neighbour[1] == path[j][1])) {
        inPath = true;
        break;
      }
    }
    if (inPath) {
      reversePath(j+1,n-1,path);
    } else {
      //left_end = !left_end;
      //reversePath(0,n-1,path);
      n++;
      path[n-1] = neighbour;
    }
  }
  return n;
}

int backbite(int n, int[][] path) {
  int[] step = new int[2];
  switch(floor(random(4))) {
    case 0:
      step[0] = 1;
      step[1] = 0;
      break;
    case 1:
      step[0] = -1;
      step[1] = 0;
      break;
    case 2:
      step[0] = 0;
      step[1] = 1;
      break;
    case 3:
      step[0] = 0;
      step[1] = -1;
      break;
  }
  if (floor(random(2))==0) {
    n = backbite_left(step,n,path);
  } else {
    n = backbite_right(step,n,path);
  }
  return n;
}

HPath generate_hamiltonian_path() {
  path[0][0] = floor(random(xmax));
  path[0][1] = floor(random(ymax));
  n=1;
  int nattempts = xmax*ymax*100;
  for (int i=0; i<nattempts; i++) {
    n = backbite(n,path);
  }
  HPath out = new HPath();
  out.path = path;
  out.n = n;
  return out;
}

HPath generate_hamilton_circuit() {
  HPath hp = generate_hamiltonian_path();
  int nt = hp.n;
  int[][] pt = hp.path;
  int nx = xmax*ymax;
  int min_dist = 1 + (nt % 2);
  while (abs(pt[nt-1][0] - pt[0][0]) + abs(pt[nt-1][1] - pt[0][1]) != min_dist) {
    nt = backbite(nt,pt);
  }
  HPath out = new HPath();
  out.path = pt;
  out.n = nt;
  return out;
  
}

/*void refresh_path() {
  //HPath result = generate_hamiltonian_path();
  HPath result = generate_hamilton_circuit();
  int n = result.n;
  respath = result.path;
}*/

class HPath {
  int[][] path;
  int n;
}
