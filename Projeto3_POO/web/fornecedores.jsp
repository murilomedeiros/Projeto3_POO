<%@page import="br.com.fatecpg.poo.BancoFornecedor"%>
<%@page import="br.com.fatecpg.poo.Fornecedor"%>
<%@page import="br.com.fatecpg.poo.BancoClientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Projeto03 POO - Fornecedores</title>

    <!-- Include Css Links -->
    <%@include file="WEB-INF/jspf/includeCss.jspf" %>
    <!-- Include Css End -->

  </head>
  <body ng-app="countFornecedor" ng-controller="counterFornecedor">

    <%int cz = BancoClientes.getClientes().size();%>

    <!-- Top Menu -->
    <div id="top" class="top-menu">
      <div class="container-fluid">
        <div class="row justify-content-center">
          <div class="col-md-6">
            <span class="text"><i class="icon fa fa-users"></i> Clientes Cadastrados: <span class="badge badge-dark wow bounceIn"><%=cz%></span></span>
          </div>
          <div class="col-md-6">
            <span><i class="fa fa-users"></i> Fornecedores Cadastrados: <span class="badge badge-dark wow bounceIn"> {{fornecedor}}</span></span>
          </div>
        </div>
      </div>
    </div>
    <!-- Top Menu End -->

    <!-- Include Menu -->
    <%@include file="WEB-INF/jspf/includeMenu.jspf" %>
    <!-- Include Menu End -->


    <!-- Page Content -->
    <div class="container-fluid page">

      <div class="col-md-12 title-box">
        <h1 class="title">Cadastrar Fornecedores</h1>
        <div class="divider"></div>
      </div>

      <!-- Scroll Bottom -->
      <a id="scrollbottom" href="#table-fornecedor" class="scroll"><i class="fa fa-arrow-down"></i></a>
      <!-- Scroll Bottom End -->

      <%
         //BOTOES
         String btnE = "hidden";
         String btnA = "";

         //DECLARANDO AS VARIÁVEIS AUXILIARES PARA A BUSCA DO CEP
         String aRua = "";
         String aCep = "";
         String aCidade = "";
         String aBairro = "";
         String aEstado = "";
         String aNumero = "";
         String aComplemento = "";
         String aNome = "";
         String aRazaoSocial = "";
         String aCnpj = "";
         String aEmail = "";
         String aTelefone = "";
         int ii = 0;
         int aI = BancoFornecedor.getFornecedor().size();
         try {
            //VARIAVEIS DE MENSAGEM
            String msg1 = "";
            String msg2 = "";
            String msg3 = "";

            //PARAMETROS
            String nome = request.getParameter("nome");
            String cnpj = request.getParameter("cnpj");
            String razaoSocial = request.getParameter("razaoSocial");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String bairro = request.getParameter("bairro");
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            String rua = request.getParameter("rua");
            String numero = request.getParameter("numero");
            String complemento = request.getParameter("complemento");
            String cep = request.getParameter("cep");
            if ((nome != null && cnpj != null && razaoSocial != null && email != null && telefone != null && rua != null && numero != null && cep != null && cidade != null && bairro != null && estado != null) || (nome != "" && cnpj != "" && razaoSocial != "" && email != "" && telefone != "" && rua != "" && numero != "" && cep != "" && cidade != "" && bairro != "" && estado != "")) { //CHECKANDO OS PARÂMETROS

               //ACAO ADICIONAR
               if (request.getParameter("add") != null) {
                  btnE = "hidden";
                  btnA = "";
                  for (int x = 0; x < BancoFornecedor.getFornecedor().size(); x++) { //CHECKANDO SE JÁ EXISTE ESSE CLIENTE
                     Fornecedor c = BancoFornecedor.getFornecedor().get(x);
                     String nomeTest = c.getNome();
                     String cidadeTest = c.getCidade();
                     String bairroTest = c.getBairro();
                     String emailTest = c.getEmail();
                     String estadoTest = c.getEstado();
                     String telefoneTest = c.getTelefone();
                     String ruaTest = c.getRua();
                     String numeroTest = c.getNumero();
                     String complementoTest = c.getComplemento();
                     String cnpjTest = c.getCnpj();
                     String razaoSocialTest = c.getRazaoSocial();

                     if (cnpjTest.equals(cnpj)) { //CNPJ IGUAL
                        msg1 = "CNPJ já cadastrado no banco !!";
                     }

                     if (razaoSocialTest.equals(razaoSocial)) { //RAZAO IGUAL
                        msg2 = "Razão Social já cadastrada !!";
                     }

                     if (razaoSocialTest.equals(razaoSocial) && cnpjTest.equals(cnpj) && nomeTest.equals(nome) && emailTest.equals(email) && telefoneTest.equals(telefone) && ruaTest.equals(rua) && numeroTest.equals(numero) && complementoTest.equals(complemento) && cidadeTest.equals(cidade) && bairroTest.equals(bairro) && estadoTest.equals(estado)) { //CLIENTE IGUAL
                        msg3 = "Fornecedor já cadastrado no banco !!";
                     }
                  }

                  //ADICIONANDO NO BANCO
                  if ((msg1 == "" && msg2 == "" && msg3 == "")) {
                     Fornecedor c = new Fornecedor();
                     c.setNome(nome);
                     c.setCnpj(cnpj);
                     c.setRazaoSocial(razaoSocial);
                     c.setEmail(email);
                     c.setTelefone(telefone);
                     c.setRua(rua);
                     c.setNumero(numero);
                     c.setComplemento(complemento);
                     c.setCep(cep);
                     c.setEstado(estado);
                     c.setCidade(cidade);
                     c.setBairro(bairro);
                     BancoFornecedor.getFornecedor().add(c);
      %>
      <center>
        <div class="col-md-4 alert alert-success wow bounceIn"  data-wow-delay="0.2s" role="alert">
          Cadastro efetuado com sucesso !!
        </div>
      </center>

      <%
         }
         if (msg1 != "" && msg2 == "" && msg3 == "") { //ERRO !!!, CNPJ JÁ CADASTRADO"... %>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          <%= msg1%>
        </div>
      </center>

      <%} else if (msg1 == "" && msg2 != "" && msg3 == "") { //ERRO !!!, RAZAO SOCIAL JÁ CADASTRADO"...%>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          <%= msg2%>
        </div>
      </center>

      <%} else if (msg1 != "" && msg2 != "" && msg3 == "") { //ERRO !!!, RAZAO E CNPJ JÁ CADASTRADO"...%>

      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          Razão Social e CNPJ já existente no banco !!
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
            BancoFornecedor.getFornecedor().remove(i);
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
         //BUSCANDO CEP
      } else if (request.getParameter("consulta") != null) {
         btnE = "hidden";
         btnA = "";
         try {
            br.com.correios.bsb.sigep.master.bean.cliente.AtendeClienteService service = new br.com.correios.bsb.sigep.master.bean.cliente.AtendeClienteService();
            br.com.correios.bsb.sigep.master.bean.cliente.AtendeCliente port = service.getAtendeClientePort();
            br.com.correios.bsb.sigep.master.bean.cliente.EnderecoERP result = port.consultaCEP(cep);

            if (result.getEnd() != null) {
               aNome = nome;
               aCnpj = cnpj;
               aRazaoSocial = razaoSocial;
               aEmail = email;
               aTelefone = telefone;
               aCep = cep;
               aRua = result.getEnd();
               aBairro = result.getBairro();
               aCidade = result.getCidade();
               aEstado = result.getUf();

            } else {
               aNome = nome;
               aCnpj = cnpj;
               aRazaoSocial = razaoSocial;
               aEmail = email;
               aTelefone = telefone;
               aCep = cep;
      %>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          ERRO NA BUSCA DO ENDEREÇO !!
        </div>
      </center>
      <%}

      } catch (Exception ex) {
         aNome = nome;
         aCnpj = cnpj;
         aRazaoSocial = razaoSocial;
         aEmail = email;
         aTelefone = telefone;
         aCep = cep;
      %>
      <center>
        <div class="col-md-4 alert alert-danger wow bounceIn"  data-wow-delay="0.2s" role="alert">
          CEP Inexistente
        </div>
      </center>
      <%
         }

         //ALTERACAO DE CADASTRO - BUSCAR DADOS
      } else if (request.getParameter("altera") != null) {
         btnE = "";
         btnA = "hidden";
         int i = Integer.parseInt(request.getParameter("i"));
         ii = i;
         //out.print(ii);
         aNome = BancoFornecedor.getFornecedor().get(i).getNome();
         aCnpj = BancoFornecedor.getFornecedor().get(i).getCnpj();
         aRazaoSocial = BancoFornecedor.getFornecedor().get(i).getRazaoSocial();
         aEmail = BancoFornecedor.getFornecedor().get(i).getEmail();
         aTelefone = BancoFornecedor.getFornecedor().get(i).getTelefone();
         aCep = BancoFornecedor.getFornecedor().get(i).getCep();
         aRua = BancoFornecedor.getFornecedor().get(i).getRua();
         aBairro = BancoFornecedor.getFornecedor().get(i).getBairro();
         aCidade = BancoFornecedor.getFornecedor().get(i).getCidade();
         aEstado = BancoFornecedor.getFornecedor().get(i).getEstado();
         aNumero = BancoFornecedor.getFornecedor().get(i).getNumero();
         aComplemento = BancoFornecedor.getFornecedor().get(i).getComplemento();
         aI = i;
         BancoFornecedor.getFornecedor().remove(i);

         //ALTERACAO DE CADASTRO - ATUALIZAR DADOS
      } else if (request.getParameter("altera1") != null) {
         btnE = "hidden";
         btnA = "";
         //out.print(ii);
         try {
            //int i = Integer.parseInt(request.getParameter("i"));
            aNome = request.getParameter("nome"); //PEGANDO OS PARÂMETROS
            aCnpj = request.getParameter("cnpj");
            aCidade = request.getParameter("cidade");
            aEstado = request.getParameter("estado");
            aBairro = request.getParameter("bairro");
            aRazaoSocial = request.getParameter("razaoSocial");
            aEmail = request.getParameter("email");
            aTelefone = request.getParameter("telefone");
            aRua = request.getParameter("rua");
            aNumero = request.getParameter("numero");
            aComplemento = request.getParameter("complemento");
            aCep = request.getParameter("cep");
            Fornecedor c = new Fornecedor();
            c.setNome(aNome);
            c.setCnpj(aCnpj);
            c.setRazaoSocial(aRazaoSocial);
            c.setEmail(aEmail);
            c.setTelefone(aTelefone);
            c.setRua(aRua);
            c.setNumero(aNumero);
            c.setComplemento(aComplemento);
            c.setCep(aCep);
            c.setEstado(aEstado);
            c.setCidade(aCidade);
            c.setBairro(aBairro);
            //  out.println(ii);
            //BancoFornecedor.getFornecedor().get(i).setNome(aNome);
            /*BancoFornecedor.getFornecedor().get(i).setNome(aCnpj);
            BancoFornecedor.getFornecedor().get(i).setNome(aRazaoSocial);
            BancoFornecedor.getFornecedor().get(i).setNome(aEmail);
            BancoFornecedor.getFornecedor().get(i).setNome(aTelefone);
            BancoFornecedor.getFornecedor().get(i).setNome(aRua);
            BancoFornecedor.getFornecedor().get(i).setNome(aNumero);
            BancoFornecedor.getFornecedor().get(i).setNome(aComplemento);
            BancoFornecedor.getFornecedor().get(i).setNome(aCep);
            BancoFornecedor.getFornecedor().get(i).setNome(aEstado);
            BancoFornecedor.getFornecedor().get(i).setNome(aCidade);
            BancoFornecedor.getFornecedor().get(i).setNome(aBairro);*/
            //BancoFornecedor.getFornecedor().remove(aI);
            BancoFornecedor.getFornecedor().add(ii, c);
            //BancoFornecedor.getFornecedor().add(c);
            aNome = "";
            aCnpj = "";
            aRazaoSocial = "";
            aEmail = "";
            aTelefone = "";
            aCep = "";
            aRua = "";
            aBairro = "";
            aCidade = "";
            aEstado = "";
            aNumero = "";
            aComplemento = "";
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
      } else if (nome == "" && cnpj == "" && razaoSocial == "" && email == "" && telefone == "" && rua == "" && numero == "" && cep == "" && cidade == "" && bairro == "" && estado == "") {
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
          <form id="form" action="fornecedores.jsp">

            <input class="form-input dark-tooltip" type="text" name="nome" value="<%=aNome%>" placeholder="Nome" data-toggle="tooltip" data-placement="left" title="Digite seu Nome" maxlength="50" required/>

            <div class="row">
              <div class="col-md-8">
                <input class="form-input" type="text" name="razaoSocial" value="<%=aRazaoSocial%>" placeholder="Razão Social" data-toggle="tooltip" data-placement="left" title="Digite a Razão Social" maxlength="40" required/>
              </div>
              <div class="col-md-4">
                <input class="form-input cnpj" type="text" id="cnpj" name="cnpj" value="<%=aCnpj%>" placeholder="CNPJ" data-toggle="tooltip" data-placement="left" title="Digite o CNPJ" required/>
              </div>
            </div>

            <input class="form-input" type="email" name="email" value="<%=aEmail%>" placeholder="Email" data-toggle="tooltip" data-placement="left" title="Digite o E-mail" maxlength="50" required/>

            <div class="row">
              <div class="col-md-6">
                <input class="form-input telefone" type="text" name="telefone" value="<%=aTelefone%>" placeholder="Telefone" data-toggle="tooltip" data-placement="left" title="Digite o Telefone" required/>
              </div>
              <div class="col-md-6">
                <input class="form-input cep" type="text" name="cep"  value="<%=aCep%>" placeholder="CEP" data-toggle="tooltip" data-placement="right" title="Digite o CEP" required/>
              </div>
            </div>

            <center><button class="btn btn-search" id="consulta" name="consulta" value="Consulta">Consultar CEP <i class="fa fa-search"></i></button></center>

            <input class="form-input" type="text" name="estado"  value="<%=aEstado%>" placeholder="Estado" data-toggle="tooltip" data-placement="left" title="Digite o Estado" maxlength="50" />
            <input class="form-input" type="text" name="cidade"  value="<%=aCidade%>" placeholder="Cidade" data-toggle="tooltip" data-placement="left" title="Digite a Cidade" maxlength="50" />
            <input class="form-input" type="text" name="bairro"  value="<%=aBairro%>" placeholder="Bairro" data-toggle="tooltip" data-placement="left" title="Digite o Bairro" maxlength="50" />
            <input class="form-input"type="text" name="rua"  value="<%=aRua%>" placeholder="Rua" data-toggle="tooltip" data-placement="left" title="Digite a Rua" maxlength="50" />

            <div class="row">
              <div class="col-md-3">
                <input class="form-input numero" type="text" name="numero"  value="<%=aNumero%>" placeholder="Número" data-toggle="tooltip" data-placement="left" title="Digite o Número" />
              </div>
              <div class="col-md-9">
                <input class="form-input" type="text" name="complemento"  value="<%=aComplemento%>" placeholder="Complemento" data-toggle="tooltip" data-placement="right" title="Digite o Complemento" maxlength="40" />
              </div>
            </div>

            <center><button <%=btnA%> class="btn" type="submit" name="add">Adicionar <i class="fa fa-plus"></i></button></center>
            <center><button <%=btnE%> class="btn" type="submit" name="altera1">Alterar <i class="fa fa-pencil"></i></button></center>

          </form>
        </div>
      </div>

      <div class="col-md-12 title-box">
        <h2 class="title">Fornecedores Cadastrados</h2>
        <div class="divider"></div>
      </div>

      <center>
        <div class="col-md-5">
          <input id="search-fornecedor" class="form-input" placeholder="Pesquisar" data-toggle="tooltip" data-placement="left" title="Digite o que deseja procurar"/>
        </div>
      </center>

      <div class="wrap-table">
        <div class="row">
          <div class="col-md-12">
            <table id="table-fornecedor" class="table table-striped">
              <thead>
                <tr class="table-top">
                  <th>Indice</th>
                  <th>Nome</th>
                  <th>Razão Social</th>
                  <th>CNPJ</th>
                  <th>Email</th>
                  <th>Telefone</th>
                  <th>Rua</th>
                  <th>Numero</th>
                  <th>Bairro</th>
                  <th>Cidade</th>
                  <th>Estado</th>
                  <th>Complemento</th>
                  <th>CEP</th>
                  <th>Exclusão</th>
                  <th>Alteração</th>
                </tr>
              </thead>
              <%for (int i = 0; i < BancoFornecedor.getFornecedor().size(); i++) {
                    Fornecedor c = BancoFornecedor.getFornecedor().get(i);%>
              <tbody>
                <tr>
                  <td><%=i + 1%></td>
                  <td><%=c.getNome()%></td>
                  <td><%=c.getRazaoSocial()%></td>
                  <td><%=c.getCnpj()%></td>
                  <td><%=c.getEmail()%></td>
                  <td><%=c.getTelefone()%></td>
                  <td><%=c.getRua()%></td>
                  <td><%=c.getNumero()%></td>
                  <td><%=c.getBairro()%></td>
                  <td><%=c.getCidade()%></td>
                  <td><%=c.getEstado()%></td>
                  <td><%=c.getComplemento()%></td>
                  <td><%=c.getCep()%></td>
                  <td>
                    <form action="fornecedores.jsp">
                      <input type="hidden" name="i" value="<%=i%>"/>
                      <button class="btn" type="submit" name="remove">Excluir <i class="fa fa-trash"></i></button>
                    </form>
                  </td>
                  <td>
                    <form action="fornecedores.jsp">
                      <input type="hidden" name="i" value="<%=i%>"/>
                      <button class="btn" type="submit" name="altera">Editar <i class="fa fa-pencil"></i></button>
                    </form>
                  </td>
                </tr>
              </tbody>
              <%}%>

            </table>
          </div>
        </div>
      </div>

    </div>
    <!-- Page Content End -->

    <%
       int fz = BancoFornecedor.getFornecedor().size();
    %>
    <span id="fCount"><%=fz%></span>

    <!-- Scroll Top -->
    <a id="scrolltop" href="#top" class="scroll"><i class="fa fa-arrow-up"></i></a>
    <!-- Scroll Top End -->

    <!-- Include Footer -->
    <%@include file="WEB-INF/jspf/includeFooter.jspf" %>
    <!-- Include Footer End -->

    <!-- Include Javascript Links -->
    <%@include file="WEB-INF/jspf/includeJs.jspf" %>
    <!-- Include Javascript Links End -->

    <!-- Include Tooltip -->
    <%@include file="WEB-INF/jspf/includeTooltip.jspf" %>
    <!-- Include Tooltip End -->

  </body>
</html>
