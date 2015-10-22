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
public class AutoFalante implements Partes{

    @Override
    public void ligar() {
        System.out.println("Os auto falantes estao ligados...");
    }

    @Override
    public void desligar() {
        System.out.println("Os auto falantes estao desligados...");
    }

    @Override
    public void funcionar() {
        System.out.println("Os auto falantes estao tocando a musica...");
    }
    
}
