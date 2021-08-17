import java.io.Serializable;

public class Unit extends Types  implements Serializable {
    private String name;
    private double scale;
    private Dimension dimension;
    private String tipo;

    public Unit(String name, double scale, Dimension dimension){
        this.name = name;
        this.scale = scale;
        this.dimension = dimension;
        this.tipo = null;
    }

    public Unit(String name, String tipo){
        this.name = name;
        this.tipo = tipo;
        this.scale = 1;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getScale() {
        return scale;
    }

    public void setScale(double scale) {
        this.scale = scale;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Dimension getDimension() {
        return dimension;
    }

    public void setDimension(Dimension dimension) {
        this.dimension = dimension;
    }

    public @Override String toString()
    {
        if (tipo == null)
            return "Unidade: " + this.getName() + "\nEscala: " + this.getScale() + "\n" + this.getDimension();
        else
            return "Unidade: " + this.getName() + "\nTipo: " + this.getTipo() + "\n";
    }
}
