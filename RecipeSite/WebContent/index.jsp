<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import="board.*"%>
    <%
    	String center = request.getParameter("center");
    	if(center == null){
    		center = "center";
    	}
    	
    	String id = null;
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
		
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
 <jsp:include page="top.jsp"/>	
 <jsp:include page='<%=center+".jsp" %>'/>
 <jsp:include page="bottom.jsp"/>
</body>
</html>