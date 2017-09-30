package Model;

import java.sql.Date;

public class Jogos {

	private int codigotimea;
	private int codigotimeb;
	private int golstimea;
	private int golstimeb;
	private Date data;
		

	public int getCodigotimea() {
		return codigotimea;
	}
	public void setCodigotimea(int codigotimea) {
		this.codigotimea = codigotimea;
	}
	public int getCodigotimeb() {
		return codigotimeb;
	}
	public void setCodigotimeb(int codigotimeb) {
		this.codigotimeb = codigotimeb;
	}
	public int getGolstimea() {
		return golstimea;
	}
	public void setGolstimea(int golstimea) {
		this.golstimea = golstimea;
	}
	public int getGolstimeb() {
		return golstimeb;
	}
	public void setGolstimeb(int golstimeb) {
		this.golstimeb = golstimeb;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
}
