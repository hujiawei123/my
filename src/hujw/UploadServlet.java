package hujw;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = { "/upload" }, name = "upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");
		Part part = req.getPart("file");
		out.println("上传文件类型为:" + part.getContentType() + "<br>");
		out.println("上传文件大小为:" + part.getSize() + "<br>");
		Collection<String> headers = part.getHeaderNames();
		for (String string : headers) {
			out.print(string + "-->" + part.getHeader(string) + "<br>");
		}
		String fileNameInfo = part.getHeader("content-disposition");
		String fileName = fileNameInfo.substring(fileNameInfo.indexOf("filename=\"")+10, fileNameInfo.length() - 1);
		part.write(getServletContext().getRealPath("/upload")+File.separator+fileName);
	}
}
