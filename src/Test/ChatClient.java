package Test;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class ChatClient extends Thread {
	private BufferedReader br = null;
	private PrintWriter pw = null;
	
	public ChatClient(String hostname, int port) {
		ChatRoom cr = new ChatRoom(6789,2);
		Socket s = null;
		try {
			System.out.println("Trying to connect to " + hostname+": "+port);
			s= new Socket(hostname, port);
			System.out.println("Connected to "+ hostname+": "+port);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(s!=null) s.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
	}
	
	public void run() {
		try {
			while(true) {
				String line = br.readLine();
				System.out.println(line);
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
	
//	public static void main(String[] args) {
//		ChatClient cc= new ChatClient("localhost", 6789);
//
//	}

}