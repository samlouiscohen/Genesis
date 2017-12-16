void init(){}
void update(int f){}

int main(){
    int size;
    int[] x;
    int i;

    size = 10;
    x = new int[size];

    for (i = 0; i < size; i = i + 1) {
        x[i] = i + 1;
    }

    for (; i > 0; i = i - 1) {
        print(x[i - 1]);
    }

    prints("Fuck yeah!");
    return 0;
}
