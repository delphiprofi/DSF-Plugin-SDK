unit PluginSDK;

// =====>     DDDDD    SSSSS  FFFFFF    Delphi Sourcecode Formatter
// ====>     D    D  S       F          © F. Lauter   aka Mavarik
// ===>     D    D   SSSS   FFF
// ==>     D    D       S  F
// =>     DDDDD   SSSSS   F             Version 2018 - 2026

{*****************************************************************
 * FDK-Formatter Plugin SDK
 *
 * This is the ONLY file a plugin DLL needs to link against.
 * No dependencies on host units (SyntaxTree, SourceWriter, etc.)
 *
 * All types are DLL-boundary-safe:
 *   - WideString (COM BSTR) instead of String
 *   - LongBool (4 bytes) instead of Boolean
 *   - Integer instead of Enums
 *   - COM Interfaces (IUnknown-based, stdcall)
 *   - Pointer to Records (PPluginRules)
 *
 * Compatible with: Delphi, Free Pascal, C++, C#
 *
 * 23.02.26 Created (M4)
 *****************************************************************}

interface

const
  // --- Plugin API Version ---
  PLUGIN_API_VERSION = 1;

  // --- Token Types (= Ord(TPasToken)) ---
  PTYP_NONE                   = 0;
  PTYP_NEWLINE                = 1;
  PTYP_SEPARATOR              = 2;
  PTYP_STATIC                 = 3;
  PTYP_COMMENT                = 4;
  PTYP_CONDITION              = 5;
  PTYP_IFDEF_BLOCK            = 6;
  PTYP_IFDEF_BRANCH           = 7;
  PTYP_FILE                   = 8;
  PTYP_PROGRAM                = 9;
  PTYP_UNIT                   = 10;
  PTYP_LIBRARY                = 11;
  PTYP_PACKAGE                = 12;
  PTYP_INCLUDE                = 13;
  PTYP_INTERFACE_SECTION      = 14;
  PTYP_IMPLEMENTATION_SECTION = 15;
  PTYP_USES                   = 16;
  PTYP_CLASS                  = 17;
  PTYP_RECORD                 = 18;
  PTYP_INTERFACE              = 19;
  PTYP_CLASSPART              = 20;
  PTYP_CONST                  = 21;
  PTYP_VAR                    = 22;
  PTYP_TYPE                   = 23;
  PTYP_TYPEDEC                = 24;
  PTYP_METHOD                 = 25;
  PTYP_FOR                    = 26;
  PTYP_WHILE                  = 27;
  PTYP_PARAMLIST              = 28;
  PTYP_PARAMS                 = 29;
  PTYP_NAME                   = 30;
  PTYP_CALLER                 = 31;
  PTYP_SOURCE                 = 32;
  PTYP_SOURCELINE             = 33;
  PTYP_BLOCK                  = 34;
  PTYP_CALL                   = 35;
  PTYP_TOKENLIST              = 36;
  PTYP_ASM                    = 37;
  PTYP_CLASS_FORWARD          = 38;
  PTYP_RECORD_FORWARD         = 39;
  PTYP_INTERFACE_FORWARD      = 40;
  PTYP_POINTER                = 41;
  PTYP_ENUM                   = 42;
  PTYP_IF                     = 43;
  PTYP_THEN                   = 44;
  PTYP_ELSE                   = 45;
  PTYP_CASE                   = 46;
  PTYP_BRANCH                 = 47;
  PTYP_VARIANT_CASE           = 48;
  PTYP_VALUELIST              = 49;
  PTYP_TRY                    = 50;
  PTYP_EXCEPT                 = 51;
  PTYP_FINALLY                = 52;
  PTYP_CONTENT                = 53;
  PTYP_WITH                   = 54;
  PTYP_REPEAT                 = 55;

  // --- Comment Kinds (= Ord(TCommentKind)) ---
  COMMENT_LINE     = 0;  // //
  COMMENT_ONECHAR  = 1;  // { }
  COMMENT_TWOCHAR  = 2;  // (* *)

  // --- Condition Kinds (= Ord(TConditionKind)) ---
  COND_UNDEFINED   = 0;
  COND_START       = 1;  // {$IFDEF}
  COND_ELSE        = 2;  // {$ELSE}
  COND_ELSEIF      = 3;  // {$ELSEIF}
  COND_END         = 4;  // {$ENDIF}

  // --- Method Kinds (= Ord(TMethodKind)) ---
  METHOD_PROCEDURE   = 0;
  METHOD_FUNCTION    = 1;
  METHOD_CONSTRUCTOR = 2;
  METHOD_DESTRUCTOR  = 3;

  // --- Visibility (= Ord(TVisibility)) ---
  VIS_PRIVATE   = 0;
  VIS_PROTECTED = 1;
  VIS_PUBLIC    = 2;
  VIS_PUBLISHED = 3;

  // --- Keyword Case (for TPluginRules.KeywordCase) ---
  KC_LOWER   = 0;
  KC_CAPITAL = 1;
  KC_UPPER   = 2;

  // --- Named Children (for IPluginNode.GetNamedChild) ---
  //
  // IPas_If:        'Condition', 'ThenBranch', 'ElseBranch'
  // IPas_Case:      'Condition', 'ElseBranch', 'Branch.0'..'Branch.N'
  // IPas_Try:       'Content', 'Handler'
  // IPas_For:       'Start', 'Direction', 'EndValue', 'Content'
  // IPas_While:     'Condition', 'Content'
  // IPas_With:      'Context', 'Content'
  // IPas_Repeat:    (token children only)
  // IPas_Method:    'Declare.0'..'Declare.N'
  // IPas_Unit:      'InterfaceSection', 'ImplementationSection'
  // IPas_Program:   'Section'
  //
  // For all:        'Parent'

