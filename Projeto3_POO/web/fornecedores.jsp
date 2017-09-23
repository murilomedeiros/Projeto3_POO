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
    <h1>Fornecedor</h1>
        <%try{
            if(request.getParameter("add")!=null){
                String nome = request.getParameter("nome");
                String razaoSocial = request.getParameter("razaoSocial");
                String cnpj = request.getParameter("cnpj");
                String email = request.getParameter("email");
                String telefone = request.getParameter("telefone");
                String endereco = request.getParameter("endereco");
                Fornecedor c = new Fornecedor();
                c.setNome(nome);
                c.setRazaoSocial(razaoSocial);
                c.setCnpj(cnpj);
                c.setEmail(email);
                c.setTelefone(telefone);
                c.setEndereco(endereco);
                BancoFornecedor.getFornecedor().add(c);
            } else if(request.getParameter("remove")!=null){
                int i = Integer.parseInt(request.getParameter("i"));
                BancoFornecedor.getFornecedor().remove(i);
            }
        
        }catch(Exception ex){%>
                <h2>Deu Ruim</h2>
        <%}%>
        
            
        <form border="1">
        <fieldset>
            <legend>Novo contato</legend>
            
                Nome:<br/>
                <input type="text" name="nome" placeholder="Nome" required/><br/>
                Razão social:<br/>
                <input type="text" name="razaoSocial" placeholder="Razão Social" required/><br/>
                CNPJ:<br/>
                <input type="text" id="cnpj" name="cnpj" placeholder="00.000.000/0000-00" required/><br/>
                Email:<br/>
                <input type="text" name="email" placeholder="Email" required/><br/>
                Telefone:<br/>
                <input type="text" name="telefone" placeholder="Telefone" required/><br/>
                Endereço:<br/>
                <input type="text" name="endereco" placeholder="Endereço" required/><br/>
                <br/>
                <input type="submit" name="add" value="Adicionar"/>
            
        </fieldset>
            </form>
            
            
        <h2>Lista</h2>
        <table >
            <tr>
                <th>Indice</th>
                <th>Nome</th>
                <th>Razão Social</th>
                <th>CNPJ</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>Exclusão</th>
            </tr>
            <%for (int i=0; i<BancoFornecedor.getFornecedor().size();i++){
                Fornecedor c = BancoFornecedor.getFornecedor().get(i);%>
                <tr>
                    <td><%=i%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getRazaoSocial()%></td>
                    <td><%=c.getCnpj()%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getEmail()%></td>
                    <td><%=c.getTelefone()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="i" value="<%=i%>"/>
                            <input type="submit" name="remove" value="Excluir"/>
                        </form>
                    </td>
                </tr>
            <%}%>
            
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
