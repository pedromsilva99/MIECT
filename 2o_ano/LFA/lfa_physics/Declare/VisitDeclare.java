import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.io.*;

public class VisitDeclare extends DeclareBaseVisitor<Object> {

    ArrayList<Types> vars = new ArrayList<>();
    HashMap<String, Dimension> hmDim = new HashMap<String, Dimension>();
    HashMap<String, Unit> hmUnit = new HashMap<String, Unit>();
    HashMap<String, Constant> hmConst = new HashMap<String, Constant>();

   @Override public Object visitProgram(DeclareParser.ProgramContext ctx) {
       return visitChildren(ctx);
   }

   @Override public Object visitDimFromUnit(DeclareParser.DimFromUnitContext ctx) {
       String nomeDim = ctx.WORD(0).getText();              // Nome da dimensão (Ex: metro)
       String unidadeDim = ctx.WORD(1).getText();           // Unidade da dimensão (Ex: m)

       // Verifica se a dimensão já foi criada (não pode haver nenhuma com o mesmo nome nem com a mesma unidade)
       if (nameExists(nomeDim) || unitExists(unidadeDim)) return null;

       
       String tipoDim = ctx.getChild(6).getText();    // Tipo da dimensão (integer ou real)

       Unit unitOfDim = new Unit(unidadeDim, tipoDim);      // Criar a unidade
       Dimension dim = new Dimension(nomeDim, unitOfDim);   // Criar a dimensão

        //escrever no ficheiro
        vars.add(unitOfDim);
        vars.add(dim);
        writeObjToFile();
       
       hmDim.put(nomeDim, dim);
       return dim;
   }

   @Override public Object visitDimFromDim(DeclareParser.DimFromDimContext ctx) {
       String nomeDim = ctx.WORD().getText();
       String dims = visit(ctx.oper()).toString();

       if (nameExists(nomeDim)) return null;                // Verificar se já existe alguma variável com esse nome

       Dimension [] insertDims = arrayOfDims(removeParent(dims));
       if (insertDims == null) return null;

       Dimension dim = new Dimension(nomeDim, insertDims, nameToUnit(dims));
       vars.add(dim);
       writeObjToFile();
       hmDim.put(nomeDim, dim);

       return dim;
   }

   @Override public Object visitUnitCreate(DeclareParser.UnitCreateContext ctx) {

       String nomeUnit = ctx.WORD().getText();                  // Nome da unidade
       String unitScale = visit(ctx.oper()).toString();         // Escala comparativamente à dimensão (Ex: cm = 1/100 em relaçao ao m)
       if (nameExists(nomeUnit)) return null;                   // Verificar se já existe alguma variável com esse nome
       unitScale = removeParent(unitScale);
       Object[] dimScale = getScaleDim(unitScale);          // Retorna a escala e a dimensao em relaçao a essa escala
       if (dimScale == null) return null;
       double scale = Double.parseDouble(dimScale[0].toString());
       Dimension dim = (Dimension) dimScale[1];

       Unit retUnit = new Unit(nomeUnit, scale, dim);        // Criar a unidade
       vars.add(retUnit);
       writeObjToFile();
       hmUnit.put(nomeUnit, retUnit);

       return retUnit;
   }

   @Override public Object visitConstFromNumb(DeclareParser.ConstFromNumbContext ctx) {
       String nomeConst = ctx.WORD().getText();                     // Nome da constante
       if (nameExists(nomeConst)) return null;                      // Verificar se já existe alguma variável com esse nome
       String line [] = ctx.getText().split("as");
       String tipo = line[2].trim().replace(";", "");               // Valor da constante (integer ou real)
       Constant retConst = null;

       if (tipo.equals("integer")) {
           try {
               int valueInt = Integer.parseInt(ctx.NUM().getText());            // Valor da constante
               retConst = new Constant(nomeConst, valueInt, tipo);              // Constante inteira
           } catch (Exception e) {
               System.err.println("Erro, o número não é um inteiro");
               return null;
           }
       } else if (tipo.equals("real")) {
           try {
               double valueReal = Double.parseDouble(ctx.NUM().getText());      // Valor da constante
               retConst = new Constant(nomeConst, valueReal, tipo);             // Constante real
           } catch (Exception e) {
               System.err.println("Erro, não é um número real");
               return null;
           }
       }
       hmConst.put(nomeConst, retConst);
       vars.add(retConst);
       writeObjToFile();
       return retConst;
   }



