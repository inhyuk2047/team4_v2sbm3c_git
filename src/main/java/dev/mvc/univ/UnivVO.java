package dev.mvc.univ;

/*
 *  univno                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    location                         VARCHAR2(20)     NOT NULL,
    univname                         VARCHAR2(40)     NOT NULL
 */
public class UnivVO {
	private int univno;
	private String location;
	private String univname;
	
	public int getUnivno() {
		return univno;
	}
	public void setUnivno(int univno) {
		this.univno = univno;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getUnivname() {
		return univname;
	}
	public void setUnivname(String univname) {
		this.univname = univname;
	}
	@Override
	public String toString() {
		return "UnivVO [univno=" + univno + ", location=" + location + ", univname=" + univname + "]";
	}

}
