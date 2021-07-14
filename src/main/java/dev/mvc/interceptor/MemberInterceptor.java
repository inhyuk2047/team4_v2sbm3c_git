package dev.mvc.interceptor;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import nation.web.tool.Tool;
 
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 
public class MemberInterceptor extends HandlerInterceptorAdapter {
 
  // URL 요청후 콘트롤러 작동전에 실행함.
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    HttpSession session = request.getSession(true);
    // 회원 로그인시 "grade" 세션 변수 생성, "M" 할당
    String grade = Tool.checkNull((String)session.getAttribute("grade"));
    
    System.out.println("session.getAttribute(\"grade\"): " + grade);
    System.out.println("preHandle executed.");
    System.out.println("URL: " + request.getContextPath());
    
    if (grade.length() != 0 &&  grade.compareTo("M") <= 0){ // 접근 가능, 요청 페이지 처리,회원이거나 회원보다 높은 권한
      System.out.println("접속 권한 있음: " + grade);
      return true; // 요청 페이지로 계속 진행
    } else{
      // 에러 출력또는 로그인 페이지로 이동
      response.sendRedirect("/login/member_error.do");
      return false;
    }
  }
 
  // 요청 주소 결과 생성후 작동함
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    System.out.println("postHandle executed.");
    modelAndView.addObject("member", "회원 관련 기능을 출력합니다.");
 
  }
 
  // JSP등 View 페이지 출력전에 작동됨.
  @Override
  public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
      throws Exception {
    System.out.println("회원 Interceptor 실행 후 최종 출력됨.");
 
  }
  
}