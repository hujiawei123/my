package hujw;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class dynaAttrTag extends SimpleTagSupport implements DynamicAttributes {
	private List<String> keys = new ArrayList<>();
	private List<Object> values = new ArrayList<>();

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		out.println("<ol>");
		for (int i = 0; i < keys.size(); i++) {
			String key = keys.get(i);
			Object value = values.get(i);
			out.println("<li>" + key + "=" + value + "</li>");
		}
		out.println("</ol>");
		super.doTag();
	}

	@Override
	public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {
		keys.add(localName);
		values.add(value);
	}

}
