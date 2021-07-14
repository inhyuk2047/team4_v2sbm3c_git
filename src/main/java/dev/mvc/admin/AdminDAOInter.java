package dev.mvc.admin;

import java.util.Map;

public interface AdminDAOInter {
  
  /**
   * 중복 아이디 검사
   * @param id
   * @return
   */
  public int checkID(String id);
  
  /**
   * 관리자 등록
   * @param adminVO
   * @return
   */
  public int create(AdminVO adminVO);
  
  /**
   * 로그인 처리
   * @param map
   * @return
   */
  public int login(Map<String, Object> map);
  
  /**
   * adminno로 관리자 정보 조회
   * @param adminno
   * @return
   */
  public AdminVO read(int adminno);
  
  /**
   * id로 관리자 정보 조회
   * @param id
   * @return
   */
  public AdminVO readById(String id);
}
