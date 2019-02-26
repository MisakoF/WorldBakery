package bakery.act;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bakery.bean.Item;
import bakery.dao.SearchDAO;

public class SearchAction extends Action{
	public String execute(HttpServletRequest request) throws Exception{
		String keyword = request.getParameter("keyword");
		String country = request.getParameter("country");
		SearchDAO searchDao = new SearchDAO();
		ArrayList<Item> list = searchDao.search_table(keyword, country);
		HttpSession session = request.getSession(true);
		session.setAttribute("table_items",list );
		if(list.size() == 0){
		    request.setAttribute("no_item", "");
		}
		return "/top.jsp";
	}
}
