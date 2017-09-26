<%@page import="br.com.fatecpg.poo.BancoFornecedor"%>
<%@page import="br.com.fatecpg.poo.Fornecedor"%>
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
  <body>
    <!-- Include Menu -->
    <%@include file="WEB-INF/jspf/includeMenu.jspf" %>
    <!-- Include Menu End -->


    <!-- Page Content -->
    <div class="container-fluid page">

      <div class="col-md-12 title-box">
        <h1 class="title">Cadastrar Fornecedores</h1>
        <div class="divider"></div>
      </div>

      <%
         String nome;
         String razaoSocial;
         String cnpj;
         String email;
         String telefone;
         String rua;
         String numero;
         String bairro;
         String cidade;
         String estado;
         String pais;
         String cep;
         String anome = "";
         String arazaoSocial = "";
         String acnpj = "";
         String aemail = "";
         String atelefone = "";
         String aendereco = "";
         String acep = "";
         String arua = "";
         String abairro = "";
         String acidade = "";
         String aestado = "";
         String apais = "";
         String anumero = "";
         String msg1 = "";
         String msg2 = "";
         String msg3 = "";

         try {
            nome = request.getParameter("nome");
            razaoSocial = request.getParameter("razaoSocial");
            cnpj = request.getParameter("cnpj");
            email = request.getParameter("email");
            telefone = request.getParameter("telefone");
            rua = request.getParameter("rua");
            numero = request.getParameter("numero");
            bairro = request.getParameter("bairro");
            cidade = request.getParameter("cidade");
            estado = request.getParameter("estado");
            cep = request.getParameter("cep");

            if (nome != null && razaoSocial != null && cnpj != null && email != null && telefone != null && rua != null && bairro != null && cep != null && cidade != null && numero != null && estado != null) {
               if (request.getParameter("add") != null) { //CHECKANDO A AÇÃO INCLUDE
                  for (int x = 0; x < BancoFornecedor.getFornecedor().size(); x++) { //CHECKANDO SE JÁ EXISTE ESSE CLIENTE
                     Fornecedor c = BancoFornecedor.getFornecedor().get(x);
                     String nomeTest = c.getNome();
                     String emailTest = c.getEmail();
                     String cepTest = c.getCep();
                     String numberTest = c.getNumero();
                     String cnpjTest = c.getCnpj();
                     String razaoSocialTest = c.getRazaoSocial();

                     if (razaoSocialTest.equals(razaoSocial) && cnpjTest.equals(cnpj) && nomeTest.equals(nome) && emailTest.equals(email) && cepTest.equals(cep)) { //CLIENTE IGUAL
                        msg1 = "Cliente já cadastrado no banco !!";
                     } else if (cnpjTest.equals(cnpj)) { //CNPJ IGUAL
                        msg2 = "CNPJ já cadastrado no banco !!";
                     } else if (razaoSocialTest.equals(razaoSocial)) { //RazaoSocial IGUAL
                        msg3 = "Razão social já cadastrado no banco !!";
                     }

                  }
                  if ((msg1 == "" && msg2 == "" && msg3 == "")) {
                     Fornecedor c = new Fornecedor();
                     c.setNome(nome);
                     c.setRazaoSocial(razaoSocial);
                     c.setCnpj(cnpj);
                     c.setEmail(email);
                     c.setTelefone(telefone);
                     c.setRua(rua);
                     c.setNumero(numero);
                     c.setBairro(bairro);
                     c.setCidade(cidade);
                     c.setEstado(estado);
                     c.setCep(cep);
                     BancoFornecedor.getFornecedor().add(c);
      %>
      <center>
        <div class="col-md-4 alert alert-success wow bounceIn"  data-wow-delay="0.2s" role="alert">
          Cadastro efetuado com sucesso !!
        </div>
      </center>
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
      <%   }
         }
      } else if (request.getParameter("remove") != null) { //REMOVENDO CLIENTE...
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

      } else if (request.getParameter("altera") != null) {
         int i = Integer.parseInt(request.getParameter("i"));
         anome = BancoFornecedor.getFornecedor().get(i).getNome();
         arazaoSocial = BancoFornecedor.getFornecedor().get(i).getRazaoSocial();
         acnpj = BancoFornecedor.getFornecedor().get(i).getCnpj();
         aemail = BancoFornecedor.getFornecedor().get(i).getEmail();
         atelefone = BancoFornecedor.getFornecedor().get(i).getTelefone();
         acep = BancoFornecedor.getFornecedor().get(i).getCep();
         arua = BancoFornecedor.getFornecedor().get(i).getRua();
         abairro = BancoFornecedor.getFornecedor().get(i).getBairro();
         acidade = BancoFornecedor.getFornecedor().get(i).getCidade();
         aestado = BancoFornecedor.getFornecedor().get(i).getEstado();
         apais = BancoFornecedor.getFornecedor().get(i).getPais();
         anumero = BancoFornecedor.getFornecedor().get(i).getNumero();
         BancoFornecedor.getFornecedor().remove(i);

      } else if (request.getParameter("consulta") != null) { //BUSCANDO CEP
         try {
            br.com.correios.bsb.sigep.master.bean.cliente.AtendeClienteService service = new br.com.correios.bsb.sigep.master.bean.cliente.AtendeClienteService();
            br.com.correios.bsb.sigep.master.bean.cliente.AtendeCliente port = service.getAtendeClientePort();
            cep = request.getParameter("cep");
            br.com.correios.bsb.sigep.master.bean.cliente.EnderecoERP result = port.consultaCEP(cep);
            out.println(result.getEnd());
            abairro = result.getBairro();
            if (result.getEnd() != null) {
               out.println("Result = " + result.getUf());

               anome = nome;
               acnpj = cnpj;
               arazaoSocial = razaoSocial;
               aemail = email;
               atelefone = telefone;
               acep = cep;
               arua = result.getEnd();
               abairro = result.getBairro();
               acidade = result.getCidade();
               aestado = result.getUf();
            } else {
               anome = nome;
               acnpj = cnpj;
               arazaoSocial = razaoSocial;
               aemail = email;
               atelefone = telefone;
               acep = cep;
      %>
      <div><label>ERRO NA BUSCA DO ENDEREÇO !!</label></div>
      <%}

      } catch (Exception ex) {
         anome = nome;
         acnpj = cnpj;
         arazaoSocial = razaoSocial;
         aemail = email;
         atelefone = telefone;
         acep = cep;
      %>
      <div><label>ERRO NA BUSCA DO ENDEREÇO !!</label></div>
      <%
         }
      } else if (nome == "" && cnpj == "" && razaoSocial == "" && email == "" && telefone == "" && rua == "" && numero == "" && cep == "" && cidade == "" && bairro == "" && estado == "") {
      %>
      <div>Preencha o formulário corretamente, por favor.</div>
      <%
         }

      } catch (Exception ex) {
      %>
      <div>ERRO !!</div>
      <div>Erro ao processar o comando: <%=ex.getMessage()%></div>
      <%
         }
      %>
      <%-- end web service invocation --%>

      <div class="row justify-content-center">
        <div class="col-md-2">
          <center>
            <div class="scroll">
              <a href="#table-fornecedor"><i class="fa fa-arrow-down"></i></a>
            </div>
          </center>
        </div>
      </div>

      <div class="row justify-content-center">
        <div class="col-md-6">
          <form id="form">

            <input class="form-input" type="text" name="nome" value="<%=anome%>" placeholder="Nome" required/>
            <input class="form-input" type="text" name="razaoSocial" value="<%=arazaoSocial%>" placeholder="Razão Social" required/>
            <input class="form-input" type="text" id="cnpj" name="cnpj" value="<%=acnpj%>" placeholder="CNPJ" required/>
            <input class="form-input" type="text" name="email" value="<%=aemail%>" placeholder="Email" required/>
            <input class="form-input" type="text" name="telefone" value="<%=atelefone%>" placeholder="Telefone" required/>
            <input class="form-input" type="text" name="cep"  value="<%=acep%>" placeholder="CEP" required/>

            <center><button class="btn btn-search" id="consulta" name="consulta" value="Consulta">Consultar CEP <i class="fa fa-search"></i></button></center>

            <input class="form-input" type="text" name="estado"  value="<%=aestado%>" placeholder="Estado" />
            <input class="form-input" type="text" name="cidade"  value="<%=acidade%>" placeholder="Cidade" />
            <input class="form-input" type="text" name="bairro"  value="<%=abairro%>" placeholder="Bairro" />
            <input class="form-input"type="text" name="rua"  value="<%=arua%>" placeholder="Rua" />
            <input class="form-input" type="text" name="numero"  value="<%=anumero%>" placeholder="Número" />

            <center><button class="btn" type="submit" name="add">Adicionar <i class="fa fa-plus"></i></button></center>

          </form>
        </div>
      </div>

      <div class="col-md-12 title-box">
        <h2 class="title">Fornecedores Cadastrados</h2>
        <div class="divider"></div>
      </div>

      <center>
        <div class="col-md-3">
          <input id="search-fornecedor" class="form-input"/>
        </div>
      </center>

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
              <th>CEP</th>
              <th>Exclusão</th>
              <th>Alteração</th>
            </tr>
          </thead>
          <%for (int i = 0; i < BancoFornecedor.getFornecedor().size(); i++) {
                Fornecedor c = BancoFornecedor.getFornecedor().get(i);%>
          <tbody>
            <tr>
              <td><%=i%></td>
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
              <td><%=c.getCep()%></td>
              <td>
                <form>
                  <input type="hidden" name="i" value="<%=i%>"/>
                  <button class="btn" type="submit" name="remove">Excluir <i class="fa fa-close"></i></button>
                </form>
              </td>
              <td>
                <form>
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
    <!-- Page Content End -->


    <!-- Include Footer -->
    <%@include file="WEB-INF/jspf/includeFooter.jspf" %>
    <!-- Include Footer End -->

    <!-- Include Javascript Links -->
    <%@include file="WEB-INF/jspf/includeJs.jspf" %>

    <!-- Include Javascript Links End -->

    <%-- start web service invocation --%>
    <%--
    <%
    try {
        nome = request.getParameter("nome");
                razaoSocial = request.getParameter("razaoSocial");
                cnpj = request.getParameter("cnpj");
                email = request.getParameter("email");
                telefone = request.getParameter("telefone");
                rua = request.getParameter("rua");
                numero = request.getParameter("numero");
                bairro = request.getParameter("bairro");
                cidade = request.getParameter("cidade");
                estado = request.getParameter("estado");
                cep = request.getParameter("cep");
        br.com.correios.bsb.sigep.master.bean.cliente.AtendeClienteService service = new br.com.correios.bsb.sigep.master.bean.cliente.AtendeClienteService();
        br.com.correios.bsb.sigep.master.bean.cliente.AtendeCliente port = service.getAtendeClientePort();
         // TODO initialize WS operation arguments here
        String cepi = request.getParameter("cep");
        // TODO process result here
        br.com.correios.bsb.sigep.master.bean.cliente.EnderecoERP result = port.consultaCEP(cepi);
        if (result.getEnd() != null) {
        out.println("Result = "+result.getBairro());
                        anome = nome;
                        acnpj = cnpj;
                        arazaoSocial = razaoSocial;
                        aemail = email;
                        atelefone = telefone;
                        acep = cep;
                        arua = result.getEnd();
                        abairro = result.getBairro();
                        acidade = result.getCidade();
                        aestado = result.getUf();
        }
    } catch (Exception ex) {
        // TODO handle custom exceptions here
    }
    %>--%>
    <%-- end web service invocation --%>
  </body>
</html>
