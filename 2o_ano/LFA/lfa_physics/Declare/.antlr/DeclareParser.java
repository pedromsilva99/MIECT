// Generated from /home/tiago/Desktop/lfa1920-g15/Declare/Declare.g4 by ANTLR 4.7.1
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class DeclareParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, NUM=15, WORD=16, COMMENT=17, 
		WS=18;
	public static final int
		RULE_program = 0, RULE_decl = 1, RULE_oper = 2;
	public static final String[] ruleNames = {
		"program", "decl", "oper"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'end'", "';'", "'dim'", "'['", "']'", "'as'", "'real'", "'integer'", 
		"'unit'", "'const'", "'*'", "'/'", "'('", "')'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, "NUM", "WORD", "COMMENT", "WS"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "Declare.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public DeclareParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class ProgramContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(DeclareParser.EOF, 0); }
		public List<DeclContext> decl() {
			return getRuleContexts(DeclContext.class);
		}
		public DeclContext decl(int i) {
			return getRuleContext(DeclContext.class,i);
		}
		public TerminalNode WORD() { return getToken(DeclareParser.WORD, 0); }
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			setState(22);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,2,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(9);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__2) | (1L << T__8) | (1L << T__9))) != 0)) {
					{
					{
					setState(6);
					decl();
					}
					}
					setState(11);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(12);
				match(EOF);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(16);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__2) | (1L << T__8) | (1L << T__9))) != 0)) {
					{
					{
					setState(13);
					decl();
					}
					}
					setState(18);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(19);
				match(T__0);
				setState(20);
				match(T__1);
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(21);
				match(WORD);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class DeclContext extends ParserRuleContext {
		public DeclContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_decl; }
	 
		public DeclContext() { }
		public void copyFrom(DeclContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class UnitCreateContext extends DeclContext {
		public TerminalNode WORD() { return getToken(DeclareParser.WORD, 0); }
		public OperContext oper() {
			return getRuleContext(OperContext.class,0);
		}
		public UnitCreateContext(DeclContext ctx) { copyFrom(ctx); }
	}
	public static class ConstFromOperContext extends DeclContext {
		public TerminalNode WORD() { return getToken(DeclareParser.WORD, 0); }
		public TerminalNode NUM() { return getToken(DeclareParser.NUM, 0); }
		public OperContext oper() {
			return getRuleContext(OperContext.class,0);
		}
		public ConstFromOperContext(DeclContext ctx) { copyFrom(ctx); }
	}
	public static class ConstFromNumbContext extends DeclContext {
		public TerminalNode WORD() { return getToken(DeclareParser.WORD, 0); }
		public TerminalNode NUM() { return getToken(DeclareParser.NUM, 0); }
		public ConstFromNumbContext(DeclContext ctx) { copyFrom(ctx); }
	}
	public static class DimFromDimContext extends DeclContext {
		public TerminalNode WORD() { return getToken(DeclareParser.WORD, 0); }
		public OperContext oper() {
			return getRuleContext(OperContext.class,0);
		}
		public DimFromDimContext(DeclContext ctx) { copyFrom(ctx); }
	}
	public static class DimFromUnitContext extends DeclContext {
		public List<TerminalNode> WORD() { return getTokens(DeclareParser.WORD); }
		public TerminalNode WORD(int i) {
			return getToken(DeclareParser.WORD, i);
		}
		public DimFromUnitContext(DeclContext ctx) { copyFrom(ctx); }
	}

	public final DeclContext decl() throws RecognitionException {
		DeclContext _localctx = new DeclContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_decl);
		int _la;
		try {
			setState(58);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,3,_ctx) ) {
			case 1:
				_localctx = new DimFromUnitContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(24);
				match(T__2);
				setState(25);
				match(WORD);
				setState(26);
				match(T__3);
				setState(27);
				match(WORD);
				setState(28);
				match(T__4);
				setState(29);
				match(T__5);
				setState(30);
				_la = _input.LA(1);
				if ( !(_la==T__6 || _la==T__7) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(31);
				match(T__1);
				}
				break;
			case 2:
				_localctx = new DimFromDimContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(32);
				match(T__2);
				setState(33);
				match(WORD);
				setState(34);
				match(T__5);
				setState(35);
				oper(0);
				setState(36);
				match(T__1);
				}
				break;
			case 3:
				_localctx = new UnitCreateContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(38);
				match(T__8);
				setState(39);
				match(WORD);
				setState(40);
				match(T__5);
				setState(41);
				oper(0);
				setState(42);
				match(T__1);
				}
				break;
			case 4:
				_localctx = new ConstFromNumbContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(44);
				match(T__9);
				setState(45);
				match(WORD);
				setState(46);
				match(T__5);
				setState(47);
				match(NUM);
				setState(48);
				match(T__5);
				setState(49);
				_la = _input.LA(1);
				if ( !(_la==T__6 || _la==T__7) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(50);
				match(T__1);
				}
				break;
			case 5:
				_localctx = new ConstFromOperContext(_localctx);
				enterOuterAlt(_localctx, 5);
				{
				setState(51);
				match(T__9);
				setState(52);
				match(WORD);
				setState(53);
				match(T__5);
				setState(54);
				match(NUM);
				setState(55);
				oper(0);
				setState(56);
				match(T__1);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class OperContext extends ParserRuleContext {
		public OperContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_oper; }
	 
		public OperContext() { }
		public void copyFrom(OperContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class OperAritmContext extends OperContext {
		public OperContext a1;
		public Token op;
		public OperContext a2;
		public List<OperContext> oper() {
			return getRuleContexts(OperContext.class);
		}
		public OperContext oper(int i) {
			return getRuleContext(OperContext.class,i);
		}
		public OperAritmContext(OperContext ctx) { copyFrom(ctx); }
	}
	public static class OperSubContext extends OperContext {
		public OperContext oper() {
			return getRuleContext(OperContext.class,0);
		}
		public OperSubContext(OperContext ctx) { copyFrom(ctx); }
	}
	public static class OperBasicContext extends OperContext {
		public TerminalNode NUM() { return getToken(DeclareParser.NUM, 0); }
		public TerminalNode WORD() { return getToken(DeclareParser.WORD, 0); }
		public OperBasicContext(OperContext ctx) { copyFrom(ctx); }
	}

	public final OperContext oper() throws RecognitionException {
		return oper(0);
	}

	private OperContext oper(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		OperContext _localctx = new OperContext(_ctx, _parentState);
		OperContext _prevctx = _localctx;
		int _startState = 4;
		enterRecursionRule(_localctx, 4, RULE_oper, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(66);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__12:
				{
				_localctx = new OperSubContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;

				setState(61);
				match(T__12);
				setState(62);
				oper(0);
				setState(63);
				match(T__13);
				}
				break;
			case NUM:
			case WORD:
				{
				_localctx = new OperBasicContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(65);
				_la = _input.LA(1);
				if ( !(_la==NUM || _la==WORD) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			_ctx.stop = _input.LT(-1);
			setState(73);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,5,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new OperAritmContext(new OperContext(_parentctx, _parentState));
					((OperAritmContext)_localctx).a1 = _prevctx;
					pushNewRecursionContext(_localctx, _startState, RULE_oper);
					setState(68);
					if (!(precpred(_ctx, 3))) throw new FailedPredicateException(this, "precpred(_ctx, 3)");
					setState(69);
					((OperAritmContext)_localctx).op = _input.LT(1);
					_la = _input.LA(1);
					if ( !(_la==T__10 || _la==T__11) ) {
						((OperAritmContext)_localctx).op = (Token)_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					setState(70);
					((OperAritmContext)_localctx).a2 = oper(4);
					}
					} 
				}
				setState(75);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,5,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 2:
			return oper_sempred((OperContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean oper_sempred(OperContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 3);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\24O\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\3\2\7\2\n\n\2\f\2\16\2\r\13\2\3\2\3\2\7\2\21\n\2\f\2\16\2\24"+
		"\13\2\3\2\3\2\3\2\5\2\31\n\2\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\5\3=\n\3\3\4\3\4\3\4\3\4\3\4\3\4\5\4E\n\4\3\4"+
		"\3\4\3\4\7\4J\n\4\f\4\16\4M\13\4\3\4\2\3\6\5\2\4\6\2\5\3\2\t\n\3\2\21"+
		"\22\3\2\r\16\2U\2\30\3\2\2\2\4<\3\2\2\2\6D\3\2\2\2\b\n\5\4\3\2\t\b\3\2"+
		"\2\2\n\r\3\2\2\2\13\t\3\2\2\2\13\f\3\2\2\2\f\16\3\2\2\2\r\13\3\2\2\2\16"+
		"\31\7\2\2\3\17\21\5\4\3\2\20\17\3\2\2\2\21\24\3\2\2\2\22\20\3\2\2\2\22"+
		"\23\3\2\2\2\23\25\3\2\2\2\24\22\3\2\2\2\25\26\7\3\2\2\26\31\7\4\2\2\27"+
		"\31\7\22\2\2\30\13\3\2\2\2\30\22\3\2\2\2\30\27\3\2\2\2\31\3\3\2\2\2\32"+
		"\33\7\5\2\2\33\34\7\22\2\2\34\35\7\6\2\2\35\36\7\22\2\2\36\37\7\7\2\2"+
		"\37 \7\b\2\2 !\t\2\2\2!=\7\4\2\2\"#\7\5\2\2#$\7\22\2\2$%\7\b\2\2%&\5\6"+
		"\4\2&\'\7\4\2\2\'=\3\2\2\2()\7\13\2\2)*\7\22\2\2*+\7\b\2\2+,\5\6\4\2,"+
		"-\7\4\2\2-=\3\2\2\2./\7\f\2\2/\60\7\22\2\2\60\61\7\b\2\2\61\62\7\21\2"+
		"\2\62\63\7\b\2\2\63\64\t\2\2\2\64=\7\4\2\2\65\66\7\f\2\2\66\67\7\22\2"+
		"\2\678\7\b\2\289\7\21\2\29:\5\6\4\2:;\7\4\2\2;=\3\2\2\2<\32\3\2\2\2<\""+
		"\3\2\2\2<(\3\2\2\2<.\3\2\2\2<\65\3\2\2\2=\5\3\2\2\2>?\b\4\1\2?@\7\17\2"+
		"\2@A\5\6\4\2AB\7\20\2\2BE\3\2\2\2CE\t\3\2\2D>\3\2\2\2DC\3\2\2\2EK\3\2"+
		"\2\2FG\f\5\2\2GH\t\4\2\2HJ\5\6\4\6IF\3\2\2\2JM\3\2\2\2KI\3\2\2\2KL\3\2"+
		"\2\2L\7\3\2\2\2MK\3\2\2\2\b\13\22\30<DK";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}