void init(){}
void update(int f){}


void modify(int[] c, int len){

	int i;

	for(i=0;i<len;i=i+1){
		c[i] = i*i;
	}
}



int main(){

    int length;
    int j;

    int[] x;

    length = 10;

    x = new int[length];

    modify(x, length);


    for(j=0;j<length;j=j+1){

    	print(x[j]);

    }


    return 0;
}
