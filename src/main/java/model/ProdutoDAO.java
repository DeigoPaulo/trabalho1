package model;

import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO {
    private static List<Produto> produtos = new ArrayList<>();

    static {
        produtos.add(new Produto(1, "Camiseta Básica", "Camiseta de algodão, tamanho M", 29.90, 1, "https://placehold.co/200x200?text=Camiseta"));
        produtos.add(new Produto(2, "Tênis Esportivo", "Tênis confortável para corrida", 99.90, 1, "https://placehold.co/200x200?text=Tenis"));
        produtos.add(new Produto(3, "Mochila Escolar", "Mochila resistente, 20L", 59.90, 1, "https://placehold.co/200x200?text=Mochila"));
        produtos.add(new Produto(4, "Fone de Ouvido", "Fone sem fio com boa qualidade", 79.90, 1, "https://placehold.co/200x200?text=Fone"));
    }

    public static void adicionarProduto(Produto produto) {
        produtos.add(produto);
    }

    public static List<Produto> listarProdutos() {
        return produtos;
    }

    public static Produto buscarPorId(int id) {
        return produtos.stream().filter(p -> p.getId() == id).findFirst().orElse(null);
    }
}