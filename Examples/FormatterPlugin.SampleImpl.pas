unit FormatterPlugin.SampleImpl;

// =====>     DDDDD    SSSSS  FFFFFF    Delphi Sourcecode Formatter
// ====>     D    D  S       F          F. Lauter   aka Mavarik
// ===>     D    D   SSSS   FFF
// ==>     D    D       S  F
// =>     DDDDD   SSSSS   F             Version 2018 - 2026

// FDK-Formatter Sample Plugin (M4)
//
// All 37 Do* methods as reference implementation.
// Each method demonstrates the typical usage of the SDK interfaces:
//   - aNode:   Access token type, text, children, named children
//   - aWriter: Output (Write/Writeln/NewLine/Indent/Alignment)
//   - aHost:   Dispatch (delegate children to host), ApplyCase, NormalizeUnitName
//   - aRules:  Formatting rules (BlockIndent, KeywordCase, Spacing, etc.)
//
// Uses only PluginSDK.pas - no host units required.
// Compatible with Delphi, Free Pascal, C++, C#.

interface

Uses
  SysUtils
, PluginSDK
;

// --- Required Exports ---
function GetPluginVersion: Integer; stdcall;
function GetPluginName: WideString; stdcall;

// --- All 37 Do* Functions ---
function DoNewLine     (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoSeparator   (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoStatic      (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoComment     (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoCondition   (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoFile        (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoProgram     (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoUnit        (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoSource      (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoSection     (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoUses        (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoClass       (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoRecord      (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoInterface   (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoClassPart   (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoConstSection(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoVarSection  (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoTypeSection (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoTypeDec     (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoMethod      (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoBlock       (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoParam       (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoSourceLine  (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoCall        (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoAll         (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoIf          (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoCase        (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoVariantCase (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoTry         (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoFor         (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoWhile       (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoWith        (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoRepeat      (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoIfdefBlock  (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoIfdefBranch (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoAsm         (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
function DoEnum        (aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;

implementation

// Helper: Dispatch all children to the host dispatcher
procedure DispatchChildren(aNode: IPluginNode; aHost: IPluginHost);
var
  i: integer;
begin
  for i := 0 to aNode.ChildCount - 1 do
    aHost.Dispatch(aNode.GetChild(i));
end;

// Required exports
function GetPluginVersion: Integer; stdcall;
begin
  Result := PLUGIN_API_VERSION;
end;

function GetPluginName: WideString; stdcall;
begin
  Result := 'Sample-Formatter';
end;

// 1. DoNewLine - Line break (aNode is nil)
function DoNewLine(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  aWriter.NewLine;
  Result := True;
end;

// 2. DoSeparator - Separator characters (, ; .) / aNode.GetText = separator text
function DoSeparator(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  aWriter.Write(aNode.GetText);
  Result := True;
end;

// 3. DoStatic - Static text (keywords, identifiers, operators) / aNode.GetText = text
function DoStatic(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  aWriter.Write(aNode.GetText);
  Result := True;
end;

// 4. DoComment / aNode.GetSubKind = COMMENT_LINE (//), COMMENT_ONECHAR, COMMENT_TWOCHAR
function DoComment(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  aWriter.Write(aNode.GetText);
  Result := True;
end;

// 5. DoCondition - Compiler-Direktive / aNode.GetSubKind = COND_START / COND_ELSE / COND_ELSEIF / COND_END
function DoCondition(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  aWriter.Write(aNode.GetText);
  Result := True;
end;

// 6. DoFile - Root node (container for Unit/Program/Library)
function DoFile(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 7. DoProgram - program/library/package / aNode.GetText = Name / Named: 'Section'
function DoProgram(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var lSection: IPluginNode;
begin
  aWriter.Write(aHost.ApplyCase('program') + ' ');
  aWriter.Writeln(aNode.GetText + ';');
  aWriter.NewLine;
  lSection := aNode.GetNamedChild('Section');
  if lSection <> nil then
    DispatchChildren(lSection, aHost);
  Result := True;
end;

// 8. DoUnit / aNode.GetText = Unit-Name / Named: 'InterfaceSection', 'ImplementationSection'
function DoUnit(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var lSection: IPluginNode;
begin
  aWriter.Write(aHost.ApplyCase('unit') + ' ');
  aWriter.Write(aNode.GetText + ';');
  aWriter.NewLine;
  aWriter.NewLine;
  lSection := aNode.GetNamedChild('InterfaceSection');
  if lSection <> nil then
    aHost.Dispatch(lSection);
  lSection := aNode.GetNamedChild('ImplementationSection');
  if lSection <> nil then
    aHost.Dispatch(lSection);
  aWriter.Writeln(aHost.ApplyCase('end') + '.');
  Result := True;
end;

// 9. DoSource - Generic container (then/else branches, content)
function DoSource(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 10. DoSection - interface/implementation / aNode.GetTyp = PTYP_INTERFACE_SECTION / PTYP_IMPLEMENTATION_SECTION
function DoSection(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var lChild: IPluginNode;
var b: integer;
var i: integer;
begin
  if aNode.GetTyp = PTYP_INTERFACE_SECTION then
    aWriter.Writeln(aHost.ApplyCase('interface'))
  else
    aWriter.Writeln(aHost.ApplyCase('implementation'));
  for b := 1 to aRules^.AfterSectionKeyword do
    aWriter.NewLine;
  for i := 0 to aNode.ChildCount - 1 do
    begin
      lChild := aNode.GetChild(i);
      if (i = 0) and (lChild.GetTyp = PTYP_NEWLINE) then
        Continue;
      aHost.Dispatch(lChild);
    end;
  Result := True;
end;

// 11. DoUses - uses clause / Children: Static (unit names), Separator, NewLine, Comment
function DoUses(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var
  lChild: IPluginNode;
  lMaxLen: Integer;
  i: integer;
  lText: string;
  lName: string;
begin
  lMaxLen := aRules^.UsesMaxLineLength;
  aWriter.Writeln(aHost.ApplyCase('uses'));
  aWriter.DoIndent;
  for i := 0 to aNode.ChildCount - 1 do
    begin
      lChild := aNode.GetChild(i);
      case lChild.GetTyp of
        PTYP_NEWLINE:   ;
        PTYP_SEPARATOR: begin
                           lText := lChild.GetText;
                           if lText = ',' then
                             begin
                               aWriter.Write(',');
                               aWriter.NewLine;
                             end
                           else
                             aWriter.Write(lText);
                         end;
        PTYP_STATIC:    begin
                           lName := aHost.NormalizeUnitName(lChild.GetText);
                           if (lMaxLen > 0) and (aWriter.LineLength + Length(lName) > lMaxLen) then
                             aWriter.NewLine;
                           aWriter.Write(lName);
                         end;
        PTYP_UNIT:      begin
                           lName := aHost.NormalizeUnitName(lChild.GetText);
                           aWriter.Write(lName);
                         end;
        PTYP_COMMENT:   aHost.Dispatch(lChild);
        PTYP_CONDITION: aHost.Dispatch(lChild);
      else
        aHost.Dispatch(lChild);
      end;
    end;
  aWriter.DoUnIndent;
  aWriter.NewLine;
  Result := True;
end;

// 12. DoClass - Class declaration (container for ClassParts)
function DoClass(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 13. DoRecord - Record declaration
function DoRecord(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 14. DoInterface - Interface declaration (COM interface, not section)
function DoInterface(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 15. DoClassPart - Visibility / aNode.GetSubKind = VIS_PRIVATE / VIS_PROTECTED / VIS_PUBLIC / VIS_PUBLISHED
function DoClassPart(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var lVisibility: WideString;
begin
  case aNode.GetSubKind of
    VIS_PRIVATE:   lVisibility := aHost.ApplyCase('private');
    VIS_PROTECTED: lVisibility := aHost.ApplyCase('protected');
    VIS_PUBLIC:    lVisibility := aHost.ApplyCase('public');
    VIS_PUBLISHED: lVisibility := aHost.ApplyCase('published');
  else
    lVisibility := '';
  end;
  if lVisibility <> '' then
    aWriter.Writeln(lVisibility);
  aWriter.DoIndent;
  DispatchChildren(aNode, aHost);
  aWriter.DoUnIndent;
  Result := True;
end;

// 16. DoConstSection - const section
function DoConstSection(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var
  lChild: IPluginNode;
  lStart: Integer;
  i: integer;
begin
  aWriter.Writeln(aHost.ApplyCase('const'));
  aWriter.DoIndent;
  lStart := 0;
  while (lStart < aNode.ChildCount) do
    begin
      lChild := aNode.GetChild(lStart);
      if lChild.GetTyp <> PTYP_NEWLINE then Break;
      Inc(lStart);
    end;
  for i := lStart to aNode.ChildCount - 1 do
    aHost.Dispatch(aNode.GetChild(i));
  aWriter.DoUnIndent;
  aWriter.NewLine;
  Result := True;
end;

// 17. DoVarSection - var section
function DoVarSection(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var
  lChild: IPluginNode;
  lStart: Integer;
  i: integer;
begin
  aWriter.Writeln(aHost.ApplyCase('var'));
  aWriter.DoIndent;
  lStart := 0;
  while (lStart < aNode.ChildCount) do
    begin
      lChild := aNode.GetChild(lStart);
      if lChild.GetTyp <> PTYP_NEWLINE then Break;
      Inc(lStart);
    end;
  for i := lStart to aNode.ChildCount - 1 do
    aHost.Dispatch(aNode.GetChild(i));
  aWriter.DoUnIndent;
  aWriter.NewLine;
  Result := True;
end;

// 18. DoTypeSection - type section
function DoTypeSection(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var
  lChild: IPluginNode;
  lStart: Integer;
  i: integer;
begin
  aWriter.Writeln(aHost.ApplyCase('type'));
  aWriter.DoIndent;
  lStart := 0;
  while (lStart < aNode.ChildCount) do
    begin
      lChild := aNode.GetChild(lStart);
      if lChild.GetTyp <> PTYP_NEWLINE then Break;
      Inc(lStart);
    end;
  for i := lStart to aNode.ChildCount - 1 do
    aHost.Dispatch(aNode.GetChild(i));
  aWriter.DoUnIndent;
  aWriter.NewLine;
  Result := True;
end;

// 19. DoTypeDec - Single type declaration (currently as static tokens in AST)
function DoTypeDec(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 20. DoMethod / aNode.GetText = Name / aNode.GetSubKind = METHOD_PROCEDURE/FUNCTION/CONSTRUCTOR/DESTRUCTOR / Named: 'Declare.N'
function DoMethod(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var
  lKeyword: WideString;
  lDeclare: IPluginNode;
  lIdx: Integer;
begin
  case aNode.GetSubKind of
    METHOD_PROCEDURE:   lKeyword := aHost.ApplyCase('procedure');
    METHOD_FUNCTION:    lKeyword := aHost.ApplyCase('function');
    METHOD_CONSTRUCTOR: lKeyword := aHost.ApplyCase('constructor');
    METHOD_DESTRUCTOR:  lKeyword := aHost.ApplyCase('destructor');
  else
    lKeyword := aHost.ApplyCase('procedure');
  end;
  aWriter.Writeln(lKeyword + ' ' + aNode.GetText + ';');
  lIdx := 0;
  while aNode.HasNamedChild('Declare.' + IntToStr(lIdx)) do
    begin
      lDeclare := aNode.GetNamedChild('Declare.' + IntToStr(lIdx));
      aHost.Dispatch(lDeclare);
      Inc(lIdx);
    end;
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 21. DoBlock - begin..end Block
function DoBlock(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  aWriter.Writeln(aHost.ApplyCase('begin'));
  aWriter.DoIndent;
  DispatchChildren(aNode, aHost);
  aWriter.DoUnIndent;
  aWriter.Write(aHost.ApplyCase('end'));
  Result := True;
end;

// 22. DoParam - Single parameter (usually handled by DoMethod)
function DoParam(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  Result := True;
end;

// 23. DoSourceLine / aNode.GetText = line text
function DoSourceLine(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  aWriter.Writeln(aNode.GetText);
  Result := True;
end;

// 24. DoCall - Function/procedure call / aNode.GetText = name / children = parameters
function DoCall(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var
  i: integer;
begin
  aWriter.Write(aNode.GetText);
  aWriter.DoIndent;
  if aNode.ChildCount > 0 then
    begin
      aWriter.Write('(');
      for i := 0 to aNode.ChildCount - 1 do
        begin
          if i > 0 then
            aWriter.Write(', ');
          aHost.Dispatch(aNode.GetChild(i));
        end;
      aWriter.Write(')');
    end;
  aWriter.DoUnIndent;
  Result := True;
end;

// 25. DoAll - Generic TokenList container
function DoAll(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 26. DoIf - if..then..else / Named: 'Condition', 'ThenBranch', 'ElseBranch'
function DoIf(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var lCondition, lThen, lElse: IPluginNode;
begin
  aWriter.Write(aHost.ApplyCase('if') + ' ');
  lCondition := aNode.GetNamedChild('Condition');
  if lCondition <> nil then aHost.Dispatch(lCondition);
  aWriter.Write(' ' + aHost.ApplyCase('then'));
  lThen := aNode.GetNamedChild('ThenBranch');
  if lThen <> nil then
    begin
      aWriter.Write(' ');
      aHost.Dispatch(lThen);
    end;
  lElse := aNode.GetNamedChild('ElseBranch');
  if lElse <> nil then
    begin
      aWriter.Write(' ' + aHost.ApplyCase('else') + ' ');
      aHost.Dispatch(lElse);
    end;
  Result := True;
end;

// 27. DoCase - case..of..end / Named: 'Condition', 'ElseBranch', 'Branch.0'..'Branch.N'
function DoCase(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var
  lCondition, lBranch, lElse: IPluginNode;
  lIdx: Integer;
begin
  aWriter.Write(aHost.ApplyCase('case') + ' ');
  lCondition := aNode.GetNamedChild('Condition');
  if lCondition <> nil then aHost.Dispatch(lCondition);
  aWriter.Write(' ' + aHost.ApplyCase('of'));
  lIdx := 0;
  while aNode.HasNamedChild('Branch.' + IntToStr(lIdx)) do
    begin
      lBranch := aNode.GetNamedChild('Branch.' + IntToStr(lIdx));
      aHost.Dispatch(lBranch);
      Inc(lIdx);
    end;
  lElse := aNode.GetNamedChild('ElseBranch');
  if lElse <> nil then
    begin
      aWriter.Write(' ' + aHost.ApplyCase('else') + ' ');
      aHost.Dispatch(lElse);
    end;
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 28. DoVariantCase - case in record (variant part)
function DoVariantCase(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var lCondition: IPluginNode;
begin
  aWriter.Write(aHost.ApplyCase('case') + ' ');
  lCondition := aNode.GetNamedChild('Condition');
  if lCondition <> nil then aHost.Dispatch(lCondition);
  aWriter.Write(' ' + aHost.ApplyCase('of'));
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 29. DoTry - try..except/finally..end / Named: 'Content', 'Handler'
function DoTry(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var lContent, lHandler: IPluginNode;
begin
  aWriter.Write(aHost.ApplyCase('try'));
  lContent := aNode.GetNamedChild('Content');
  if lContent <> nil then
    begin
      aWriter.Write(' ');
      aHost.Dispatch(lContent);
    end;
  lHandler := aNode.GetNamedChild('Handler');
  if lHandler <> nil then
    begin
      aWriter.Write(' ' + aHost.ApplyCase('except') + ' ');
      aHost.Dispatch(lHandler);
    end;
  Result := True;
end;

// 30. DoFor - for..to/downto..do / Named: 'Start', 'Direction', 'EndValue', 'Content'
function DoFor(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var lStart, lDir, lEndVal, lContent: IPluginNode;
begin
  aWriter.Write(aHost.ApplyCase('for') + ' ');
  lStart := aNode.GetNamedChild('Start');
  if lStart <> nil then aHost.Dispatch(lStart);
  lDir := aNode.GetNamedChild('Direction');
  if lDir <> nil then
    begin aWriter.Write(' '); aHost.Dispatch(lDir); end;
  lEndVal := aNode.GetNamedChild('EndValue');
  if lEndVal <> nil then
    begin aWriter.Write(' '); aHost.Dispatch(lEndVal); end;
  aWriter.Write(' ' + aHost.ApplyCase('do'));
  lContent := aNode.GetNamedChild('Content');
  if lContent <> nil then
    begin aWriter.Write(' '); aHost.Dispatch(lContent); end;
  Result := True;
end;

// 31. DoWhile - while..do / Named: 'Condition', 'Content'
function DoWhile(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var lCondition, lContent: IPluginNode;
begin
  aWriter.Write(aHost.ApplyCase('while') + ' ');
  lCondition := aNode.GetNamedChild('Condition');
  if lCondition <> nil then aHost.Dispatch(lCondition);
  aWriter.Write(' ' + aHost.ApplyCase('do'));
  lContent := aNode.GetNamedChild('Content');
  if lContent <> nil then
    begin aWriter.Write(' '); aHost.Dispatch(lContent); end;
  Result := True;
end;

// 32. DoWith - with..do / Named: 'Context', 'Content'
function DoWith(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var lContext, lContent: IPluginNode;
begin
  aWriter.Write(aHost.ApplyCase('with') + ' ');
  lContext := aNode.GetNamedChild('Context');
  if lContext <> nil then aHost.Dispatch(lContext);
  aWriter.Write(' ' + aHost.ApplyCase('do'));
  lContent := aNode.GetNamedChild('Content');
  if lContent <> nil then
    begin aWriter.Write(' '); aHost.Dispatch(lContent); end;
  Result := True;
end;

// 33. DoRepeat - repeat..until / children: body tokens (until condition in parent stream)
function DoRepeat(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  aWriter.Write(aHost.ApplyCase('repeat'));
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 34. DoIfdefBlock - IFDEF..ENDIF Container
function DoIfdefBlock(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 35. DoIfdefBranch - Single IFDEF branch
function DoIfdefBranch(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  DispatchChildren(aNode, aHost);
  Result := True;
end;

// 36. DoAsm - asm..end Block
function DoAsm(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  aWriter.Writeln(aHost.ApplyCase('asm'));
  aWriter.DoIndent;
  DispatchChildren(aNode, aHost);
  aWriter.DoUnIndent;
  aWriter.Write(aHost.ApplyCase('end'));
  Result := True;
end;

// 37. DoEnum - Enum type (value1, value2, value3)
function DoEnum(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
begin
  DispatchChildren(aNode, aHost);
  Result := True;
end;

end.
