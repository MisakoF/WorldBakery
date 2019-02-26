package bakery.act;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bakery.bean.Item;

public class AddAction extends Action {
	public String execute(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		String ename = request.getParameter("ename");
		String jname = request.getParameter("jname");
		String price = request.getParameter("price");
		String image = request.getParameter("image");

		Item item = new Item();
		item.setItemID(Integer.parseInt(id));
		item.setItemEnglishName(ename);
		item.setItemJapaneseName(jname);
		item.setItemPrice(Integer.parseInt(price));
		item.setItemImage(image);

		HttpSession session = request.getSession(true);
		@SuppressWarnings("unchecked")
		ArrayList<Item> list = (ArrayList<Item>)session.getAttribute("cart");

		if(list == null){
		    list = new ArrayList<Item>();
		}
		list.add(item);
		session.setAttribute("cart", list);
		return "/top.jsp";
	    }
	}
