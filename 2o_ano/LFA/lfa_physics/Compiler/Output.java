public class Output{
    public static void main(String[] args){
        Value alturaInicial = new Value();
        Value alturaFinal = new DoubleVar("0.0");
        Value tempoInicial = new DoubleVar("0.0");
        Value tempoFinal = new DoubleVar("5.0");
        Value velInicial = new DoubleVar("0.0");
        Value velInst = new Value();
        Value gravity = new DoubleVar("9.8");
        for(double i = tempoInicial.getValueDouble();i < tempoFinal.getValueDouble();i++){
            velInst.setValueDouble(new Double(gravity.getValueDouble() * i));
            System.out.println("A velocidade instantanea no segundo "+i+" e de "+velInst);

        };
        alturaInicial.setValueDouble(new Double(gravity.getValueDouble() * tempoFinal.getValueDouble() * tempoFinal.getValueDouble() / 2));
        System.out.println("A altura a que a pedra foi lancada foi de "+alturaInicial);
    }
}