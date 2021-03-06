<%@ page import="java.util.ArrayList, java.util.Iterator,
kr.pe.okjsp.Bookmark"
pageEncoding="euc-kr"
%><html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=EUC-KR">
    <title>OKJSP Bookmark</title>
    <script src="/js/okjsp.js"></script>
    <script src="/js/banner.js"></script>
    <script src="/js/bannerData.js"></script>
    <script src="/js/okboard.js"></script>
<link rel="stylesheet" href="/css/okjsp2007.css.jsp" type="text/css">
</head>
<body class="body" style="margin:0">
<jsp:include page="/top.jsp" />
<table class="tablestyle, body" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign='top'>
      <jsp:include page="/menu.jsp" />
    </td>
    <td valign='top'>
    <h2>책갈피 목록</h2>
<ul>
<%
ArrayList list = (ArrayList)request.getAttribute("bookmark");
Iterator iter = list.iterator();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yy/MM/dd HH:mm");
while (iter.hasNext()) {
	Bookmark b = (Bookmark)iter.next();
	int seq = b.getSeq();
	String subject = kr.pe.okjsp.util.CommonUtil.a2k(b.getSubject());
%>
<li>
<a href="/seq/<%= seq %>"><%= subject %>
[<%= sdf.format(b.getCredate()) %> checked]</a>
<a style="cursor:pointer" onclick="deleteBookmark(<%= seq %>)" title="delete">x</a>
</li>
<%
}  // end while
%>
</ul>
<form name="bform" method="post">
<input type="hidden" name="pact" value="BOOKMARKDEL">
<input type="hidden" name="seq">
</form>
<script>
function deleteBookmark(n) {
    fobj = document.bform;
    fobj.seq.value = n;
    fobj.submit();
}
</script>

<%@ include file="/footer.jsp" %>
        </td>
    </tr>
</table>

<jsp:include page="/googleAnalytics.jsp" />
</body>
</html>