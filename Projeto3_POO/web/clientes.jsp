<%@page import="br.com.fatecpg.poo.BancoClientes"%>
<%@page import="br.com.fatecpg.poo.Cliente"%>
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
    <body>
        <!-- Include Menu -->
        <%@include file="WEB-INF/jspf/includeMenu.jspf" %>
        <!-- Include Menu End -->


        <!-- Page Content -->
        <h1>Clientes</h1>
        <%      
                String auxStreet = "" ; //DECLARANDO AS VARIÁVEIS AUXILIAR PARA A BUSCA DO CEP
                String auxCep = "" ;
                String auxCity = "" ;
                String auxDistrict = "" ;
                String auxState = "" ;
                String auxNumber = "" ;
                String auxComplement = "" ;
                String auxName = "" ;
                String auxRG = "" ;
                String auxCPF = "" ;
                String auxEmail = "";
                String auxPhone = "";
            try {
                String msg1 = ""; //DECLARANDO AS VARIÁVEIS
                String msg2 = "";
                String msg3 = "";
                String name = request.getParameter("name"); //PEGANDO OS PARAMÊTROS
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
                if ((name != null && cpf != null && rg != null && email != null && phone != null && street != null && number != null && cep != null && city != null &&  district != null &&  state != null) || (name != "" && cpf != "" && rg != "" && email != "" && phone != "" && street != "" && number != "" && cep != "" && city != "" &&  district != "" &&  state != "")) { //CHECKANDO OS PARAMÊTROS
                    if (request.getParameter("include") != null) { //CHECKANDO A AÇÃO INCLUDE
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
                        if (msg1 == "" && msg2 == "" && msg3 == "") { //TUDO CERTO, ADICIONANDO NO "BANCO"...
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
                            %> <label>Cadastro efetuado com sucesso !!</label><%
                        }
                        if (msg1 != "" && msg2 == "" && msg3 == "") { //ERRO !!!, CPF JÁ CADASTRADO"... %> 
                        <div><label><%=msg1%></label></div>
                        <%} else if (msg1 == "" && msg2 != "" && msg3 == "") { //ERRO !!!, RG JÁ CADASTRADO"...%>
                        <div><label><%=msg2%></label></div>
                        <%} else if (msg1 != "" && msg2 != "" && msg3 == "") { //ERRO !!!, RG E CPF JÁ CADASTRADO"...%>
                        <div><label>RG e CPF já existente no banco !!</label></div>
                        <%} else if (msg3 != "") { //ERRO !!!, CLIENTE JÁ CADASTRADO"...%>
                        <div><label><%=msg3%></label></div>
                        <%}
                    }
                                 else if (request.getParameter("remove") != null) { //REMOVENDO CLIENTE...
                                    int i = Integer.parseInt(request.getParameter("i"));
                                    BancoClientes.getClientes().remove(i);
                                    %>
                                    <div><label>Cliente removido com sucesso !</label></div>
                                    <%
                                } else if(request.getParameter("search")!=null){
        
                                    try {
                                       br.com.correios.bsb.sigep.master.bean.cliente.AtendeClienteService service = new br.com.correios.bsb.sigep.master.bean.cliente.AtendeClienteService();
                                   br.com.correios.bsb.sigep.master.bean.cliente.AtendeCliente port = service.getAtendeClientePort();

                               // TODO process result here
                                   br.com.correios.bsb.sigep.master.bean.cliente.EnderecoERP result = port.consultaCEP(cep);

                                       if(result.getEnd()!=null){
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
                                       auxNumber = result.getComplemento();
                                       auxComplement = result.getComplemento2();

                                   } else {%>

                                   <%}

                           }   catch (Exception ex) {
                               // TODO handle custom exceptions here
                           }}
                } else {
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
        <form>
            <label>Nome:</label><br/>
            <input type="text" name="name" value="<%=auxName%>"/><br/><br/>
            <label>CPF:</label><br/>
            <input type="number" name="cpf"  value="<%=auxCPF%>"/><br/><br/>
            <label>RG:</label><br/>
            <input type="text" name="rg" value="<%=auxRG%>"/><br/><br/>
            <label>Email:</label><br/>
            <input type="text" name="email" value="<%=auxEmail%>"/><br/><br/>
            <label>Telefone:</label><br/>
            <input type="text" name="phone" value="<%=auxPhone%>" /><br/><br/>
            <label>CEP:</label><br/>
            <input type="text" name="cep" value="<%=auxCep%>"/><br/>
            <input type="submit" id="search" name="search" value="search"/><br/><br/>
            <label>Estado:</label><br/>
            <input type="text" name="state" value="<%=auxState%>" /><br/><br/>
            <label>Cidade:</label><br/>
            <input type="text" name="city" value="<%=auxCity%>" /><br/><br/>
            <label>Bairro:</label><br/>
            <input type="text" name="district" value="<%=auxDistrict%>"/><br/><br/>
            <label>Rua:</label><br/>
            <input type="text" name="street" value="<%=auxStreet%>" /><br/><br/>
            <label>Número:</label><br/>
            <input type="text" name="number" value="<%=auxNumber%>" /><br/><br/>
            <label>Complemento:</label><br/>
            <input type="text" name="complement" value="<%=auxComplement%>"/><br/><br/>
            
            <input type="submit" name="include" value="Adicionar"/>
        </form><br/>
        <h2>Lista</h2>
        <table border="1">
            <tr>
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
                <th>Ação</th>
            </tr>
            <%
                for (int i = 0; i < BancoClientes.getClientes().size(); i++) {
                    Cliente c = BancoClientes.getClientes().get(i);
            %>
            <tr>
                <td><%=i+1%></td>
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
                    <form>
                        <input type="hidden" name="i" value="<%=i%>"/>
                        <input type="submit" name="remove" value="Excluir"/>  
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>

        <!-- Page Content End -->


        <!-- Include Footer -->
        <%@include file="WEB-INF/jspf/includeFooter.jspf" %>
        <!-- Include Footer End -->

        <!-- Include Javascript Links -->
        <%@include file="WEB-INF/jspf/includeJs.jspf" %>
        <!-- Include Javascript Links End -->
    </body>
</html>
