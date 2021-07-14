package dev.mvc.univ;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

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
public class UnivCont {
  @Autowired
  @Qualifier("dev.mvc.univ.UnivProc")
  private UnivProcInter univProc = null;
  
  public UnivCont() {
    System.out.println("-> UnivCont created.");
  }
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9091/univ/search_paging.do?univno=1&word=스위스&now_page=1
   * 
   * @param cateno
   * @param word
   * @param now_page
   * @return
   */
  
  @RequestMapping(value = "/univ/search_paging.do", method = RequestMethod.GET)
  public ModelAndView search_paging(
      @RequestParam(value = "word", defaultValue = "") String word,
      @RequestParam(value = "now_page", defaultValue = "1") int now_page,
      HttpServletRequest request) {
    System.out.println("-> search_paging now_page: " + now_page);

    ModelAndView mav = new ModelAndView();

    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word); // #{word}
    map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

    // 검색 목록
    List<UnivVO> list = univProc.search_paging(map);
    mav.addObject("list", list);

    // 검색된 레코드 갯수
    int search_count = univProc.search_count(map);
    mav.addObject("search_count", search_count);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
     * 18 19 20 [다음]
     * @param list_file 목록 파일명
     * @param univno 대학번호
     * @param search_count 검색(전체) 레코드수
     * @param now_page 현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */
    String paging = univProc.pagingBox("search_paging.do", search_count, now_page, word);
    mav.addObject("paging", paging);

    mav.addObject("now_page", now_page);

    // /univ/search_paging.jsp
    mav.setViewName("/univ/search_paging");

      
    return mav;
  }
 
}
