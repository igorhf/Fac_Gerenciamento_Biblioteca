package utilitarios;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ig0r
 */
public class usuario {

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    private String nome;
    private String cpf;
    
    public void usuario(String nome, String cpf){
    this.nome=nome;
    this.cpf=cpf;
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        resp.sendRedirect("nome");
    }
}
