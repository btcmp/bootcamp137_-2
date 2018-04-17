package util;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class Currency {

	public static String currency(double value) {
		NumberFormat nf = DecimalFormat.getInstance();
		String uangS = nf.format(value);
        return "Rp "+uangS+".00";
	}
}
