package controller;

import model.Produto;
import model.Carrinho;
import model.ProdutoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/carrinho")
public class CarrinhoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("carrinho.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");

        if (carrinho == null) {
            carrinho = new Carrinho();
            session.setAttribute("carrinho", carrinho);
        }

        String acao = request.getParameter("acao");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Produto produto = ProdutoDAO.buscarPorId(id);

            if (produto != null) {
                if ("adicionar".equals(acao)) {
                    carrinho.adicionarProduto(produto);
                } else if ("remover".equals(acao)) {
                    carrinho.removerProdutoPorId(id);
                }
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("carrinho.jsp?erro=parametros_invalidos");
            return;
        }

        response.sendRedirect("carrinho.jsp");
    }
}