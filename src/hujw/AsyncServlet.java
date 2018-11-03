package hujw;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns= "/async",asyncSupported=true)
public class AsyncServlet extends HttpServlet{
	private static final long serialVersionUID = 7983137358360625693L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out=resp.getWriter();
		out.println("<title>异步调用示例</title>");
		out.println("进入servlet时间:"+new Date()+".<br>");
		AsyncContext actx=req.startAsync();
		actx.setTimeout(60*1000);
		actx.addListener(new MyAsyncListener());
		actx.start(new GetBooksTarget(actx));
		out.println("结束servlet时间:"+new Date()+".<br>");
		out.flush();
	}
}
