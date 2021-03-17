
package myFavorite;

import java.io.IOException;
import java.time.LocalDateTime;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.Tag;

public class nowTimeMsg implements Tag {
	private PageContext pc;
	private Tag parentTag;
	private String addSec;

	public void setAddSec(String addSec) {
		this.addSec = addSec;
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		LocalDateTime dtMsg = LocalDateTime.now();
		JspWriter out = pc.getOut();
		String dtMsgF = String.format("%d 年 %02d 月 %02d 日 %02d 時 %02d 分",
				dtMsg.getYear(), dtMsg.getMonthValue(),dtMsg.getDayOfMonth(),
				dtMsg.getHour(), dtMsg.getMinute());
		if ("y".equals(addSec)) {
			dtMsgF += String.format(" %d 秒", dtMsg.getSecond());
		}
		try {
			out.print(dtMsgF);
		} catch (IOException e) {
		}
		return SKIP_BODY;
	}

	@Override
	public Tag getParent() {
		return parentTag;
	}

	@Override
	public void release() {
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
