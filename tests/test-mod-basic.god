void init() {}
void update(int f) {}

int main() {
    int a;
    int b;
    int c;

    int i;

    a = 12;
    b = 7;
    c = a % b;

    for (i = 0; i < 10; i = i + 1) {
        print(i % 2);
    }

    print(c);
    return 0;
}
