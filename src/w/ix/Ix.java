package w.ix;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import com.android.commands.input.Input;

public class Ix {

	public static void main(String[] args) throws Exception {
		final BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		while (true) {
			final String line = in.readLine();
			if (line == null) break;
			final String[] cmd = line.split(" ");
			switch (cmd[0]) {
				case "sleep":
					Thread.sleep(Long.parseLong(cmd[1]));
					break;
				case "echo":
					System.out.println();
					break;
				default:
					Input.main(cmd);
					break;
			}
		}
	}

}
