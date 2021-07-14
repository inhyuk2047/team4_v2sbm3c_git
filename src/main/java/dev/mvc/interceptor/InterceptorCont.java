package dev.mvc.interceptor;
 
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.admin.AdminVO;
 
@Controller
public class InterceptorCont {
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc = null;
  
  public InterceptorCont() {
    System.out.println("--> InterceptorCont created.");
  }
  
  /**
   * 새로고침을 방지하는 메시지 출력
   * @param memberno
   * @return
   */
  @RequestMapping(value="/login/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/login/" + url); // forward
    
    return mav; // forward
  }
 
  // http://localhost:9091/member/access.do
  @RequestMapping(value = "/member/access.do", method = RequestMethod.GET)
  public ModelAndView mmeber() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/member/access"); // /webapp/views/member/access.jsp
    
    return mav;
  }
  
  // http://localhost:9091/login/member_error.do
  @RequestMapping(value = "/login/member_error.do", method = RequestMethod.GET)
  public ModelAndView member_error() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/login/member_error"); // /webapp/WEB-INF/views/login/member_error.jsp
    
    return mav;
  }
  
  // http://localhost:9091/login/member_login.do
  @RequestMapping(value = "/login/member_login.do", method = RequestMethod.GET)
  public ModelAndView member_login() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/login/member_login"); // /webapp/WEB-INF/views/login/member_login.jsp
    
    return mav;
  }
  


  @RequestMapping(value = "/login/logout.do", method = RequestMethod.GET)
  public ModelAndView index(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    session.invalidate(); // 모든 세션 변수 삭제 예) 로그 아웃
    
    mav.setViewName("/index"); // /webapp/WEB-INF/views/index.jsp
    
    return mav;
  }
  
  // http://localhost:9091/admin/access.do
  @RequestMapping(value = "/admin/access.do", method = RequestMethod.GET)
  public ModelAndView admin() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/admin/access"); // /webapp/views/admin/access.jsp
    
    return mav;
  }
  
  // http://localhost:9091/login/admin_error.do
  @RequestMapping(value = "/login/admin_error.do", method = RequestMethod.GET)
  public ModelAndView admin_error() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/login/admin_error"); // /webapp/WEB-INF/views/login/admin_error.jsp
    
    return mav;
  }
  
  /**
   * 관리자 로그인 폼
   * @return
   */
  
  @RequestMapping(value = "/login/admin_login.do", method = RequestMethod.GET)
  public ModelAndView admin_login() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/login/admin_login"); // /webapp/WEB-INF/views/login/admin_login.jsp
    
    return mav;
  }
  
  /**
   * 관리자 로그인 처리
   * @param session
   * @param id
   * @param passwd
   * @return
   */
  @RequestMapping(value = "/login/admin_login.do", method = RequestMethod.POST)
  public ModelAndView admin_login_proc(HttpSession session, String id, String passwd) {
    ModelAndView mav = new ModelAndView();
    Map<String, Object> map = new HashMap<String, Object>();
    
    map.put("id",id);
    map.put("passwd",passwd);
    
    int count = this.adminProc.login(map);
    if(count == 1) {
      AdminVO adminVO = adminProc.readById(id);
      session.setAttribute("adminno", adminVO.getAdminno());
      session.setAttribute("id",id);
      session.setAttribute("passwd",passwd);
      session.setAttribute("grade", adminVO.getGrade());
      
      mav.setViewName("redirect:/index.do");
    }else {
      mav.addObject("url", "admin_login_fail_msg");
      
      mav.setViewName("redirect:/login/msg.do");
    }
    
    return mav;
  }
  
  /**
   * 관리자 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value = "/login/admin_logout.do", method = RequestMethod.GET)
  public ModelAndView admin_logout(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    session.invalidate(); // 모든 세션 변수 삭제 예) 로그 아웃
    
    mav.setViewName("/index"); // /webapp/WEB-INF/views/index.jsp
    
    return mav;
  }
  
 
}