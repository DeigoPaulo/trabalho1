package controller;

import model.Carrinho;
import model.Pedido;
import model.Produto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/finalizarPedido")
public class PedidoServlet extends HttpServlet {
    private static int pedidoIdCounter = 1;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");

        if (carrinho != null && !carrinho.getItens().isEmpty()) {
            // Cria um novo pedido com os itens do carrinho
            Pedido pedido = new Pedido(pedidoIdCounter++, new ArrayList<>(carrinho.getItens()), carrinho.calcularTotal());
            session.setAttribute("pedido", pedido);
            session.removeAttribute("carrinho"); // Limpa o carrinho após finalizar
            response.sendRedirect("pedido.jsp");
        } else {
            response.sendRedirect("carrinho.jsp?erro=carrinho_vazio");
        }
    }
}