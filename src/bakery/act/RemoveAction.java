package bakery.act;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bakery.bean.Item;

public class RemoveAction extends Action{
	public String execute(HttpServletRequest request)throws Exception {
		HttpSession session = request.getSession(true);

		@SuppressWarnings("unchecked")
		ArrayList<Item> list = (ArrayList<Item>)session.getAttribute("cart");

		String removePara = request.getParameter("remove");
		int remove = Integer.parseInt(removePara);
		list.remove(remove);
		 return "/cart.jsp";
	}
}
