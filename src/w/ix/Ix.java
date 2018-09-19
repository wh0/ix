package w.ix;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import com.android.commands.input.Input;

public class Ix {

	public static void main(String[] args) throws IOException {
		final BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		while (true) {
			final String line = in.readLine();
			if (line == null) break;
			Input.main(line.split("\t"));
		}
	}

}
