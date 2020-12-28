
public interface Subject {
    public void addObserver( Observer observer ); //função para adicionar um observador
    public void notifyObservers(); //função para notificar o observador que houve alteração no estado do objeto
}
