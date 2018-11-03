package hujw;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/websocket/chat")
public class ChatEndpoint {

	private static final String GUEST_PREFIX="访客";
	private static AtomicInteger connectionIds=new AtomicInteger(0);
	private static Set<ChatEndpoint> clientSet=new CopyOnWriteArraySet<>();
	private String nickName;
	private Session session;
	public ChatEndpoint(Session session) {
		nickName=GUEST_PREFIX+connectionIds.getAndIncrement();
	}
	private static void broadcast(String msg) {
		for (ChatEndpoint chatEndpoint : clientSet) {
			try {
				synchronized (chatEndpoint) {
					chatEndpoint.session.getBasicRemote().sendText(msg);
				}
			}catch (Exception e) {
				System.out.println("聊天错误,向客户端"+chatEndpoint+"发送消息出现错误.");
				clientSet.remove(chatEndpoint);
				try {
					chatEndpoint.session.close();
				}catch (Exception e1) {
				}
				String message=String.format("[%s %s]", chatEndpoint.nickName,"已经断开连接.");
				broadcast(message);
				
			}
		}
	}
	private static String filter(String msg) {
		if(msg==null) {
			return null;
		}
		char[] charArr=new char[msg.length()];
		msg.getChars(0, msg.length(), charArr, 0);
		StringBuilder sb=new StringBuilder(charArr.length+50);
		for (int i = 0; i < charArr.length; i++) {
			switch (charArr[i]) {
			case '<':
				sb.append("&lt;");
				break;
			case '>':
				sb.append("&gt;");
				break;
			case '&':
				sb.append("&amp;");
				break;
			case '"':
				sb.append("&quot");
				break;
			default:
				sb.append(charArr[i]);
			}
			
		}
		return sb.toString();
	}
	@OnOpen
	public void start(Session session) {
		this.session=session;
		clientSet.add(this);
		String msg=String.format("[%s %s]", this.nickName,"进入了聊天室");
		broadcast(msg);
	}
	@OnClose
	public void end() {
		clientSet.remove(this);
		String msg=String.format("[%s %s]", nickName,"离开了聊天室");
		broadcast(msg);
	}
	@OnMessage
	public void inComming(String msg) {
		String fileteredMsg=String.format("[%s: %s]", nickName,filter(msg));
		broadcast(fileteredMsg);
	}
	@OnError
	public void onError(Throwable t) throws Throwable {
		System.out.println("服务端错误"+t);
	}
}
