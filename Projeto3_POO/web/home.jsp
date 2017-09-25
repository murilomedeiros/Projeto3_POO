<%@page import="br.com.fatecpg.poo.BancoClientes"%>
<%@page import="br.com.fatecpg.poo.BancoFornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Projeto03 POO - Home</title>

    <!-- Include Css Links -->
    <%@include file="WEB-INF/jspf/includeCss.jspf" %>
    <!-- Include Css End -->

  </head>
  <body data-spy="scroll" data-target="#menu">

    <!-- Include Top Menu -->
    <%@include file="WEB-INF/jspf/includeClienteCounter.jspf" %>
    <!-- Include Top Menu End -->

    <!-- Include Menu -->
    <%@include file="WEB-INF/jspf/includeMenu.jspf" %>
    <!-- Include Menu End -->


    <!-- Page Content -->
    <div class="container-fluid page">

    </div>
    <!-- Page Content End -->


    <!-- Include Footer -->
    <%@include file="WEB-INF/jspf/includeFooter.jspf" %>
    <!-- Include Footer End -->

    <!-- Include Javascript Links -->
    <%@include file="WEB-INF/jspf/includeJs.jspf" %>
    <!-- Include Javascript Links End -->

  </body>
</html>
