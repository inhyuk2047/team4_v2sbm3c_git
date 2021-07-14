<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
  <title>Team4</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>

  .dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
  }
  </style>

</head>
<body>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="/">Team4</a>
      </div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="/">Home</a></li>
        
        <li class="dropdown">
          <a href="/board/list.do">게시판
          <!-- 삼각형 나오게 하려면
          <span class="caret"></span>
           -->
           </a>
          <ul class="dropdown-menu">
            <li><a href="#">공지사항</a></li>
            <li><a href="#">자유게시판</a></li>
            <li><a href="#">Q&A</a></li>
          </ul>
        </li>
        
         <li class="dropdown">
          <a href="#">대학 정보</a>
          <ul class="dropdown-menu">
            <li><a href="#">4년제</a></li>
            <li><a href="#">전문대</a></li>
            <li><a href="#">기타 등등</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
          <a href="#">성적 정보</a>
          <ul class="dropdown-menu">
            <li><a href="#">시험명</a></li>
            <li><a href="#">&&</a></li>
            <li><a href="#">&&</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
          <a href="#">회원[관리자]</a>
          <ul class="dropdown-menu">
            <li><a href="#">회원 정보</a></li>
          </ul>
        </li>

      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> 가입하기</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <c:choose>
          <c:when test="${sessionScope.id == null}">
            <li><a href="/login/admin_login.do"><span class="glyphicon glyphicon-log-in" style='margin-right:7px;'></span>관리자 로그인</a></li>
          </c:when>
          <c:otherwise>
            <li style='margin-top: 13px;'>관리자 ${sessionScope.id } 님</li>
            <li><a href='/login/admin_logout.do'><span class="glyphicon glyphicon-log-out"  style='margin-right:7px;'></span>관리자 로그아웃</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </nav>

</body>
</html>