<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page  import="com.app.utils.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <!-- footer-section-starts -->
	<div class="footer"> 
		<div class="container">
			
			<div class="clearfix"></div>
			<div class="copy-rights">
				<p>Copyright &copy; 2019. --  All rights reserved.
				</p>
			</div>
		</div>
	</div>
	<!-- footer-section-ends -->
</body>

<script type="text/javascript" src="<%=basePath %>static/home/js/nav.js"></script>
</html>