type
  PPluginRules = ^TPluginRules;
  TPluginRules = packed record
    BlockIndent:         Integer;
    KeywordCase:         Integer;     // KC_LOWER / KC_CAPITAL / KC_UPPER
    UsesMaxLineLength:   Integer;
    AfterSectionKeyword: Integer;
    BetweenMethods:      Integer;
    AfterUses:           Integer;
    AlignmentConstants:  LongBool;
    AlignmentVarColon:   LongBool;
    SpaceAfterOpenParen: LongBool;
    SpaceBeforeCloseParen : LongBool;
    SpaceBeforeColon:    LongBool;
    SpaceAfterColon:     LongBool;
    SpaceAroundAssign:   LongBool;
    SpaceAroundOperator: LongBool;
    SpaceAfterComma:     LongBool;
    SpaceBeforeSemicolon: LongBool;
    BeginOnNewLine:      LongBool;
  end;

  IPluginNode = Interface(IUnknown)
    ['{F1A2B3C4-D5E6-7890-ABCD-EF1234500001}']
    function  GetTyp: Integer; stdcall;
    function  GetText: WideString; stdcall;
    function  GetSubKind: Integer; stdcall;
    function  ChildCount: Integer; stdcall;
    function  GetChild(aIndex: Integer): IPluginNode; stdcall;
    function  GetNamedChild(const aName: WideString): IPluginNode; stdcall;
    function  HasNamedChild(const aName: WideString): LongBool; stdcall;
  end;

  IPluginWriter = Interface(IUnknown)
    ['{F1A2B3C4-D5E6-7890-ABCD-EF1234500002}']
    procedure Write(const aLine: WideString); stdcall;
    procedure Writeln(const aLine: WideString); stdcall;
    procedure NewLine; stdcall;
    procedure DoIndent; stdcall;
    procedure DoUnIndent; stdcall;
    function  LineLength: Integer; stdcall;
    function  Indent: Integer; stdcall;
    procedure BeginAlignment(aColumnCount: Integer); stdcall;
    procedure ColWrite(aColumn: Integer; const aText: WideString); stdcall;
    procedure EndAlignment; stdcall;
  end;

  IPluginHost = Interface(IUnknown)
    ['{F1A2B3C4-D5E6-7890-ABCD-EF1234500003}']
    procedure Dispatch(aNode: IPluginNode); stdcall;
    function  ApplyCase(const aKeyword: WideString): WideString; stdcall;
    function  NormalizeUnitName(const aName: WideString): WideString; stdcall;
  end;

  // Unified signature for all Do* plugin functions
  TPluginDoFunc = function(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;

  // Required exports
  TGetPluginVersion = function: Integer; stdcall;
  TGetPluginName    = function: WideString; stdcall;

implementation

end.
