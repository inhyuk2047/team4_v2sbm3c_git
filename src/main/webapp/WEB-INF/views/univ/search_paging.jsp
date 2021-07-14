<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
  
  
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./search_paging.do'>
      
      <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./search_paging.do?univno=${univno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>

  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 13%;"></col>
      <col style="width: 77%;"></col>
    </colgroup>
    <%-- table 컬럼 --%>
    <thead>
      <tr>
        <th style='text-align: center;'>대학명</th>
        <th style='text-align: center;'>지역</th>
      </tr>
    
    </thead>
    
    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="univVO" items="${list }" varStatus="status">
        <c:set var="univno" value="${univVO.univno }" />
        <c:set var="univname" value="${univVO.univname }" />
        <c:set var="location" value="${univVO.location }" />
        
        <tr> 
          <td style='vertical-align: middle; text-align: center;'>
         	${location}
          </td>  
          
          <td style='vertical-align: middle; text-align: center;'>
       		<a href="../dept/search_paging.do?univno=${univno}">${univname}</a>
       	  </td>
           
          <td style='vertical-align: middle; text-align: center;'>
      
          </td>
           
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
  <DIV class='bottom_menu'>${paging }</DIV>
</DIV>


<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>