package dev.mvc.admin;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 

@Controller
public class AdminCont {
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc = null;
  
  public AdminCont() {
    System.out.println("-> AdminCont created.");
  }
  
  /**
   * 새로고침을 방지하는 메시지 출력
   * @param memberno
   * @return
   */
  @RequestMapping(value="/admin/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/admin/" + url); // forward
    
    return mav; // forward
  }
  
 /**
 * ID 중복 체크, JSON 출력
 * @return
 */
 @ResponseBody
 @RequestMapping(value="/admin/checkID.do", method=RequestMethod.GET ,
                        produces = "text/plain;charset=UTF-8" )
 public String checkID(String id) {
   int cnt = this.adminProc.checkID(id);
  
   JSONObject json = new JSONObject();
   json.put("cnt", cnt);
  
   return json.toString(); 
 }
 
 /**
 * 등록 폼
 * @return
 */
 @RequestMapping(value="/admin/create.do", method=RequestMethod.GET )
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/admin/create"); // webapp/member/create.jsp
  
   return mav; // forward
 }
 
 /**
  * 등록 처리
  * @param memberVO
  * @return
  */
 @RequestMapping(value="/admin/create.do", method=RequestMethod.POST)
 public ModelAndView create(AdminVO adminVO){
   ModelAndView mav = new ModelAndView();
   
   // System.out.println("id: " + memberVO.getId());
   
   int cnt= adminProc.create(adminVO);
   mav.addObject("cnt", cnt); // redirect parameter 적용
   mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter 적용
   
   mav.setViewName("redirect:/admin/msg.do"); // 새로고침 방지
   
   return mav;
 }
}
