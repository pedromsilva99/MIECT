import java.io.Serializable;

public class Constant extends Types implements Serializable {
    private int valueInt;
    private double valueReal;
    private String name;
    private String tipo;
    private String dims;
    private Dimension[] arrayDims;
    private Value value;

    public Constant(String name, double value, String dims, Dimension[] arrayDims) {
        this.name = name;
        this.dims = dims;
        this.valueReal = value;
        this.tipo = null;
        this.arrayDims = new Dimension[arrayDims.length];
        for(int i = 0; i < arrayDims.length; i++) {
            this.arrayDims[i] = arrayDims[i];
        }
    }

    public Constant(String name, double value, String tipo) {
        this.name = name;
        this.valueReal = value;
        this.valueInt = 0;
        this.tipo = tipo;
        this.dims = null;
        this.arrayDims = null;
    }

    public Constant(String name, int value, String tipo) {
        this.name = name;
        this.valueInt = value;
        this.valueReal = 0;
        this.tipo = tipo;
        this.dims = null;
        this.arrayDims = null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getValueReal() {
        return valueReal;
    }

    public void setValueReal(double value) {
        this.valueReal = value;
    }

    public int getValueInt() {
        return valueInt;
    }

    public void setValueInt(int value) {
        this.valueInt = value;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Dimension[] getArrayDims() {
        return arrayDims;
    }

    public void setArrayDims(Dimension[] arrayDims) {
        this.arrayDims = arrayDims;
    }

    public String getDims() {
        return dims;
    }

    public void setDims(String dims) {
        this.dims = dims;
    }

    public @Override String toString()
    {   if (tipo != null) {
            if (valueReal != 0)
                return "Nome da constante: " + this.getName() + "\nValor: " + this.getValueReal() + "\nTipo: " + this.getTipo();
            else
                return "Nome da constante: " + this.getName() + "\nValor: " + this.getValueInt() + "\nTipo: " + this.getTipo();
        }
        else
            return "Nome da constante: " + this.getName() + "\nValor: " + this.getValueReal() + "\nDims: " + this.getDims();
    }

    public Value getValue() {
        return value;
    }

    public void setValue(Value value) {
        this.value = value;
    }
}
