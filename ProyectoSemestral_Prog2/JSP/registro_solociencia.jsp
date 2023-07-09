<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registro Exitoso</title>
</head>
<body>

 

 

<%

 

                String Nombre = request.getParameter("Nombre");
                String Apellido = request.getParameter("Apellido");
                String Edad = request.getParameter("Edad");
                String Contrasenha = request.getParameter("Contrasenha");

 

                Connection cnx=null;
                ResultSet rs=null;
                Statement sta=null;

 

 

                try{
                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/solociencia?user=root&password=");
                sta = cnx.createStatement();
                sta.executeUpdate("INSERT INTO usuarios_solociencia (Nombre, Apellido, Edad, Contrasenha) VALUES ('" +Nombre+"', '" +Apellido+"', '" +Edad+"', '" +Contrasenha+"')");

 

                out.print("Registro a SoloCiencia Exitoso!");
                }catch(Exception e){
                    out.print(e);
                }



 


        %>
<a href="login.html"> IR A LOGIN </a>
</body>
<footer>
</footer>
</html>