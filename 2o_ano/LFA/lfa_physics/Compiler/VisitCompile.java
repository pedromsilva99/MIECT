import org.stringtemplate.v4.*;
import java.util.*;
import java.io.*;

public class VisitCompile extends CompilerBaseVisitor<ST> {

   private STGroup templates = new STGroupFile("java.stg");
   private ArrayList<Types> types = loadFromObj();
   private ArrayList<Dimension> dims = new ArrayList<>();
   private ArrayList<Unit> units = new ArrayList<>();
   private ArrayList<Constant> consts = new ArrayList<>();
   private HashMap<String,String> vars = new HashMap<>();    //variaveis de dimensao/unidade...

   @Override public ST visitProgram(CompilerParser.ProgramContext ctx) {
      organizeTypes();
      ST res = templates.getInstanceOf("module");
      Iterator<CompilerParser.InstructionsContext> list =  ctx.instructions().iterator();
      while(list.hasNext()){
         res.add("stat",visit(list.next()).render());
      }
      return res;
   }

   @Override public ST visitInstructions(CompilerParser.InstructionsContext ctx) {
      ST res = templates.getInstanceOf("stats");
      res.add("stat", visit(ctx.getChild(0)).render());
      return res;
   }

   @Override public ST visitDefineID(CompilerParser.DefineIDContext ctx) {
      ST error = templates.getInstanceOf("error");
      if(vars.containsKey(ctx.id.getText())){
         System.err.printf("ERRO: Variável [%s] já existente \n",ctx.id.getText());
         System.exit(0);
      }
      else if(!containsDim(ctx.tipo.getText()) && !(ctx.tipo.getText().equals("int") || ctx.tipo.getText().equals("double"))){
         System.err.printf("ERRO: Dimensão [%s] não existe\n",ctx.tipo.getText());
         System.exit(0);
      }
      else{
         if(ctx.tipo.getText().equals("int") || ctx.tipo.getText().equals("double")){
            ST res = templates.getInstanceOf("decl");
            res.add("type", ctx.tipo.getText());
            res.add("var", ctx.id.getText());
            if(ctx.tipo.getText().equals("int")){vars.put(ctx.id.getText(),"int");}
            if(ctx.tipo.getText().equals("double")){vars.put(ctx.id.getText(),"double");}
            return res;
         }else{
            ST res = templates.getInstanceOf("CreateVarNoValue");
            vars.put(ctx.id.getText(),ctx.tipo.getText());
            res.add("name", ctx.id.getText());
            return res; 
         }
      }
   return error;
}

   @Override public ST visitDefineOperacao(CompilerParser.DefineOperacaoContext ctx) {
      ST error = templates.getInstanceOf("error");
      Double value = null;
      String unidade = "";
      if(vars.containsKey(ctx.id.getText())){
         System.err.printf("ERRO: Variável [%s] já existente \n",ctx.id.getText());
         System.exit(0);
      }
      //variavel ser um int ou  double
      if(ctx.tipo.getText().equals("int") || ctx.tipo.getText().equals("double")){
         ST res = templates.getInstanceOf("decl");
         res.add("type", ctx.tipo.getText());
         res.add("var", ctx.id.getText());
         res.add("value", visit(ctx.operacao()).render());
         if(ctx.tipo.getText().equals("int")){vars.put(ctx.id.getText(),"int");}
         if(ctx.tipo.getText().equals("double")){vars.put(ctx.id.getText(),"double");}
         return res;
      }
      else if(ctx.tipo.getText().equals("const")){
            value = Double.parseDouble(visit(ctx.operacao()).render());
            unidade = visit(ctx.units()).render();
            ST res = templates.getInstanceOf("CreateVarValue");
            res.add("name", ctx.id.getText());
            res.add("value",value);
            vars.put(ctx.id.getText(),ctx.tipo.getText());
            return res;
      }
      else{
         //variavel ser dimension
         value = Double.parseDouble(visit(ctx.operacao()).render());
         unidade = visit(ctx.units()).render();
         value = adjustValue(value,unidade);
         if(checkUnitsBelong(ctx.tipo.getText(), unidade)){
            ST res = templates.getInstanceOf("CreateVarValue");
            res.add("name", ctx.id.getText());
            res.add("value",value);
            vars.put(ctx.id.getText(),ctx.tipo.getText());
            return res;
         }
      }
   return error;
}


   @Override public ST visitPrintInput(CompilerParser.PrintInputContext ctx) {
      ST res = templates.getInstanceOf("print");
      res.add("value",ctx.INPUT().getText());
      return res;
   }

   @Override public ST visitPrintOper(CompilerParser.PrintOperContext ctx) {
      ST res = templates.getInstanceOf("print");
      res.add("value",visit(ctx.operacao()));
      return res;
   }

   @Override public ST visitPrintMultiple(CompilerParser.PrintMultipleContext ctx) {
      ST res = templates.getInstanceOf("print"); 
      String print = ctx.getText().substring(6, ctx.getText().length()-1);  //trim da string
      res.add("value",print);
      return res;
   }

