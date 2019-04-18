package Test;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class ServerThread extends Thread {
		private BufferedReader br = null;
		private PrintWriter pw = null;
		private ChatRoom cr = null;
		public ServerThread(Socket s, ChatRoom cr) {
			try {
				this.cr= cr;
				this.br = new BufferedReader(new InputStreamReader(s.getInputStream()));
				this.pw= new PrintWriter(s.getOutputStream());
				this.start();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		public void run() {
			try {
				while(true) {
					String line = br.readLine();
					cr.broadcast(line, this);
				}
			} catch (IOException e) {
			System.out.println("ioe: "+e.getMessage());
			}
		}
		
		public void sendMessage(String message) {
			pw.println(message);
			pw.flush();
		}
}
