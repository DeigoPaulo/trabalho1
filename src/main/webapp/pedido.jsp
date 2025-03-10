<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Pedido, model.Produto, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Confirmação do Pedido</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <header>
        <h1>Loja Virtual</h1>
        <nav>
            <a href="index.jsp" class="nav-link">Home</a>
            <a href="carrinho.jsp" class="nav-link">Carrinho</a>
        </nav>
    </header>
    <div class="container">
        <h2>Confirmação do Pedido</h2>
        <%
            Pedido pedido = (Pedido) session.getAttribute("pedido");
            if (pedido != null) {
        %>
        <p class="pedido-info">Pedido #<%= pedido.getId() %> realizado em <%= pedido.getData() %></p>
        <table>
            <tr>
                <th>Nome</th>
                <th>Quantidade</th>
                <th>Preço Unitário</th>
                <th>Total</th>
            </tr>
            <%
                List<Produto> produtos = pedido.getProdutos();
                for (Produto produto : produtos) {
                    double totalItem = produto.getPreco() * produto.getQuantidade();
            %>
            <tr>
                <td><%= produto.getNome() %></td>
                <td><%= produto.getQuantidade() %></td>
                <td>R$ <%= String.format("%.2f", produto.getPreco()) %></td>
                <td>R$ <%= String.format("%.2f", totalItem) %></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="3"><strong>Total do Pedido:</strong></td>
                <td><strong>R$ <%= String.format("%.2f", pedido.getTotal()) %></strong></td>
            </tr>
        </table>
        <div class="button-group">
            <a href="index.jsp" class="btn btn-primary">Voltar à Loja</a>
        </div>
        <%
            } else {
        %>
        <p class="no-pedido">Nenhum pedido encontrado.</p>
        <div class="button-group">
            <a href="index.jsp" class="btn btn-primary">Voltar à Loja</a>
        </div>
        <%
            }
        %>
    </div>
    <footer>
        <p>© 2025 Loja Virtual. Todos os direitos reservados.</p>
    </footer>
</body>
</html>