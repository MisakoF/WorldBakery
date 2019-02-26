package bakery.act;

import javax.servlet.http.HttpServletRequest;

public class TopAction extends Action{
	public String execute(HttpServletRequest request) throws Exception {
		return "/top.jsp";
	}
}