   @Override public Object visitConstFromOper(DeclareParser.ConstFromOperContext ctx) {
       String nomeConst = ctx.WORD().getText();                     // Nome da constante
       if (nameExists(nomeConst)) return null;                      // Verificar se já existe alguma variável com esse nome
       double value = Double.parseDouble(ctx.NUM().getText());         // Valor da constante

       String constDims = visit(ctx.oper()).toString();
       Dimension [] arrayDim;
       arrayDim = arrayOfDims(removeParent(constDims));
       if (arrayDim == null) return null;

       Constant retConst = new Constant(nomeConst, value, constDims, arrayDim);
       hmConst.put(nomeConst, retConst);
       vars.add(retConst);
       writeObjToFile();
       return retConst;
   }

   @Override public Object visitOperAritm(DeclareParser.OperAritmContext ctx) {
       String res = null;
       String unitA1 = visit(ctx.a1).toString();
       String unitA2 = visit(ctx.a2).toString();

       if (unitA1 != null && unitA2 != null) {
           switch(ctx.op.getText()) {
               case "*":
                   res = unitA1 + "*" + unitA2;
                   break;
               case "/":
                   res = unitA1 + "/" + unitA2;
           }
       }
       return res;
   }

   @Override public Object visitOperSub(DeclareParser.OperSubContext ctx) {
       return "(" + visit(ctx.oper()) + ")";
   }

   @Override public Object visitOperBasic(DeclareParser.OperBasicContext ctx) {
       if (ctx.NUM() != null)
            return Double.parseDouble(ctx.NUM().getText());
       else if (ctx.WORD() != null)
            return ctx.WORD().getText();
       return null;
   }

    // Verifica se o nome da variável já está a ser usado
    public boolean nameExists (String nome) {
        if (hmDim.containsKey(nome)) {
            System.err.println("Já existe uma dimensão com esse nome!");
            return true;
        }
        else if (hmUnit.containsKey(nome)) {
            System.err.println("Já existe uma unidade com esse nome!");
            return true;
        }
        else if (hmConst.containsKey(nome)) {
            System.err.println("Já existe uma constante com esse nome!");
            return true;
        }
        return false;
    }

    // Verifica se a unidade existe (Ex: unit cm as m/100 -> Exige que a unidade [m] exista)
    public boolean unitExists (String unidade) {
        if (unidade != null) {
            for (Dimension d : hmDim.values()) {
                if (d.getUnidade() != null) {
                    if (unidade.equals(d.getUnidade().getName())) {
                        System.err.println("Já existe uma unidade definida assim!");
                        return true;
                    }
                }
            }
        }
        return false;
    }

    // Verifica se as unidades introduzidas já foram criadas antes
    // Ex: dim vel as m/s; -> Para funcionar é preciso antes ter criado duas dimensoes
    // dim dim_1 [m] as real; e dim dim_2 [s] as real;
    // Tambem podemos definir como: dim vel as dim_1/dim_2
    public Dimension [] arrayOfDims(String dims) {
        List<Dimension> dimensions = new ArrayList<Dimension>();
        boolean noUnit = false;
        String[] result = dims.split("[*/]");
        for (String v : result) {
            for (Dimension d : hmDim.values()) {
                if (d.getUnidade() != null) {
                    if (v.equals(d.getName())) {
                        dimensions.add(d);
                        noUnit = false;
                        break;
                    }
                    else if (v.equals(d.getUnidade().getName())) {
                        dimensions.add(d);
                        noUnit = false;
                        break;
                    }
                    noUnit = true;
                }
            }
            if (noUnit) {
                System.err.println("Dimensao '" + v + "' nao definida!");
                return null;
            }
        }
        Dimension[] insertDims = new Dimension[dimensions.size()];
        insertDims = dimensions.toArray(insertDims);
        return insertDims;
    }

