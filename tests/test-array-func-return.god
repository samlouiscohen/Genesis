void init(){}
void update(int f){}


int[] ones(int len){

	int i;
    int[] a;
    a = new int[len];

	for(i=0;i<len;i=i+1){
		a[i] = 1;
	}

    return a;
}



int main(){

    int length;
    int j;
    int[] arrayOfOnes;

    length = 10;


    arrayOfOnes = ones(length);


    for(j=0;j<length;j=j+1){

    	print(arrayOfOnes[j]);

    }


    return 0;
}
