<%@ page contentType="text/html;charset=GB2312" 
language="java" import="java.sql.*"
%>
<html>
<head><title>���ݿ��û���¼��֤</title></head>
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
			out.println("<h2>��¼����,��������ȷ���û���������</h2>");
		}
	}
 %>
</html>

