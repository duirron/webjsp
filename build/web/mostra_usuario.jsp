<%-- 
    Document   : mostra_usuario
    Created on : 16/03/2019, 21:54:37
    Author     : tuxcuiabano
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de usuários</title>
    </head>
    <body>
    <body>
    <center>
        <h1>Lista de Obras </h1>
        <%   
          List<Usuario> lista = (List)request.getAttribute("listausuario"); 
          for (Usuario usuario : lista) {
          out.println("<b>Nome: </b>" + usuario.getNome()+", ");  
          out.println("<b>Data: </b>" + usuario.getLogin()+", ");
          out.println("<b>Tecnica: </b>" + usuario.getSenha()+", ");
          out.println("<b>Dimensoes: </b>" + usuario.getEmail()+"<br> "); 
         }
         %>     
    </center>
            
    </body>
</html>
