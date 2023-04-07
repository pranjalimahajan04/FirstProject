//This is a product class
package app;

public class Products implements Comparable<Products> {
	
	private int id,qunt;
	private String nm,desc,category;
	private float price;
	public Products(int id, String nm, String desc, String category, float price,int qunt) {
		super();
		this.id = id;
		this.nm = nm;
		this.desc = desc;
		this.category = category;
		this.price = price;
		this.qunt= qunt;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getQunt() {
		return qunt;
	}
	public void setQunt(int qunt) {
		this.qunt = qunt;
	}
	@Override
	public String toString() {
		return "id=" + id + ", nm=" + nm + ", desc=" + desc + ", category=" + category + ", price=" + price+ ", qnt=" + qunt ;
	}
	
	@Override
	public int compareTo(Products o) {
		return this.nm.compareTo(o.nm);
	}
	
}