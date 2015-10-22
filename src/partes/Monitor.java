/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package partes;

/**
 *
 * @author UTFPR
 */
public class Monitor implements Partes{

    @Override
    public void ligar() {
        System.out.println("O monitor esta ligado...");
    }

    @Override
    public void desligar() {
        System.out.println("O monitor esta desligado...");
    }

    @Override
    public void funcionar() {
        System.out.println("O monitor esta exibindo as imagens...");
    }
    
}
