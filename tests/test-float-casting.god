void init(){}
void update(int f){}

int main() {
  float a;
  float b;
  int c;

  float tmp1;
  int tmp2;

  a = 5.0;
  b = 3;
  c = 2.0;

  print(a + c);
  printfl(a + c);

  tmp1 = a + b;
  printfl(tmp1);

  tmp1 = a + c;
  printfl(tmp1);

  tmp1 = c + c;
  printfl(tmp1);

  tmp2 = a + b;
  print(tmp2);

  tmp2 = a + c;
  print(tmp2);

  tmp2 = c + c;
  print(tmp2);

  return 0;
}
