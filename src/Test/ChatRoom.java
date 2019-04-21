//CSCI 201 Final Project Plannrly 
//Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
//Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu

 
package Test;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

public class ChatRoom {
	private Vector<ServerThread> serverThreads;
	private int numConnecs=0;
	private boolean everyoneIn = false;
	private int numGroup;
	public ChatRoom(int port, int numGroup) {
		ServerSocket ss= null;
		this.numGroup = numGroup;
		try {
			System.out.println("Trying to bind to port "+port);
			ss = new ServerSocket(port);
			System.out.println("Bound to port "+port);
			serverThreads = new Vector<ServerThread>();
			while(true) {
				Socket s= ss.accept();
				System.out.println("Connection from "+ s.getInetAddress());
				setNumConnecs(getNumConnecs() + 1);
				if(getNumConnecs()==numGroup) {
					setEveryoneIn(true);
					System.out.println("All Members in");
					System.exit(0);
				}
				ServerThread st = new ServerThread(s, this);
				serverThreads.add(st);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(ss!=null) ss.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
	}
	
	public void broadcast(String message, ServerThread currST) {
		if(message!=null) {
			System.out.println(message);
			for(ServerThread st : serverThreads) {
				if(st!=currST) {
					st.sendMessage(message);
				}
			}
		}
	}
	
//	
//	
//	public static void main(String[] args) {
//		ChatRoom cr = new ChatRoom(6789,2);
//	}

	public int getNumConnecs() {
		return numConnecs;
	}

	public void setNumConnecs(int numConnecs) {
		this.numConnecs = numConnecs;
	}

	public boolean isEveryoneIn() {
		return everyoneIn;
	}

	public void setEveryoneIn(boolean everyoneIn) {
		this.everyoneIn = everyoneIn;
	}
}