   @Override public ST visitUpdateNoDim(CompilerParser.UpdateNoDimContext ctx) {
      ST error = templates.getInstanceOf("error");
      if(vars.containsKey(ctx.id.getText())){ //verificar que ambas as variaveis ja existem
         ST res = templates.getInstanceOf("assignValue");
            res.add("var", ctx.WORD().getText());
            res.add("value", visit(ctx.operacao()).render());
            return res;
        
      }else{
         System.err.printf("ERRO: Variável [%s] não existe! \n",ctx.id.getText());
         System.exit(0);
      }
      return error; // will never happen 
}

   @Override public ST visitUpdateDIM(CompilerParser.UpdateDIMContext ctx) {
      ST res = templates.getInstanceOf("assignDimension");
      if(!vars.containsKey(ctx.id.getText())){ //verificar que varivel ja existe
         System.err.printf("ERRO: Variável [%s] não existe \n",ctx.id.getText());
         System.exit(0);
      }
      res.add("var", ctx.WORD().getText());
      res.add("value", visit(ctx.operacao()).render());
      res.add("dim", visit(ctx.units()).render());
      return res;
   }

   @Override public ST visitParent(CompilerParser.ParentContext ctx) {
      ST res = visit(ctx.operacao());
      return res;
   }

   @Override public ST visitMultdiv(CompilerParser.MultdivContext ctx) {
      ST res = templates.getInstanceOf("stats");
      ST bop = templates.getInstanceOf("binaryExpression");
      bop.add("e1", visit(ctx.operacao(0)).render());
      bop.add("op", ctx.op.getText());
      bop.add("e2", visit(ctx.operacao(1)).render());
      res.add("stat", bop.render());
      return res;
   }

   @Override public ST visitOper(CompilerParser.OperContext ctx) {
      ST error = templates.getInstanceOf("error");
      if(ctx.NUM()==null){  //variável
         if(vars.containsKey(ctx.WORD().getText())){
            String type = vars.get(ctx.WORD().getText());
            if(type.equals("int") || type.equals("double")){
               ST res = templates.getInstanceOf("getSimpleText");
               res.add("text",ctx.WORD().getText());
               return res;
            }else{
               ST res = templates.getInstanceOf("getValueFromValue");
               res.add("var", ctx.WORD().getText());
               return res;
            }
         }   
         else{
            System.err.printf("ERRO: Variável [%s] não existee! \n",ctx.WORD().getText());
            System.exit(0);
         } 
      }else{
         ST res = templates.getInstanceOf("getValue");
         res.add("value", ctx.NUM().getText());
         return res;
      }
   return error;
}

   @Override public ST visitSubadd(CompilerParser.SubaddContext ctx) {
      ST res = templates.getInstanceOf("stats");
      ST bop = templates.getInstanceOf("binaryExpression");
      bop.add("e1", visit(ctx.operacao(0)).render());
      bop.add("op", ctx.op.getText());
      bop.add("e2", visit(ctx.operacao(1)).render());
      res.add("stat", bop.render());
      return res;
   }

   @Override public ST visitUnitName(CompilerParser.UnitNameContext ctx) {
      ST res = templates.getInstanceOf("getUnits");
      res.add("value", ctx.WORD());        // obter unidade
      return res;
   }

   @Override public ST visitUnitSquared(CompilerParser.UnitSquaredContext ctx) {
      ST res = templates.getInstanceOf("getUnits");
      String units = ""+ctx.w1.getText()+ctx.op.getText()+ctx.e.getText();  //concatenar as unidades
      if(ctx.w2 != null){
         units += ctx.w2.getText();
      }
      res.add("value", units);
      return res;
   }

   @Override public ST visitUnitOper(CompilerParser.UnitOperContext ctx) {
      ST res = templates.getInstanceOf("getUnits");
      String units = ""+ctx.w1.getText()+ctx.op.getText()+ctx.w2.getText();  //concatenar as unidades
      res.add("value", units);
      return res;
   }

   @Override public ST visitIf(CompilerParser.IfContext ctx) {
      ST res = templates.getInstanceOf("ifStatementSimple");
      res.add("cond", visit(ctx.condition()).render());
      res.add("instruction", visit(ctx.instructions(0)).render());  // para já , apenas se aceita uma instruçao dentro do bloco if
      if(ctx.elseIfs().size() != 0){
         res.add("instructionElse", visit(ctx.elseIfs(0)).render());
      } 
      return res;
   }
   @Override public ST visitElseIf(CompilerParser.ElseIfContext ctx) {
      //todoooooooooooooooooooooooo
      return visitChildren(ctx);
   }

   @Override public ST visitLastElse(CompilerParser.LastElseContext ctx) {
      ST res = templates.getInstanceOf("getSimpleText");
      String elseStat = visit(ctx.instructions(0)).render();
      res.add("text", elseStat);
      return res;
   }

