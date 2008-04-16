unit uPSC_RegExpr;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis.
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface

uses uPSCompiler;

procedure SIRegister_ERegExpr(CL: TPSPascalCompiler);
procedure SIRegister_TRegExpr(CL: TPSPascalCompiler);
procedure SIRegister_RegExpr(CL: TPSPascalCompiler);
implementation

uses Sysutils, RegExpr;

function BoolToStr(value: boolean): string;
begin
  if value then
    Result := 'TRUE'
  else
    Result := 'FALSE'
end;

procedure SIRegister_ERegExpr(CL: TPSPascalCompiler);
begin
  with CL.AddClass(CL.FindClass('Exception'), ERegExpr) do
  begin
    RegisterPublishedProperties;
    RegisterProperty('ErrorCode', 'integer', iptrw);
    RegisterProperty('CompilerErrorPos', 'integer', iptrw);
  end;
end;

procedure SIRegister_TRegExpr(CL: TPSPascalCompiler);
begin
  with CL.AddClass(CL.FindClass('TOBJECT'), TRegExpr) do
  begin
    RegisterPublishedProperties;
    RegisterMethod('Constructor Create');
    RegisterMethod('Function VersionMajor : integer');
    RegisterMethod('Function VersionMinor : integer');
    RegisterProperty('Expression', 'RegExprString', iptrw);
    RegisterProperty('ModifierStr', 'RegExprString', iptrw);
    RegisterProperty('ModifierI', 'boolean', iptrw);
    RegisterProperty('ModifierR', 'boolean', iptrw);
    RegisterProperty('ModifierS', 'boolean', iptrw);
    RegisterProperty('ModifierG', 'boolean', iptrw);
    RegisterProperty('ModifierM', 'boolean', iptrw);
    RegisterProperty('ModifierX', 'boolean', iptrw);
    RegisterMethod('Function Exec1( const AInputString : RegExprString) : boolean;');
    RegisterMethod('Function Exec2 : boolean;');
    RegisterMethod('Function Exec3( AOffset : integer) : boolean;');
    RegisterMethod('Function ExecNext : boolean');
    RegisterMethod('Function ExecPos( AOffset : integer) : boolean');
    RegisterProperty('InputString', 'RegExprString', iptrw);
    RegisterMethod('Function Substitute( const ATemplate : RegExprString) : RegExprString');
    RegisterMethod('Procedure Split( AInputStr : RegExprString; APieces : TStrings)');
    RegisterMethod('Function Replace1( AInputStr : RegExprString; const AReplaceStr : RegExprString; AUseSubstitution : boolean) : RegExprString;');
    RegisterMethod('Function Replace2( AInputStr : RegExprString; AReplaceFunc : TRegExprReplaceFunction) : RegExprString;');
    RegisterMethod('Function ReplaceEx( AInputStr : RegExprString; AReplaceFunc : TRegExprReplaceFunction) : RegExprString');
    RegisterProperty('SubExprMatchCount', 'integer', iptr);
    RegisterProperty('MatchPos', 'integer integer', iptr);
    RegisterProperty('MatchLen', 'integer integer', iptr);
    RegisterProperty('Match', 'RegExprString integer', iptr);
    RegisterMethod('Function LastError : integer');
    RegisterMethod('Function ErrorMsg( AErrorID : integer) : RegExprString');
    RegisterProperty('CompilerErrorPos', 'integer', iptr);
    RegisterProperty('SpaceChars', 'RegExprString', iptrw);
    RegisterProperty('WordChars', 'RegExprString', iptrw);
    RegisterProperty('LineSeparators', 'RegExprString', iptrw);
    RegisterProperty('LinePairedSeparator', 'RegExprString', iptrw);
    RegisterMethod('Function InvertCaseFunction( const Ch : REChar) : REChar');
    RegisterProperty('InvertCase', 'TRegExprInvertCaseFunction', iptrw);
    RegisterMethod('Procedure Compile');
    RegisterMethod('Function Dump : RegExprString');
  end;
end;

procedure SIRegister_RegExpr(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('AnsiString', 'String');

  CL.AddTypeS('RegExprString', 'AnsiString');
  CL.AddTypeS('REChar', 'Char');
  CL.AddTypeS('TRegExprInvertCaseFunction', 'Function ( const Ch : REChar) : REChar');
  //  CL.AddConstantN('EscChar', 'String').SetString(EscChar);
  //  CL.AddConstantN('RegExprModifierI', 'boolean').SetString(BoolToStr(RegExprModifierI));
  //  CL.AddConstantN('RegExprModifierR', 'boolean').SetString(BoolToStr(RegExprModifierI));
  //  CL.AddConstantN('RegExprModifierS', 'boolean').SetString(BoolToStr(RegExprModifierI));
  //  CL.AddConstantN('RegExprModifierG', 'boolean').SetString(BoolToStr(RegExprModifierI));
  //  CL.AddConstantN('RegExprModifierM', 'boolean').SetString(BoolToStr(RegExprModifierI));
  //  CL.AddConstantN('RegExprModifierX', 'boolean').SetString(BoolToStr(RegExprModifierI));
  //  CL.AddConstantN('RegExprSpaceChars', 'RegExprString').SetString(RegExprSpaceChars);
  //  CL.AddConstantN('RegExprWordChars', 'RegExprString').SetString(RegExprWordChars);
  //  CL.AddConstantN('RegExprLineSeparators', 'RegExprString').SetString(RegExprLineSeparators);
  //  CL.AddConstantN('RegExprLinePairedSeparator', 'RegExprString').SetString(RegExprLinePairedSeparator);
  //  CL.AddConstantN('NSUBEXP', 'LongInt').SetInt(NSUBEXP);
  //  CL.AddConstantN('NSUBEXPMAX', 'LongInt').SetInt(NSUBEXPMAX);
  //  CL.AddConstantN('MaxBracesArg', 'LongInt').SetInt(MaxBracesArg);
  //  CL.AddConstantN('LoopStackMax', 'LongInt').SetInt(LoopStackMax);
  //  CL.AddConstantN('TinySetLen', 'LongInt').SetInt(TinySetLen);
  CL.AddClass(CL.FindClass('TOBJECT'), TRegExpr);
  CL.AddTypeS('TRegExprReplaceFunction', 'Function ( ARegExpr : TRegExpr) : string');
  SIRegister_TRegExpr(CL);
  SIRegister_ERegExpr(CL);

  CL.AddDelphiFunction('Function ExecRegExpr( const ARegExpr, AInputStr : RegExprString) : boolean');
  CL.AddDelphiFunction('Procedure SplitRegExpr( const ARegExpr, AInputStr : RegExprString; APieces : TStrings)');
  CL.AddDelphiFunction('Function ReplaceRegExpr( const ARegExpr, AInputStr, AReplaceStr : RegExprString; AUseSubstitution : boolean) : RegExprString');
  CL.AddDelphiFunction('Function QuoteRegExprMetaChars( const AStr : RegExprString) : RegExprString');
  CL.AddDelphiFunction('Function RegExprSubExpressions( const ARegExpr : string; ASubExprs : TStrings; AExtendedSyntax : boolean) : integer');
end;

end.
