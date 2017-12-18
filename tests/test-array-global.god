void init() {}
void update(int f) {}

int[] x;
string[] y;

int main() {
	int i;
    int j;
    int[] z;

	x = new int[64];
    y = new string[10];
    z = new int[512];

    for (i = 0; i < 64; i = i + 1) {
        x[i] = i;
        for (j = 0; j < 8; j = j + 1) {
            z[j * 64 + i] = j * 64 + i;
        }
    }

    y[8] = "lol";

    for (i = 0; i < 64; i = i + 1) {
        printfl(x[i]);
        print(z[i * 5]);
        prints(y[8]);
    }

	return 0;
}
