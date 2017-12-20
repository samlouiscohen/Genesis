void init() {}
void update(int f) {}

int main() {
    int[] x; x = new int[10];
    x[3] = 12;
    print(x[3]);
    delete x;

    x = new int[20];
    x[14] = 8;
    print(x[14]);

    return 0;
}
