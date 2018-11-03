package hujw;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.AsyncContext;
import javax.servlet.ServletRequest;

public class GetBooksTarget implements Runnable{
	AsyncContext actx;
	public GetBooksTarget(AsyncContext actx) {
		this.actx=actx;
	}
	@Override
	public void run() {
		try {
			Thread.sleep(5000);
			ServletRequest request=actx.getRequest();
			List<String>books=new ArrayList<>();
			books.add("spring in action");
			books.add("疯狂java将以");
			books.add("轻量级JAVAEE");
			request.setAttribute("books", books);
			actx.dispatch("/async.jsp");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
