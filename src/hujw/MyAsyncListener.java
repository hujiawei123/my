package hujw;

import java.io.IOException;

import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;

public class MyAsyncListener implements AsyncListener {

	@Override
	public void onComplete(AsyncEvent arg0) throws IOException {
		System.out.println("---------异步调用完成---------");
	}

	@Override
	public void onError(AsyncEvent arg0) throws IOException {

	}

	@Override
	public void onStartAsync(AsyncEvent arg0) throws IOException {
		System.out.println("---------异步调用开始---------");

	}

	@Override
	public void onTimeout(AsyncEvent arg0) throws IOException {

	}

}
