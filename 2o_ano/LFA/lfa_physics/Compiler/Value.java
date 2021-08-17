public class Value {
    public IntegerVar valueInt;
    public DoubleVar valueDouble;
    
    public Value(IntegerVar integer){
        this.valueInt = integer;
    }
    public Value(DoubleVar doublevar){
        this.valueDouble = doublevar;
    }
    public Value(){}
    public int getValueInt(){
        return valueInt.getValue();
    }
    public double getValueDouble(){
        return valueDouble.getValue();
    }
    public void setValueDouble(Double value){
        if(valueDouble == null){
            valueDouble = new DoubleVar(value);
        }else{
            valueDouble.setValue(value);
        }
    }
    public void setValueInt(int value){
        valueInt.setValue(value);
    }

    @Override
    public String toString() {
        if(valueDouble == null){ return valueInt.toString();}
        if(valueInt == null){ return valueDouble.toString();}
        else{ return "";}
    }
}