    public String nameToUnit(String name) {
        String result = "";
        String units = "";
        char op;
        for (char c : name.toCharArray()) {
            if (c == '*' || c == '/') {
                op = c;
                for (Dimension d : hmDim.values()) {
                    if (d.getUnidade() != null) {
                        if (units.equals(d.getUnidade().getName())) {
                            result += d.getUnidade().getName() + "" + op;
                            units = "";
                            break;
                        }
                        else if (units.equals("(" + d.getUnidade().getName())) {
                            result += "(" + d.getUnidade().getName() + "" + op;
                            units = "";
                            break;
                        }
                        else if (units.equals(d.getUnidade().getName() + ")")) {
                            result += d.getUnidade().getName() + ")" + "" + op;
                            units = "";
                            break;
                        }
                        else if (units.equals(d.getName())) {
                            result += d.getUnidade().getName() + "" + op;
                            units = "";
                            break;
                        }
                        else if (units.equals("(" + d.getName())) {
                            result += "(" + d.getUnidade().getName() + "" + op;
                            units = "";
                            break;
                        }
                        else if (units.equals(d.getName() + ")")) {
                            result += d.getUnidade().getName() + ")" + "" + op;
                            units = "";
                            break;
                        }
                    }
                }
            }
            else {
                units += c;
            }
        }
        for (Dimension d : hmDim.values()) {
            if (d.getUnidade() != null) {
                if (units.equals(d.getUnidade().getName())) {
                    result += d.getUnidade().getName();
                    break;
                }
                else if (units.equals("(" + d.getUnidade().getName())) {
                    result += "(" + d.getUnidade().getName();
                    break;
                }
                else if (units.equals(d.getUnidade().getName() + ")")) {
                    result += d.getUnidade().getName() + ")";
                    units = "";
                    break;
                }
                else if (units.equals(d.getName())) {
                    result += d.getUnidade().getName();
                    units = "";
                    break;
                }
                else if (units.equals("(" + d.getName())) {
                    result += "(" + d.getUnidade().getName();
                    units = "";
                    break;
                }
                else if (units.equals(d.getName() + ")")) {
                    result += d.getUnidade().getName() + ")";
                    units = "";
                    break;
                }
            }
        }
        return result;
    }

    // Verifica se a string fornecida é numerica
    public boolean isNumeric(String str) {
        try {
            Double.parseDouble(str);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public String removeParent(String str) {
        String ns = str.trim().replaceAll("[()]", "");
        return ns;
    }

    public Object [] getScaleDim(String unitScale) {
        Dimension upperDim = null;
        double scale = 0;
        char op = '0';
        String units = "";
        Object[] ret = new Object[2];

        for (char c : unitScale.toCharArray()) {
            if (c == '*' || c == '/') {
                op = c;
                if (isNumeric(units)) {
                    scale = Double.parseDouble(units);
                    units = "";
                    if (op == '/') {
                        System.err.println("Unidade inválida");
                        return null;
                    }
                }
                else {
                    for (Dimension d : hmDim.values()) {
                        if (d.getUnidade() != null) {
                            if (units.equals(d.getUnidade().getName())) {
                                upperDim = d;
                                units = "";
                                break;
                            }
                        }
                    }
                    if (units != "") {
                        System.err.println("Dimensao nao definida!");
                        return null;
                    }
                }
            }
            else {
                units += c;
            }
        }
        if (isNumeric(units)) {
            scale = Double.parseDouble(units);
            if (op == '/') scale = 1 / scale;
        }
        else {
            for (Dimension d : hmDim.values()) {
                if (units.equals(d.getUnidade().getName())) {
                    upperDim = d;
                    units = "";
                    break;
                }
            }
        }
        ret[0] = scale;
        ret[1] = upperDim;
        return ret;
    }
    public void writeObjToFile(){
        //escrever os objetos num file
        try{
        FileOutputStream file;
        ObjectOutputStream objectOut;
        file = new FileOutputStream("../dimensions");
        objectOut = new ObjectOutputStream(file);
        objectOut.writeObject(vars);
        }catch(Exception ex) {
            ex.printStackTrace();
        }

    }

}
