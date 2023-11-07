public class SumNatural {
    public static void main(String[] args) {
        int num = 100, sum = 0;
        for(int i = 1; i <= num; ++i)
        {
            sum += i;
        }
        System.out.println("Sum = " + sum);
    }
}