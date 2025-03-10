<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Produto, model.ProdutoDAO, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Loja Online</title>
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
        <h2>Nossos Produtos</h2>
        <div class="produtos">
            <%
                List<Produto> produtos = ProdutoDAO.listarProdutos();
                if (produtos != null && !produtos.isEmpty()) {
                    for (Produto p : produtos) {
            %>
            <div class="produto">
                <img src="<%= p.getImagem() %>" alt="<%= p.getNome() %>" class="produto-img">
                <h3><%= p.getNome() %></h3>
                <p><%= p.getDescricao() %></p>
                <p><strong>R$ <%= String.format("%.2f", p.getPreco()) %></strong></p>
                
                <form action="carrinho" method="post">
                    <input type="hidden" name="acao" value="adicionar">
                    <input type="hidden" name="id" value="<%= p.getId() %>">
                    <input type="hidden" name="nome" value="<%= p.getNome() %>">
                    <input type="hidden" name="preco" value="<%= p.getPreco() %>">
                    <button type="submit" class="btn btn-primary">Adicionar ao Carrinho</button>
                </form>
            </div>
            <%
                    }
                } else {
            %>
            <p>Nenhum produto disponível no momento.</p>
            <%
                }
            %>
        </div>
    </div>
    <footer>
        <p>&copy; 2025 Loja Virtual. Todos os direitos reservados.</p>
    </footer>
</body>
</html>