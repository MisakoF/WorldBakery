package bakery.bean;

import java.io.Serializable;

public class Item implements Serializable {
	private int itemID;
	private String itemJapaneseName;
	private String itemEnglishName;
	private int itemPrice;
	private String itemImage;

	public int getItemID() {
		return itemID;
	}
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	public String getItemJapaneseName() {
		return itemJapaneseName;
	}
	public void setItemJapaneseName(String itemJapaneseName) {
		this.itemJapaneseName = itemJapaneseName;
	}
	public String getItemEnglishName() {
		return itemEnglishName;
	}
	public void setItemEnglishName(String itemEnglishName) {
		this.itemEnglishName = itemEnglishName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemImage() {
		return itemImage;
	}
	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
}
