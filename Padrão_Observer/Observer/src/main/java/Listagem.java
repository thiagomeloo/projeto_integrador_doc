
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author victo
 */
public class Listagem implements Observer{
  
    @Override
    public void update(ArrayList<Restaurante> res) { //função que responde a notificação
        System.out.println("Lista Atualizada");
        System.out.println("==== LISTAGEM DE RESTAURANTES =====");
        for (Restaurante r: res) {
            System.out.println("| RESTAURANTE: "+r.getNome()+"|");
            System.out.println("| CNPJ: " + r.getCnpj() + " REGIÃO: "+r.getRegiao()+"            |");
        }
        System.out.println("====================================");
    }

   
   
    
    
}
