import java.io.Serializable;

public class Dimension extends Types implements Serializable {
    private String name;
    private Unit unidade;
    private Dimension[] subDims;
    private Unit[] subUnits;
    private String dims;
    private Value value;

    public Dimension(String name, Unit unidade) {           // metro = real
        this.name = name;
        this.unidade = unidade;
        this.subDims = null;
        this.subUnits = null;
        this.dims = null;
    }

    public Dimension(String name, Dimension[] subDims, String dims) {     // vel = m/s (Dimensao a partir de outras dimensoes)
        this.name = name;
        this.unidade = null;
        this.dims = dims;
        this.subDims = new Dimension[subDims.length];
        this.subUnits = new Unit[subDims.length];
        for(int i = 0; i < subDims.length; i++){
            this.subDims[i] = subDims[i];
            this.subUnits[i] = subDims[i].getUnidade();
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Unit getUnidade() {
        return unidade;
    }

    public void setUnidade(Unit unidade) {
        this.unidade = unidade;
    }

    public Dimension[] getSubDims() {
        return subDims;
    }

    public void setSubDims(Dimension[] subDims) {
        this.subDims = subDims;
    }

    public Unit[] getSubUnits() {
        return subUnits;
    }

    public void setSubUnits(Unit[] subUnits) {
        this.subUnits = subUnits;
    }

    public String getDims() {
        return this.dims;
    }

    public void setDims(String value) {
        this.dims = value;
    }

    public String printSubUnits() {
        String units = "";
        for (Unit u : getSubUnits()) {
            units += u.toString();
        }
        return units;
    }

    public @Override String toString()
    {
        if (getUnidade() == null) return "Nome da dimensao: " + this.getName() + "\nUnidades: " + getDims() + "\n" + printSubUnits();
        return "Nome da dimensao: " + this.getName() + "\n" + this.getUnidade();
    }
    
    public Value getValue() {
        return value;
    }

    public void setValue(Value value) {
        this.value = value;
    }

}
