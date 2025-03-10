package model;

import java.util.Date;
import java.util.List;

public class Pedido {
    private int id;
    private List<Produto> produtos;
    private double total;
    private Date data;

    public Pedido(int id, List<Produto> produtos, double total) {
        this.id = id;
        this.produtos = produtos;
        this.total = total;
        this.data = new Date(); // Data atual
    }

    public int getId() {
        return id;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public double getTotal() {
        return total;
    }

    public Date getData() {
        return data;
    }
}