package br.com.fatecpg.poo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Renan
 */

public class BancoFornecedores {
    private static ArrayList<Fornecedores> fornecedores;
    public static ArrayList<Fornecedores> getFornecedores(){
        if(fornecedores == null){
            fornecedores = new ArrayList<>();
        }
        return fornecedores;
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
