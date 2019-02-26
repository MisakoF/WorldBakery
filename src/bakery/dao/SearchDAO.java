package bakery.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bakery.bean.Item;

public class SearchDAO {
	private Connection connection;
	private PreparedStatement p_statement_selectItems_no_key;
	private PreparedStatement p_statement_selectItems;

	public SearchDAO() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/";
		String user = "root";
		String password = "drumsdack";
		connection = DriverManager.getConnection(url, user, password);

		String sql1 = "SELECT * FROM java_web_system.item WHERE country=?";
		String sql2 = "SELECT * FROM java_web_system.item WHERE country=? and (japanese_name like ? or english_name like ?)";

		p_statement_selectItems_no_key = connection.prepareStatement(sql1);
		p_statement_selectItems = connection.prepareStatement(sql2);
	}

	public ArrayList<Item> search_table(String key, String country) throws SQLException {
		ResultSet rs_items = null;
		if(key != null){
			p_statement_selectItems.setString(1, country);
			p_statement_selectItems.setString(2, "%" + key + "%");
			p_statement_selectItems.setString(3, "%" + key + "%");
			rs_items = p_statement_selectItems.executeQuery();
		} else {
			p_statement_selectItems_no_key.setString(1, country );
			rs_items = p_statement_selectItems_no_key.executeQuery();
		}
		ArrayList<Item> list = new ArrayList<Item>();
		while(rs_items.next()){
			Item item = new Item();
			item.setItemID(rs_items.getInt("id"));
			item.setItemJapaneseName(rs_items.getString("japanese_name"));
			item.setItemEnglishName(rs_items.getString("english_name"));
			item.setItemPrice(rs_items.getInt("price"));
			item.setItemImage(rs_items.getString("img"));
			list.add(item);
		}
		if(rs_items != null){
			rs_items.close();
		}
		if(connection != null){
			connection.close();
		}
		return list;
	}
}
