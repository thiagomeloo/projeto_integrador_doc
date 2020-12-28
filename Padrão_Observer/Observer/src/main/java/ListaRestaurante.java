
import java.util.ArrayList;


public class ListaRestaurante implements Subject{
    public ArrayList<Restaurante> restaurante = new ArrayList<>(); 
    
    public ArrayList<Observer> observadores = new ArrayList<>();
    
    public void addRestaurante(Restaurante r){ //adiciona um novo restaurante a lista
        this.restaurante.add(r);
        notifyObservers();
    }

    @Override
    public void addObserver(Observer observer) { //adiciona um novo observador
        if(!observadores.contains(observer)){
            observadores.add(observer);
        }
    }

    @Override
    public void notifyObservers() { //notifica os observadores que houve alteração no estado do objeto
        for (Observer o : observadores) {
            o.update(restaurante);
        }
    }
}
