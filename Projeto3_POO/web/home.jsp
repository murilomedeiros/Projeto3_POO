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
    <div class="">
      <div class="col-md-12 title-box">
        <h1 class="title">Equipe</h1>
        <div class="divider"></div>
      </div>

      <div class="background">
        <div class="container">
          <div class="row justify-content-center">

            <div class="col-6 col-md-6 col-lg-4 wow bounceIn">
              <div class="cards">
                <center>
                  <img class="img-fluid rounded-circle" src="assets/img/guilherme.jpg" />
                  <h2>Guilherme de Mello</h2>
                  <h3>Desenvolvedor Front-End</h3>
                  <p>Responsável pela criação do layout de toda a aplicação.</p>
                  <div class="social">
                    <a href='https://www.facebook.com/guilherme.mello.731' class="facebook"><i class='fa fa-facebook-square' target='_blank'></i></a>
                    <a href='https://www.linkedin.com/in/guilhermedemello/' class="linkedin"><i class='fa fa-linkedin' target='_blank'></i></a>
                    <a href='https://github.com/guitmello' class="github"><i class='fa fa-github' target='_blank'></i></a>
                  </div>
                </center>
              </div>
            </div>

            <div class="col-6 col-md-4 col-lg-4 wow bounceIn" data-wow-delay="0.2s">
              <div class="cards">
                <center>
                  <img class="img-fluid rounded-circle" src="assets/img/murilo.jpg" />
                  <h2>Murilo Medeiros</h2>
                  <h3>Desenvolvedor Back-End</h3>
                  <p>Responsável pela criação de toda a manipulação dos dados do Cliente.</p>
                  <div class="social">
                    <a href='https://www.facebook.com/murilo.meedeiros?ref=br_rs' class="facebook"><i class='fa fa-facebook-square' target='_blank'></i></a>
                    <a href='https://github.com/murilomedeiros' class="github"><i class='fa fa-github' target='_blank'></i></a>
                  </div>
                </center>
              </div>
            </div>

            <div class="col-6 col-md-4 col-lg-4 wow bounceIn" data-wow-delay="0.4s">
              <div class="cards">
                <center>
                  <img class="img-fluid rounded-circle" src="assets/img/renan.jpg" />
                  <h2>Renan De Souza Pinto</h2>
                  <h3>Desenvolvedor Back-End</h3>
                  <p>Responsável pela criação de toda a manipulação dos dados do Fornecedor.</p>
                  <div class="social">
                    <a href='https://www.facebook.com/heyrenann' class="facebook"><i class='fa fa-facebook-square' target='_blank'></i></a>
                    <a href='https://www.linkedin.com/in/renan-pinto/' class="linkedin"><i class='fa fa-linkedin' target='_blank'></i></a>
                    <a href='https://github.com/Renanpinto' class="github"><i class='fa fa-github' target='_blank'></i></a>
                  </div>
                </center>
              </div>
            </div>

          </div>
        </div>
      </div>

    </div>
    <!-- Page Content End -->
    <div class="sub-line">
      <div class="line-footer"></div>
    </div>
    <!-- Include Footer -->
    <%@include file="WEB-INF/jspf/includeFooter.jspf" %>
    <!-- Include Footer End -->

    <!-- Include Javascript Links -->
    <%@include file="WEB-INF/jspf/includeJs.jspf" %>
    <!-- Include Javascript Links End -->

  </body>
</html>
