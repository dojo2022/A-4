package model.column;

import java.io.Serializable;

public class ColumnGenre implements Serializable {
	private int column_genre_id;
	private String name;
	private String image;


	public int getColumn_genre_id() {
		return column_genre_id;
	}
	public void setColumn_genre_id(int column_genre_id) {
		this.column_genre_id = column_genre_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

}
