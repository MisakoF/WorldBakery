package bakery.act;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bakery.bean.Item;

public class CheckAction extends Action{
	public String execute(HttpServletRequest request) throws Exception{
	HttpSession session = request.getSession(true);

		@SuppressWarnings("unchecked")
		ArrayList<Item> list = (ArrayList<Item>)session.getAttribute("cart");
		if(list == null || list.size() == 0) {
			return "/no_item.jsp";
		} else {
			return "/cart.jsp";
		}
	}
}
