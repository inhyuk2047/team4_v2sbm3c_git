package dev.mvc.admin;

/*
 *  adminno                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    id                                VARCHAR2(20)     NOT NULL,
    passwd                            VARCHAR2(60)     NOT NULL,
    check_admin                       VARCHAR2(1)    NOT NULL
 */
public class AdminVO {
  private int adminno;
  private String id;
  private String passwd;
  private String grade;
  
  public String getGrade() {
    return grade;
  }
  public void setGrade(String grade) {
    this.grade = grade;
  }
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  
}
