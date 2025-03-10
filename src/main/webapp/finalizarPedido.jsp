<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Carrinho, model.Produto, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Confirmação do Pedido</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Confirmação do Pedido</h2>
    <table>
        <tr>
            <th>Nome</th>
            <th>Quantidade</th>
            <th>Preço Unitário</th>
            <th>Total</th>
        </tr>
        <%
            Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
            if (carrinho != null && !carrinho.getItens().isEmpty()) {
                List<Produto> itens = carrinho.getItens();
                double totalPedido = 0;
                for (Produto produto : itens) {
                    double totalItem = produto.getPreco() * produto.getQuantidade();
                    totalPedido += totalItem;
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
            <td><strong>R$ <%= String.format("%.2f", totalPedido) %></strong></td>
        </tr>
        <%
            } else {
        %>
        <tr>
            <td colspan="4">Nenhum produto no carrinho.</td>
        </tr>
        <%
            }
        %>
    </table>

    <a href="index.jsp" class="btn btn-primary">Continuar Comprando</a>
    <form action="finalizarPedido" method="post">
        <button type="submit" class="btn btn-primary">Finalizar Pedido</button>

    </form>

</body>
</html>