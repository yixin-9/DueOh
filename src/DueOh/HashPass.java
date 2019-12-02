package DueOh;

public class HashPass {
	public static String calculateHash(String s) {
		long password = (int) s.charAt(0);
		for (int i = 1; i < s.length(); i++) {
			password *= 128;
			password += (int) s.charAt(i);
		}
		int i = 3;
		long[] array = { 0, 0, 0, 0 };
		while (password != 0) {
			long x = password % 48291;
			password = password / 48291;
			array[i] = x;
			i--;
		}
		int retVal = (int) (45912 * array[0] + 42137 * array[1] + 89612 * array[2] + 6571 * array[3]);
		retVal = retVal % 48291;
		String retStr = Integer.toString(retVal);
		return retStr;
	}
}