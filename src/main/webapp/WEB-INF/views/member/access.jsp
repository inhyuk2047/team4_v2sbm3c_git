<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>회원 전용</title> 

<link href="/css/style.css" rel="Stylesheet" type="text/css"> <%-- /static --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(function(){

});
</script>


</head> 
<!-- ----------------------------------------- -->
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<DIV class='container'>
  <H1>회원 전용 페이지입니다.</H1>
  <H2>${member }</H2>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 




