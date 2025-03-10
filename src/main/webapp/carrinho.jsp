<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Produto, model.Carrinho, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Seu Carrinho</title>
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
        <h2>Seu Carrinho</h2>
        <table>
            <tr>
                <th>Produto</th>
                <th>Quantidade</th>
                <th>Preço</th>
                <th>Total</th>
                <th>Ação</th>
            </tr>
            <%
                Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
                if (carrinho != null && !carrinho.getItens().isEmpty()) {
                    List<Produto> itens = carrinho.getItens();
                    for (Produto p : itens) {
            %>
            <tr>
                <td><%= p.getNome() %></td>
                <td><%= p.getQuantidade() %></td>
                <td>R$ <%= String.format("%.2f", p.getPreco()) %></td>
                <td>R$ <%= String.format("%.2f", p.getPreco() * p.getQuantidade()) %></td>
                <td>
                    <form action="carrinho" method="post" style="display:inline;">
                        <input type="hidden" name="acao" value="remover">
                        <input type="hidden" name="id" value="<%= p.getId() %>">
                        <button type="submit" class="btn btn-danger">Remover</button>
                    </form>
                </td>
            </tr>
            <%
                    }
            %>
            <tr>
                <td colspan="3"><strong>Total:</strong></td>
                <td colspan="2"><strong>R$ <%= String.format("%.2f", carrinho.calcularTotal()) %></strong></td>
            </tr>
            <%
                } else {
            %>
            <tr>
                <td colspan="5">Seu carrinho está vazio.</td>
            </tr>
            <%
                }
            %>
        </table>
        <br>
        <a href="index.jsp" class="btn btn-primary">Continuar Comprando</a>
        <a href="finalizarPedido.jsp" class="btn btn-primary">Finalizar Pedido</a>
    </div>
    <footer>
        <p>&copy; 2025 Loja Virtual. Todos os direitos reservados.</p>
    </footer>
</body>
</html>