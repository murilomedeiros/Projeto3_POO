/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.poo;

import java.util.ArrayList;

/**
 *
 * @author muril
 */
public class BancoClientes {
    private static ArrayList<Clientes> clientes;
    public static ArrayList<Clientes> getClientes() {
        if (clientes == null) {
            clientes = new ArrayList<>();
        }
        return clientes;
    }
    
}
