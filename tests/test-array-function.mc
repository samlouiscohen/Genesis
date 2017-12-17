


void modify(int[] c, int len){


    c[1] = 5;
    
}


int main(){

    int length;

    int[] x;

    length = 10;

    x = new int[length];

    modify(x, length);


    print(x[1]);





    return 0;
}
