
package myFavorite;

import java.io.IOException;
import java.time.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.Tag;

public class Timer implements Tag {
	private PageContext pc;
	private Tag parentTag;
	private Instant startTime;
	private Instant finishTime;
	private String set;

	public void setStartTime(Instant startTime) {
		this.startTime = startTime;
	}

	public void setFinishTime(Instant finishTime) {
		this.finishTime = finishTime;
	}

	public void setSet(String set) {
		this.set = set;
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		String totalTime ="";
		JspWriter out = pc.getOut();
		Duration timeCount = Duration.between(startTime, finishTime);
        if (timeCount.toDays() > 0) {
        	totalTime += String.format("%d 天又 ",
                    Duration.between(startTime, finishTime).toDays());
        }
        if ((timeCount.toHours() - (timeCount.toDays() * 24)) > 0) {
        	totalTime +=String.format("%d 小時",
                    timeCount.toHours() - (timeCount.toDays() * 24));
            if (timeCount.toDays() == 0) {
            	totalTime +=String.format("又 ");
            } else {
            	totalTime +=String.format(" ");
            }
        }
        if ((timeCount.toMinutes() - timeCount.toHours() * 60) > 0) {
        	totalTime +=String.format("%d 分 ",
                    timeCount.toMinutes() - timeCount.toHours() * 60);
        }
        if ("d".equals(set)) {
        	totalTime +=String.format("%.3f 秒<p>",
                    ((double) timeCount.toMillis() / 1000 - timeCount.toMinutes() * 60));
        } else if ("i".equals(set)) {
        	totalTime +=String.format("%d 秒<p>",
                    (timeCount.toMillis() / 1000 - timeCount.toMinutes() * 60));
        }
        try {
			out.print(totalTime);
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
