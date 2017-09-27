<%@page import="br.com.fatecpg.poo.BancoClientes"%>
<%@page import="br.com.fatecpg.poo.Cliente"%>
<%@page import="br.com.fatecpg.poo.BancoFornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Projeto03 POO - Clientes</title>

    <!-- Include Css Links -->
    <%@include file="WEB-INF/jspf/includeCss.jspf" %>
    <!-- Include Css End -->

  </head>
  <body ng-app="countCliente" ng-controller="counterCliente">

    <%int fz = BancoFornecedor.getFornecedor().size();%>

    <!-- Top Menu -->
    <div class="top-menu wow flipInX">
      <div class="container-fluid">
        <div class="row justify-content-center">
          <div class="col-md-3">
            <span class="text"><i class="icon fa fa-users"></i> Clientes Cadastrados: <span class="badge badge-dark wow bounceIn"> {{cliente}}</span></span>
          </div>
          <div class="col-md-3">
            <span><i class="fa fa-users"></i> Fornecedores Cadastrados: <span class="badge badge-dark wow bounceIn"> <%= fz%></span></span>
          </div>
        </div>
      </div>
    </div>
    <!-- Top Menu End -->

    <!-- Include Menu -->
    <%@include file="WEB-INF/jspf/includeMenu.jspf" %>
    <!-- Include Menu End -->


    <!-- Page Content -->
    <div id="clientes" class="container-fluid page" >

      <div class="col-md-12 title-box">
        <h1 class="title">Cadastrar Clientes</h1>
        <div class="divider"></div>
      </div>

      <%                String btnE = "hidden";
         String btnA = "";
         String auxStreet = ""; //DECLARANDO AS VARIÁVEIS AUXILIAR PARA A BUSCA DO CEP
         String auxCep = "";
         String auxCity = "";
         String auxDistrict = "";
         String auxState = "";
         String auxNumber = "";
         String auxComplement = "";
         String auxName = "";
         String auxRG = "";
         String auxCPF = "";
         String auxEmail = "";
         String auxPhone = "";
         int auxI = BancoClientes.getClientes().size();
         try {
            String msg1 = ""; //DECLARANDO AS VARIÁVEIS
            String msg2 = "";
            String msg3 = "";
            String name = request.getParameter("name"); //PEGANDO OS PARÂMETROS
            String cpf = request.getParameter("cpf");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String district = request.getParameter("district");
            String rg = request.getParameter("rg");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String street = request.getParameter("street");
            String number = request.getParameter("number");
            String complement = request.getParameter("complement");
            String cep = request.getParameter("cep");
            if ((name != null && cpf != null && rg != null && email != null && phone != null && street != null && number != null && cep != null && city != null && district != null && state != null) || (name != "" && cpf != "" && rg != "" && email != "" && phone != "" && street != "" && number != "" && cep != "" && city != "" && district != "" && state != "")) { //CHECKANDO OS PARÂMETROS
               if ((request.getParameter("include") != null) && (name != "" && cpf != "" && rg != "" && email != "" && phone != "" && street != "" && number != "" && cep != "" && city != "" && district != "" && state != "")) { //CHECKANDO A AÇÃO INCLUDE
                  btnE = "hidden";
                  btnA = "";
                  for (int x = 0; x < BancoClientes.getClientes().size(); x++) { //CHECKANDO SE JÁ EXISTE ESSE CLIENTE
                     Cliente c = BancoClientes.getClientes().get(x);
                     String nameTest = c.getName();
                     String cityTest = c.getCity();
                     String districtTest = c.getDistrict();
                     String emailTest = c.getEmail();
                     String stateTest = c.getState();
                     String phoneTest = c.getPhone();
                     String streetTest = c.getStreet();
                     String numberTest = c.getNumber();
                     String complementTest = c.getComplement();
                     String cpfTest = c.getCpf();
                     String rgTest = c.getRg();
                     if (cpfTest.equals(cpf)) { //CPF IGUAL
                        msg1 = "CPF já cadastrado no banco !!";
                     }
                     if (rgTest.equals(rg)) { //RG IGUAL
                        msg2 = "RG já cadastrado no banco !!";
                     }
                     if (rgTest.equals(rg) && cpfTest.equals(cpf) && nameTest.equals(name) && emailTest.equals(email) && phoneTest.equals(phone) && streetTest.equals(street) && numberTest.equals(number) && complementTest.equals(complement) && cityTest.equals(city) && districtTest.equals(district) && stateTest.equals(state)) { //CLIENTE IGUAL
                        msg3 = "Cliente já cadastrado no banco !!";
                     }
                  }
                  if ((msg1 == "" && msg2 == "" && msg3 == "")) { //TUDO CERTO, ADICIONANDO NO "BANCO"...
                     Cliente c = new Cliente();
                     c.setName(name);
                     c.setCpf(cpf);
                     c.setRg(rg);
                     c.setEmail(email);
                     c.setPhone(phone);
                     c.setStreet(street);
                     c.setNumber(number);
                     c.setComplement(complement);
                     c.setCep(cep);
                     c.setState(state);
                     c.setCity(city);
                     c.setDistrict(district);
                     BancoClientes.getClientes().add(c);
      %>
      <center>
        <div class="col-md-4 alert alert-success wow bounceIn"  data-wow-delay="0.2s" role="alert">
          Cadastro efetuado com sucesso !!
        </div>
      </center>

      <div class="row justify-content-center">
        <div class="col-md-2">
          <center>
            <div class="scroll">
              <a href="#table-cliente"><i class="fa fa-arrow-down"></i></a>
            </div>
          </center>
        </div>
      </div>
      <%
         }
         if (msg1 != "" && msg2 == "" && msg3 == "") { //ERRO !!!, CPF JÁ CADASTRADO"... %>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          <%= msg1%>
        </div>
      </center>

      <%} else if (msg1 == "" && msg2 != "" && msg3 == "") { //ERRO !!!, RG JÁ CADASTRADO"...%>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          <%= msg2%>
        </div>
      </center>

      <%} else if (msg1 != "" && msg2 != "" && msg3 == "") { //ERRO !!!, RG E CPF JÁ CADASTRADO"...%>

      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          RG e CPF já existente no banco !!
        </div>
      </center>

      <%} else if (msg3 != "") { //ERRO !!!, CLIENTE JÁ CADASTRADO"...%>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          <%= msg3%>
        </div>
      </center>
      <%}
      } else if (request.getParameter("remove") != null) { //REMOVENDO CLIENTE...
         btnE = "hidden";
         btnA = "";
         try {
            int i = Integer.parseInt(request.getParameter("i"));
            BancoClientes.getClientes().remove(i);
      %>
      <center>
        <div class="col-md-4 alert alert-success wow bounceIn"  data-wow-delay="0.2s" role="alert">
          Cliente removido com sucesso !!
        </div>
      </center>

      <%} catch (Exception ex) {
      %>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          Erro na exclusão do cliente ou cliente já excluído !!
        </div>
      </center>
      <%
         }

      } else if (request.getParameter("search") != null) { //BUSCANDO CEP
         btnE = "hidden";
         btnA = "";
         try {
            br.com.correios.bsb.sigep.master.bean.cliente.AtendeClienteService service = new br.com.correios.bsb.sigep.master.bean.cliente.AtendeClienteService();
            br.com.correios.bsb.sigep.master.bean.cliente.AtendeCliente port = service.getAtendeClientePort();
            br.com.correios.bsb.sigep.master.bean.cliente.EnderecoERP result = port.consultaCEP(cep);

            if (result.getEnd() != null) {
               auxName = name;
               auxCPF = cpf;
               auxRG = rg;
               auxEmail = email;
               auxPhone = phone;
               auxCep = cep;
               auxStreet = result.getEnd();
               auxDistrict = result.getBairro();
               auxCity = result.getCidade();
               auxState = result.getUf();

            } else {
               auxName = name;
               auxCPF = cpf;
               auxRG = rg;
               auxEmail = email;
               auxPhone = phone;
      %>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          ERRO NA BUSCA DO ENDEREÇO !!
        </div>
      </center>
      <%}

      } catch (Exception ex) {
         auxName = name;
         auxCPF = cpf;
         auxRG = rg;
         auxEmail = email;
         auxPhone = phone;
      %>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          ERRO NA BUSCA DO ENDEREÇO !!
        </div>
      </center>
      <%
         }
      } else if (request.getParameter("edit") != null) {
         btnE = "";
         btnA = "hidden";
         int i = Integer.parseInt(request.getParameter("i"));
         auxName = BancoClientes.getClientes().get(i).getName();
         auxCPF = BancoClientes.getClientes().get(i).getCpf();
         auxRG = BancoClientes.getClientes().get(i).getRg();
         auxEmail = BancoClientes.getClientes().get(i).getEmail();
         auxPhone = BancoClientes.getClientes().get(i).getPhone();
         auxCep = BancoClientes.getClientes().get(i).getCep();
         auxStreet = BancoClientes.getClientes().get(i).getStreet();
         auxDistrict = BancoClientes.getClientes().get(i).getDistrict();
         auxCity = BancoClientes.getClientes().get(i).getCity();
         auxState = BancoClientes.getClientes().get(i).getState();
         auxNumber = BancoClientes.getClientes().get(i).getNumber();
         auxComplement = BancoClientes.getClientes().get(i).getComplement();
         auxI = i;
      } else if (request.getParameter("edit1") != null && (name != "" && cpf != "" && rg != "" && email != "" && phone != "" && street != "" && number != "" && cep != "" && city != "" && district != "" && state != "")) {
         btnE = "hidden";
         btnA = "";
         try {
            int i = Integer.parseInt(request.getParameter("i"));
            auxName = request.getParameter("name"); //PEGANDO OS PARÂMETROS
            auxCPF = request.getParameter("cpf");
            auxCity = request.getParameter("city");
            auxState = request.getParameter("state");
            auxDistrict = request.getParameter("district");
            auxRG = request.getParameter("rg");
            auxEmail = request.getParameter("email");
            auxPhone = request.getParameter("phone");
            auxStreet = request.getParameter("street");
            auxNumber = request.getParameter("number");
            auxComplement = request.getParameter("complement");
            auxCep = request.getParameter("cep");
            Cliente c = new Cliente();
            c.setName(auxName);
            c.setCpf(auxCPF);
            c.setRg(auxRG);
            c.setEmail(auxEmail);
            c.setPhone(auxPhone);
            c.setStreet(auxStreet);
            c.setNumber(auxNumber);
            c.setComplement(auxComplement);
            c.setCep(auxCep);
            c.setState(auxState);
            c.setCity(auxCity);
            c.setDistrict(auxDistrict);
            BancoClientes.getClientes().remove(i);
            BancoClientes.getClientes().add(i, c);
            auxName = "";
            auxCPF = "";
            auxCity = "";
            auxState = "";
            auxDistrict = "";
            auxRG = "";
            auxEmail = "";
            auxPhone = "";
            auxStreet = "";
            auxNumber = "";
            auxComplement = "";
            auxCep = "";
      %>
      <center>
        <div class="col-md-4 alert alert-success wow bounceIn"  data-wow-delay="0.2s" role="alert">
          Cliente alterado com sucesso !!
        </div>
      </center>

      <%
      } catch (Exception ex) {
      %>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          Erro ao alterar cliente.
        </div>
      </center>
      <%
         }
      } else if (name == "" && cpf == "" && rg == "" && email == "" && phone == "" && street == "" && number == "" && cep == "" && city == "" && district == "" && state == "") {
      %>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          Preencha o formulário corretamente, por favor.
        </div>
      </center>
      <%
            }
         }

      } catch (Exception ex) {
      %>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          <div>ERRO !!</div>
          <div>Erro ao processar o comando: <%=ex.getMessage()%></div>
        </div>
      </center>
      <%
         }
      %>

      <div class="row justify-content-center">
        <div class="col-md-6">
          <form action="clientes.jsp">
            <input class="form-input" placeholder="Nome" type="text" name="name" value="<%=auxName%>" data-toggle="tooltip" data-placement="left" title="Digite seu Nome"/>
            <input class="form-input cpf" placeholder="CPF" type="text" name="cpf"  value="<%=auxCPF%>" data-toggle="tooltip" data-placement="left" title="Digite seu CPF"/>
            <input class="form-input rg" placeholder="RG" type="text" name="rg" value="<%=auxRG%>" data-toggle="tooltip" data-placement="left" title="Digite seu RG"/>
            <input class="form-input" placeholder="Email" type="text" name="email" value="<%=auxEmail%>" data-toggle="tooltip" data-placement="left" title="Digite seu Email"/>
            <input class="form-input telefone" placeholder="Telefone" type="text" name="phone" value="<%=auxPhone%>" data-toggle="tooltip" data-placement="left" title="Digite seu Telefone"/>
            <input class="form-input cep" placeholder="CEP" type="text" name="cep" value="<%=auxCep%>" data-toggle="tooltip" data-placement="left" title="Digite seu CEP"/>

            <center>
              <button class="btn btn-search" type="submit" id="search" name="search">Consultar CEP <i class="fa fa-search"></i></button>
            </center>

            <input  class="form-input" placeholder="Estado" type="text" name="state" value="<%=auxState%>" data-toggle="tooltip" data-placement="left" title="Digite seu Estado"/>
            <input  class="form-input" placeholder="Cidade" type="text" name="city" value="<%=auxCity%>" data-toggle="tooltip" data-placement="left" title="Digite sua Cidade"/>
            <input  class="form-input" placeholder="Bairro" type="text" name="district" value="<%=auxDistrict%>" data-toggle="tooltip" data-placement="left" title="Digite seu Bairro"/>
            <input class="form-input" placeholder="Rua" type="text" name="street" value="<%=auxStreet%>" data-toggle="tooltip" data-placement="left" title="Digite sua Rua"/>
            <input class="form-input" placeholder="Número" type="text" name="number" value="<%=auxNumber%>" data-toggle="tooltip" data-placement="left" title="Digite o Número"/>
            <input class="form-input" placeholder="Complemento" type="text" name="complement" value="<%=auxComplement%>" data-toggle="tooltip" data-placement="left" title="Digite o Complemento"/>
            <input type="hidden" name="i" value="<%=auxI%>"/>
            <center><button <%=btnA%> class="btn" type="submit" name="include">Adicionar <i class="fa fa-plus"></i></button></center>
            <center><button <%=btnE%> class="btn" type="submit" name="edit1">Editar <i class="fa fa-pencil"></i></button></center>
          </form>
        </div>
      </div>

      <div class="col-md-12 title-box">
        <h2 class="title">Clientes Cadastrados</h2>
        <div class="divider"></div>
      </div>

      <center>
        <div class="col-md-3">
          <input id="search-cliente" class="form-input"/>
        </div>
      </center>

      <div class="wrap-table">
        <div class="row">
          <div class="col-md-12">
            <table id="table-cliente" class="table table-striped">
              <thead>
                <tr class="table-top">
                  <th>Índice</th>
                  <th>Nome</th>
                  <th>CPF</th>
                  <th>RG</th>
                  <th>Email</th>
                  <th>Telefone</th>
                  <th>CEP</th>
                  <th>Estado</th>
                  <th>Cidade</th>
                  <th>Bairro</th>
                  <th>Rua</th>
                  <th>Número</th>
                  <th>Complemento</th>
                  <th>Exclusão</th>
                  <th>Alteração</th>
                </tr>
              </thead>
              <%
                 for (int i = 0; i < BancoClientes.getClientes().size(); i++) {
                    Cliente c = BancoClientes.getClientes().get(i);
              %>
              <tbody>
                <tr>
                  <td><%=i + 1%></td>
                  <td><%=c.getName()%></td>
                  <td><%=c.getCpf()%></td>
                  <td><%=c.getRg()%></td>
                  <td><%=c.getEmail()%></td>
                  <td><%=c.getPhone()%></td>
                  <td><%=c.getCep()%></td>
                  <td><%=c.getState()%></td>
                  <td><%=c.getCity()%></td>
                  <td><%=c.getDistrict()%></td>
                  <td><%=c.getStreet()%></td>
                  <td><%=c.getNumber()%></td>
                  <td><%=c.getComplement()%></td>

                  <td>
                    <form action="clientes.jsp">
                      <input type="hidden" name="i" value="<%=i%>"/>
                      <button class="btn" type="submit" name="remove">Excluir <i class="fa fa-close"></i></button>
                    </form>
                  </td>
                  <td>
                    <form action="clientes.jsp">
                      <input type="hidden" name="i" value="<%=i%>"/>
                      <button class="btn" type="submit" name="edit">Editar <i class="fa fa-pencil"></i></button>
                    </form>
                  </td>
                </tr>
              </tbody>
              <%
                 }
              %>
            </table>
          </div>
        </div>
      </div>

    </div>
    <!-- Page Content End -->
    <%
       int cz = BancoClientes.getClientes().size();
    %>
    <span id="cCount"><%=cz%></span>


    <!-- Include Footer -->
    <%@include file="WEB-INF/jspf/includeFooter.jspf" %>
    <!-- Include Footer End -->

    <!-- Include Javascript Links -->
    <%@include file="WEB-INF/jspf/includeJs.jspf" %>
    <!-- Include Javascript Links End -->

    <!-- Include Tooltip -->
    <%@include file="WEB-INF/jspf/includeTooltip.jspf" %>
    <!-- Include Tooltip End -->
  </div>
</body>
</html>
