<%-- 
    Document   : result
    Created on : 16/03/2019, 21:33:05
    Author     : tuxcuiabano
--%>

<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de Sucesso</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
   
      <div class="container">
          <div class="row jumbotron">
            <%
                UsuarioDAO dao = new UsuarioDAO();
                List<Usuario> usuarios = dao.getLista();

                String template = ""
                        + "<div class=\"col col-4 \">"
                        + " <div class=\"card card-obra-arte\">"
                        + "     <img class=\"card-img-top img-card\" src=\"%s\" alt=\"imagem\">"
                        + "     <div class=\"card-body\">"
                        + "         <h5 class=\"card-title\">%s</h5>"
                        + "         <p class=\"card-text\"><b>Autor:</b> %s <b>Data:</b> %s <br><b>Técnica:</b> %s</p>"
                        + "     </div>"
                        + " </div>"
                        + "</div>"
                        + "<br>";
                String saida = "";
                for (Usuario usuario : usuarios) {
                    saida = saida.concat(String.format(
                            template,
                            usuario.getImagem(),
                                usuario.getNome(),
                                usuario.getLogin(),
                                usuario.getEmail(),
                                usuario.getSenha()
                                
                  ) );
                }
                out.print(saida);

            %>

           </div></div>

        <form action="listaUsuario" method="POST">
            <input type="submit" value="Visualizar">            
        </form>
    </body>
</html>
