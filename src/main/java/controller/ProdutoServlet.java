package controller;

import model.Produto;
import model.ProdutoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cadastrarProduto")
public class ProdutoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = ProdutoDAO.listarProdutos().size() + 1;
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");
            double preco = Double.parseDouble(request.getParameter("preco"));
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            String imagem = request.getParameter("imagem");

            Produto produto = new Produto(id, nome, descricao, preco, quantidade, imagem);
            ProdutoDAO.adicionarProduto(produto);
            response.sendRedirect("index.jsp");
        } catch (NumberFormatException e) {
            response.sendRedirect("index.jsp?erro=parametros_invalidos");
        }
    }
}