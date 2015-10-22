/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import partes.*;
import todo.Computador;

/**
 *
 * @author UTFPR
 */
public class App {
    public static void main(String[] args) {
        Computador computador = new Computador("Lg");
        computador.setA(new AutoFalante());
        computador.setM(new Monitor());
        computador.setP(new Processador());
        computador.ligarA();
        computador.ligarM();
        computador.ligarP();
        computador.funcionarA();
        computador.funcionarM();
        computador.funcionarP();
        computador.desligarA();
        computador.desligarM();
        computador.desligarP();
        
    }
}
