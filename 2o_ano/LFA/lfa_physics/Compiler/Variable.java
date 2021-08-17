public class Variable {
    Value value;

    Variable(Value value){
        this.value = value;
    }

    Variable(){
        this.value = null;
    }

    public Value getValue() {
        return value;
    }

    public void setValue(Value value) {
        this.value = value;
    }
}