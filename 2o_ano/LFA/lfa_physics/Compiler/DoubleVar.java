public class DoubleVar extends Value {
    double value;

    public DoubleVar(String value){
        super.valueDouble = this;
        this.value = Double.parseDouble(value);
    }
    public DoubleVar(Double value){
        super.valueDouble = this;
        this.value = value;
    }
    public DoubleVar(){}

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "" + value;
    }
}