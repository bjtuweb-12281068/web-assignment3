<%@ page contentType="text/html;charset=GB2312" 
language="java" import="java.sql.*"
%>
<html>
<head><title>数据库用户登录验证</title></head>
<% 
	if (request.getParameter("Username")!=null && request.getParameter("Password")!=null)
	{
		String strName=request.getParameter("Username");
		String strPass=request.getParameter("Password");
		Class.forName("com.mysql.jdbc.Driver");
		String strConn="jdbc:mysql://localhost:3306/ent_information";
		String strUser="root";
		String strPassword="root";
		Connection conn=DriverManager.getConnection(strConn,strUser,strPassword);
		Statement stat=conn.createStatement();
		String strSql="SELECT COUNT(*) FROM admin WHERE Admin_name='"+strName+"' and Admin_pass='"+strPass+"'";
		ResultSet result=stat.executeQuery(strSql);
		result.next();
		if (result.getInt(1)==1)
		{
			session.setAttribute("login","OK");
			response.sendRedirect("manager_function.jsp");
		}
		else
		{
			out.println("<h2>登录错误,请输入正确的用户名和密码</h2>");
		}
	}
 %>
</html>

