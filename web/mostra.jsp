<%-- 
    Document   : mostra
    Created on : 13/03/2019, 20:16:36
    Author     : tuxcuiabano
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
<style>
body {
  background-color: linen;
}

h1 {
  color: maroon;
  margin-left: 40px;
} 

#centro {
    width:100px;
    height:100px;
    margin-left: 20px;
    align:left;
}

</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Minha linda página de busca de dados usando JSP</h1>
        <%
          String driver = "org.apache.derby.jdbc.ClientDriver";
          String url = "jdbc:derby://localhost:1527/etf";
          String username = "root";
          String password = "";
          try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, username, password);
            Statement statement = connection.createStatement();
            String sql = "SELECT * FROM JESUS";
            ResultSet resultados = statement.executeQuery(sql);

            while(resultados.next()){
 
             out.println("<img src='ifmt.svg' id='centro'> ");
             out.println("<b>" + resultados.getString("nome")+ " </b> - ");
             out.println( resultados.getString("email")+ "<br>");
             out.println( "---------------------------------------------------------<br><br>");

           }
            
         connection.close();
          } catch(ClassNotFoundException cnfe) {
              out.println("Erro loading driver" + cnfe);
          } catch(SQLException sqle) {
              out.println("Erro loading driver" + sqle);
          }
        
        %>
        
    </body>
</html>
