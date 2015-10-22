/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package todo;

import partes.Partes;

/**
 *
 * @author UTFPR
 */
public class Computador {

    private String marca;
    private Partes a,m,p;

    public Computador(String marca) {
        this.marca = marca;
    }

    public void setA(Partes a) {
        this.a = a;
    }

    public void setM(Partes m) {
        this.m = m;
    }

    public void setP(Partes p) {
        this.p = p;
    }
    
    public void ligarA(){
        a.ligar();
    }
    
    public void ligarM(){
        m.ligar();
    }
    
    public void ligarP(){
        p.ligar();
    }
    
    public void desligarA(){
        a.desligar();
    }
    
    public void desligarM(){
        m.desligar();
    }
    
    public void desligarP(){
        p.desligar();
    }
    
    public void funcionarA(){
        a.funcionar();
    }
    
    public void funcionarM(){
        m.funcionar();
    }
    
    public void funcionarP(){
        p.funcionar();
    }

}
