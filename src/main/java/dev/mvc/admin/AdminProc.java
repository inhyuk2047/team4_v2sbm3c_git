package dev.mvc.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.admin.AdminProc")
public class AdminProc implements AdminProcInter {
  @Autowired
  private AdminDAOInter adminDAO;

  @Override
  public int checkID(String id) {
    int cnt = this.adminDAO.checkID(id);
    return cnt;
  }

  @Override
  public int create(AdminVO adminVO) {
    int cnt = this.adminDAO.create(adminVO);
    return cnt;
  }

  @Override
  public int login(Map<String, Object> map) {
    int cnt = this.adminDAO.login(map);
    return cnt;
  }

  @Override
  public AdminVO read(int adminno) {
    AdminVO adminVO = this.adminDAO.read(adminno);
    return adminVO;
  }

  @Override
  public AdminVO readById(String id) {
    AdminVO adminVO = this.adminDAO.readById(id);
    return adminVO;
  }
}
