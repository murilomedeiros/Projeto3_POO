package br.com.fatecpg.poo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Renan
 */

public class BancoFornecedor {
    private static ArrayList<Fornecedor> fornecedor;
    public static ArrayList<Fornecedor> getFornecedor(){
        if(fornecedor == null){
            fornecedor = new ArrayList<>();
        }
        return fornecedor;
    }
}

//public class BancoFornecedores {
//    private static Map<String,String> fornecedores;
//    public static Map<String,String> getfornecedores(){
//        if(fornecedores == null){
//            fornecedores = new HashMap<>();
//        }
//        return fornecedores;
//    }
//    
//}
