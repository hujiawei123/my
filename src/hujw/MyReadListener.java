package hujw;

import java.io.IOException;

import javax.servlet.AsyncContext;
import javax.servlet.ReadListener;
import javax.servlet.ServletContext;
import javax.servlet.ServletInputStream;

public class MyReadListener implements ReadListener{

	private AsyncContext context;
	private ServletInputStream input;
	public MyReadListener(AsyncContext context,ServletInputStream input) {
		this.context=context;
		this.input=input;
	}
	@Override
	public void onAllDataRead() throws IOException {
		System.out.println("数据读取完成");
	}

	@Override
	public void onDataAvailable() throws IOException {
		System.out.println("数据可用");
		try {
			Thread.sleep(5000);
			StringBuilder sb=new StringBuilder();
			int len=-1;
			byte[] buff=new byte[1024];
			while(input.isReady()&&(len=input.read(buff))>0) {
				String data=new String(buff, 0, len);
				sb.append(data);
			}
			System.out.println(sb);
			context.getRequest().setAttribute("info", sb.toString());
			context.dispatch("/async2.jsp");
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void onError(Throwable arg0) {
		arg0.printStackTrace();
	}

}
