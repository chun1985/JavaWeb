
package myFavorite;

import java.io.IOException;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.Tag;

public class dividingLine implements Tag {
	private PageContext pc;
	private Tag parentTag;
	private int length = 40;

	public void setLength(String length) {
		this.length = Integer.parseInt(length);
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pc.getOut();
		String line = "<p>";
		for (int i = 1; i <= length / 2; i++) {
			line += "-";
		}
		line += " This is dividing line ";
		for (int i = 1; i <= length / 2; i++) {
			line += "-";
		}
		line += "<p>";
		try {
			out.print(line);
		} catch (IOException e) {
		}
		return SKIP_BODY;
	}

	@Override
	public void release() {
	}

	@Override
	public Tag getParent() {
		return parentTag;
	}

	@Override
	public void setPageContext(PageContext pc) {
		this.pc = pc;
	}

	@Override
	public void setParent(Tag t) {
		this.parentTag = t;
	}
}
