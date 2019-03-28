/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tuxcuiabano
 */
public class UsuarioDAO {
    
    
     // a conexão com o banco de dados
  private Connection connection;
  
           public UsuarioDAO() throws ClassNotFoundException {
             this.connection = new ConnectionFactory().getConnection();
         }
    
     
   //método para adicionar usuário        
    public void adiciona(Usuario usuario) {

     String sql = "insert into JESUS " +
             "(nome,login, senha, email, imagem)" +
             " values (?,?,?,?,?)";

     try {
          
         // prepared statement para inserção
         PreparedStatement stmt = connection.prepareStatement(sql);

         // seta os valores
         stmt.setString(1,usuario.getNome());
         stmt.setString(2,usuario.getLogin());
         stmt.setString(3,usuario.getSenha());
         stmt.setString(4, usuario.getEmail());
         stmt.setString(5, usuario.getImagem());

         // executa
         stmt.execute();
         stmt.close();
     } catch (SQLException e) {
         throw new RuntimeException(e);
     }
 }
    
    
    public List<Usuario> getLista() {
             try {
                
                 List<Usuario> usuarios = new ArrayList<>();
                 PreparedStatement stmt = this.connection.prepareStatement("select * from JESUS");
                 ResultSet rs = stmt.executeQuery();

                 while (rs.next()) {

                     // criando o objeto Usuario
                     Usuario usuario;
                     usuario = new Usuario();         
                     usuario.setNome(rs.getString("nome"));
                     usuario.setLogin(rs.getString("login"));
                     usuario.setSenha(rs.getString("senha"));
                     usuario.setEmail(rs.getString("email"));
                     usuario.setImagem(rs.getString("imagem"));


                     // adicionando o objeto à lista
                     usuarios.add(usuario);
                 }
                 rs.close();
                 stmt.close();
                 return usuarios;
             } catch (SQLException e) {
                 throw new RuntimeException(e);
             }
         }
    
    
    
    
    
    
}
