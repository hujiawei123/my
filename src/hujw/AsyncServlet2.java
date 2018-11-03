package hujw;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.AsyncContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns= "/async2",asyncSupported=true)
public class AsyncServlet2 extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7828654474303219904L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out=resp.getWriter();
		out.println("<title>非阻塞IO示例</title>");
		out.println("进入servlet时间:"+new Date()+".<br>");
		System.out.println(req.getParameter("name"));
		AsyncContext actx=req.startAsync();
		actx.setTimeout(60*1000);
		ServletInputStream input=req.getInputStream();
		System.out.println(input.isReady());
		input.setReadListener(new MyReadListener(actx, input));
		out.println("结束servlet时间:"+new Date()+".<br>");
		out.flush();
	}
}
