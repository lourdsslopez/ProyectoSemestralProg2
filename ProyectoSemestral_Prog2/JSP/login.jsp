<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login SoloCiencia</title>
</head>
<body>
<%
    String Nombre = request.getParameter("Nombre");
    String Contrasenha = request.getParameter("Contrasenha");

    Connection cnx = null;
    ResultSet rs = null;
    Statement sta = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        cnx = DriverManager.getConnection("jdbc:mysql://localhost/solociencia?user=root&password=");
        sta = cnx.createStatement();
        PreparedStatement consultaP = cnx.prepareStatement("SELECT * FROM usuarios_solociencia WHERE NOMBRE=? AND CONTRASENHA=?");

        consultaP.setString(1, Nombre);
        consultaP.setString(2, Contrasenha);

        ResultSet resultado = consultaP.executeQuery();
        if (resultado.next()) {
            // Usuario válido, redirigir a la página home.html
            response.sendRedirect("home.html");
        } else {
            // Usuario incorrecto o no registrado, mostrar mensaje de error y enlace de registro
%>
            <h3>Error de Login - USUARIO INCORRECTO</h3>
            <p>Si no estás registrado, por favor <a href="registro.html">regístrate aquí</a>.</p>
<%
        }
    } catch (Exception e) {
        out.println("--ERROR-- <br>");
        out.println("--Consulta Invalida--");
        out.println(e);
    }
%>
</body>
<footer>
</footer>
</html>
