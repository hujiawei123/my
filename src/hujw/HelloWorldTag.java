package hujw;

import java.io.IOException;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class HelloWorldTag extends SimpleTagSupport {
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
		getJspContext().getOut().write("Hello World"+new Date());
	}
}
