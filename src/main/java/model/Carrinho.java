package model;

import java.util.ArrayList;
import java.util.List;

public class Carrinho {
    private List<Produto> itens;

    public Carrinho() {
        this.itens = new ArrayList<>();
    }

    public void adicionarProduto(Produto produto) {
        this.itens.add(produto);
    }

    public void removerProdutoPorId(int id) {
        this.itens.removeIf(produto -> produto.getId() == id);
    }

    public List<Produto> getItens() {
        return itens;
    }

    public double calcularTotal() {
        return itens.stream().mapToDouble(Produto::getPreco).sum();
    }
}