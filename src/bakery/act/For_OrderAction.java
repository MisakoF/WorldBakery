package bakery.act;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bakery.bean.Item;

public class For_OrderAction extends Action{
	@Override
	public String execute(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(true);

		@SuppressWarnings("unchecked")
		ArrayList<Item> cart = (ArrayList<Item>)session.getAttribute("cart");
		if (cart == null || cart.size() == 0) {
			return "/no_item.jsp";
		} else {
			return "/order.jsp";
		}
	}
}
