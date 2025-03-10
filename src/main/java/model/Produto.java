package model;

public class Produto {
    private int id;
    private String nome;
    private String descricao;
    private double preco;
    private int quantidade;
    private String imagem;

    public Produto(int id, String nome, String descricao, double preco, int quantidade, String imagem) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco >= 0 ? preco : 0; // Validação simples
        this.quantidade = quantidade >= 0 ? quantidade : 0;
        this.imagem = imagem;
    }

    public int getId() { return id; }
    public String getNome() { return nome; }
    public String getDescricao() { return descricao; }
    public double getPreco() { return preco; }
    public int getQuantidade() { return quantidade; }
    public String getImagem() { return imagem; }

    public void setQuantidade(int quantidade) { this.quantidade = quantidade >= 0 ? quantidade : 0; }
    public void setPreco(double preco) { this.preco = preco >= 0 ? preco : 0; }
}