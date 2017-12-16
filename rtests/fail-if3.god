void init(){}
void update(int f){}

int main()
{
  if (true) {
    42;
  } else {
    bar; /* Error: undeclared variable */
  }
}
