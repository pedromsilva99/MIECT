public class IntegerVar extends Value {
    int value;
    
    public IntegerVar(String value){
        super.valueInt = this;
        this.value = Integer.parseInt(value);
    }
    public IntegerVar(){}

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "" + value;
    }
}