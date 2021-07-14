package dev.mvc.dept;

/*
 *  deptno                           NUMBER(10)       NOT NULL    PRIMARY KEY,
    univno                           NUMBER(10)       NOT NULL,
    depttype                         VARCHAR2(30)     NOT NULL,
    deptname                         VARCHAR2(50)     NOT NULL
 */
public class DeptVO {
	private int deptno;
	private int univno;
	private String dept_type;
	private String dept_name;
	
	
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public int getUnivno() {
		return univno;
	}
	public void setUnivno(int univno) {
		this.univno = univno;
	}
	public String getDept_type() {
		return dept_type;
	}
	public void setDept_type(String dept_type) {
		this.dept_type = dept_type;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	@Override
	public String toString() {
		return "DeptVO [deptno=" + deptno + ", univno=" + univno + ", dept_type=" + dept_type + ", dept_name="
				+ dept_name + "]";
	}
	
	
	
	

}