   @Override public ST visitCondBasic(CompilerParser.CondBasicContext ctx) {
      if(ctx.orAnd() == null){
         ST res = templates.getInstanceOf("binaryExpression");
         res.add("e1", visit(ctx.a1).render());
         res.add("op", ctx.op.getText());
         res.add("e2", visit(ctx.a2).render());
         return res;
      }else{
         ST res = templates.getInstanceOf("getSimpleText");
         ST bop = templates.getInstanceOf("binaryExpression");
         bop.add("e1", visit(ctx.a1).render());
         bop.add("op", ctx.op.getText());
         bop.add("e2", visit(ctx.a2).render());
         res.add("text",bop.render() + " " + visit(ctx.orAnd()).render());
         return res;
      }
   }

   @Override public ST visitCondNeg(CompilerParser.CondNegContext ctx) {
      ST res = templates.getInstanceOf("binaryExpression");
      res.add("e1", "!(" + visit(ctx.a1).render());   //simbolo de negaçao em java
      res.add("op", ctx.op.getText());
      res.add("e2", visit(ctx.a2).render() + ")");
      return res;
   }

   @Override public ST visitCondParentesis(CompilerParser.CondParentesisContext ctx) {
      ST res = visit(ctx.condition());
      return res;
   }

   @Override public ST visitForLoop(CompilerParser.ForLoopContext ctx) {
      ST res = templates.getInstanceOf("forLoop");
      String def = "";
      String oper = "";
      String instr = "";
      if(ctx.define() != null){
         def = visit(ctx.define()).render();
      }else{
         def = visit(ctx.update()).render();
      }
      if(ctx.operacao() != null){
         oper = visit(ctx.operacao()).render();
      }else{
         oper = visit(ctx.incremento()).render();
      }

      Iterator<CompilerParser.InstructionsContext> list =  ctx.instructions().iterator();
      while(list.hasNext()){
         instr += visit(list.next()).render() + ";\n";
      }

      res.add("def", def);
      res.add("cond", visit(ctx.condition()).render());
      res.add("oper", oper);
      res.add("instr",instr);

      return res;
   }

   @Override public ST visitIncremento(CompilerParser.IncrementoContext ctx) {
      ST res = templates.getInstanceOf("getSimpleText");
      if(vars.containsKey(ctx.WORD().getText())){
         String incr = ""+ctx.WORD().getText()+ctx.op.getText();
         res.add("text", incr);
      }
      return res;
   }

   @Override public ST visitOrAnd(CompilerParser.OrAndContext ctx) {
      ST res = templates.getInstanceOf("getSimpleText");
      res.add("text",ctx.op.getText()+" " + visit(ctx.condition()).render());
      return res;
   }

   @Override public ST visitBreakCycle(CompilerParser.BreakCycleContext ctx) {
      ST res = templates.getInstanceOf("getSimpleText");
      res.add("value","break");
      return res;
   }

   public static ArrayList<Types> loadFromObj(){
      ArrayList<Types> dims = new ArrayList<>();
      try {
          ObjectInputStream load = new ObjectInputStream(new FileInputStream("../dimensions"));
          dims = (ArrayList<Types>) load.readObject();
      } catch (Exception e) {
          e.printStackTrace();
      }
      return dims;
  }

  public boolean containsDim(String s){
      for (int i = 0; i < types.size(); i++) {
         if(types.get(i).getName().equals(s)) return true;
      }
      return false;
   }

   public void organizeTypes(){
      //adicionar aos arrays todas as dimensoes, unidades e constantes criadas no Declare
      for (int i = 0; i < types.size(); i++) {
         String type = types.get(i).getClass().getName();
         if(type.equals("Dimension")) dims.add( (Dimension) types.get(i));
         if(type.equals("Unit")) units.add( (Unit) types.get(i));
         if(type.equals("Constant")) consts.add( (Constant) types.get(i));
      }
   }

   public boolean checkDimension(String s){
      for (int i = 0; i < dims.size(); i++) {
         if(dims.get(i).getName().equals(s)) return true;
      }
      return false;
   }
   
   public boolean checkUnits(String s){
      for (int i = 0; i < units.size(); i++) {
         if(units.get(i).getName().equals(s)) return true;
      }
      return false;
   }

   //ajustar para as unidades
   public double adjustValue(Double value, String unidade){
      Double valor = 0.0;
      for(int i = 0; i<units.size();i++){
         if(units.get(i).getName().equals(unidade)){
            valor = value * units.get(i).getScale();
         }
      }
      return valor;
   }

   public boolean checkUnitsBelong(String dimName, String unitsName){
      //verificar se a unidade esta de acordo com a dimensao
      for(int i = 0; i< dims.size();i++){
         if(dims.get(i).getName().equals(dimName)){
            if(dims.get(i).getDims() == null){
               if(dims.get(i).getUnidade().getName().equals(unitsName)) return true;
               //unidade secundária
               // caso a unidade seja secundária, por exemplo, mm, verificamos se mm pertence a dimensao distance, que estamos a testar
               for(int j = 0; j < units.size(); j++){
                 if(units.get(j).getName().equals(unitsName)){
                    if(units.get(j).getDimension().getName().equals(dimName)) return true;
                 } 
               }
           }else{
               if(dims.get(i).getDims().equals(unitsName)) return true;
           }

         }
      }
     return false;
   }
}
