
import java.util.Scanner;


public class Main {
    public static void main(String[] args) {
       String nome, cnpj, regiao;
       
       Scanner entrada = new Scanner(System.in);
        //obsrvado
        ListaRestaurante lista = new ListaRestaurante();
        
        //observador
        Listagem l = new Listagem();
        lista.addObserver(l);
        
        while (true) {
            System.out.println("CADASTRAR NOVO RESTAURANTE");
            System.out.println("DIGITE O NOME DO RESTAURANTE");
            nome = entrada.next();
            System.out.println("DIGITE O CNPJ:");
            cnpj=entrada.next();
            System.out.println("DIGITE A REGIÃO:");
            regiao = entrada.next();
            lista.addRestaurante(new Restaurante(nome, cnpj, regiao));
        }
        
        
        
        
        
        
    }
}
