unit FrankPlugin.DoUses;

// =====>     DDDDD    SSSSS  FFFFFF    Delphi Sourcecode Formatter
// ====>     D    D  S       F          F. Lauter   aka Mavarik
// ===>     D    D   SSSS   FFF
// ==>     D    D       S  F
// =>     DDDDD   SSSSS   F             Version 2018 - 2026

// Frank-Style Uses-Formatierung als Plugin
//
// Zweiphasige Formatierung:
//   Phase 1 (vor Breakline-Kommentar): Kompakt, mehrere Units pro Zeile
//   Phase 2 (nach Breakline-Kommentar): Eine Unit pro Zeile, Komma vorne,
//           mit Alignment fuer // Kommentare
//
// Beispiel-Output:
//   Uses
//     System.SysUtils, System.Classes, System.IOUtils,
//     , Delphiprofi.DSF.Types               // FL 19.02.26
//     , Delphiprofi.DSF.SyntaxTree.Intf     // FL 19.02.26
//     , Delphiprofi.DSF.SourceWriter.Intf
//   ;

interface

Uses
  System.SysUtils
, PluginSDK
;

function GetPluginVersion: Integer; stdcall;
function DoUses(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;

implementation

function GetPluginVersion: Integer; stdcall;
begin
  Result := PLUGIN_API_VERSION;
end;

// Helper: Sucht den {} Breakline-Kommentar
// Gibt den Index zurueck oder -1 wenn keiner vorhanden
function FindBreakLine(aNode: IPluginNode): Integer;
var
  lChild: IPluginNode;
begin
  Result := -1;
  for var i := 0 to aNode.ChildCount - 1 do
    begin
      lChild := aNode.GetChild(i);
      if (lChild.GetTyp = PTYP_COMMENT) and
         (lChild.GetSubKind = COMMENT_ONECHAR) and
         (lChild.GetText = '{}') then
        Exit(i);
    end;
end;

// Helper: Prüft ob das nächste Token ein //-Kommentar ist
function NextIsLineComment(aNode: IPluginNode; aIdx: Integer): LongBool;
var
  lNext: IPluginNode;
begin
  Result := False;
  if aIdx + 1 < aNode.ChildCount then
    begin
      lNext := aNode.GetChild(aIdx + 1);
      if (lNext.GetTyp = PTYP_COMMENT) and (lNext.GetSubKind = COMMENT_LINE) then
        Result := True;
    end;
end;

function DoUses(aNode: IPluginNode; aWriter: IPluginWriter; aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
var
  lChild: IPluginNode;
  lBreakLine: Integer;
  lLine: WideString;
  lFirst: LongBool;
  lIndentStr: WideString;
  lAlignActive: LongBool;
begin
  lBreakLine := FindBreakLine(aNode);

  // --- Header ---
  aWriter.Writeln('Uses');

  lFirst := True;
  lLine := '';
  lAlignActive := False;

  for var i := 0 to aNode.ChildCount - 1 do
    begin
      lChild := aNode.GetChild(i);

      // =============================================
      // Phase 1: VOR dem Breakline (kompakt)
      // =============================================
      if (lBreakLine <> -1) and (i <= lBreakLine) then
        begin
          // Zeilenumbruch bei > 200 Zeichen
          if Length(lLine) > 200 then
            begin
              aWriter.Writeln(lLine);
              lLine := '  ';
            end;

          case lChild.GetTyp of
            PTYP_NONE:
              ;

            PTYP_NEWLINE:
              begin
                aWriter.Writeln(lLine);
                lLine := '  ';
              end;

            PTYP_UNIT:
              begin
                if lFirst then
                  begin
                    lLine := lLine + '  ' + lChild.GetText + ',';
                    lFirst := False;
                  end
                else
                  begin
                    lLine := lLine + lChild.GetText;
                    if i < lBreakLine - 1 then
                      lLine := lLine + ',';
                  end;
              end;

            PTYP_STATIC:
              lLine := lLine + lChild.GetText;

            PTYP_COMMENT:
              begin
                if (lChild.GetSubKind = COMMENT_ONECHAR) and (lChild.GetText = '{}') then
                  begin
                    // Breakline-Kommentar: Zeile ausgeben und Alignment starten
                    lLine := lLine + '{}';
                    aWriter.Writeln(lLine);
                    lLine := '';

                    // Ab hier Phase 2: Alignment fuer // Kommentare starten
                    aWriter.BeginAlignment(2);
                    lAlignActive := True;
                    Continue;
                  end
                else
                  lLine := lLine + lChild.GetText;
              end;

            PTYP_CONDITION:
              lLine := lLine + lChild.GetText;
          end; // of case

          if lLine <> '' then
            lLine := lLine + ' ';
        end

      // =============================================
      // Phase 2: NACH dem Breakline (eine Unit pro Zeile)
      // =============================================
      else
        begin
          // Indent-String fuer Verschachtelung
          if aWriter.Indent > 2 then
            begin
              lIndentStr := '';
              for var s := 1 to aWriter.Indent - 2 do
                lIndentStr := lIndentStr + ' ';
            end
          else
            lIndentStr := '';

          case lChild.GetTyp of
            PTYP_NONE:
              ;

            PTYP_NEWLINE:
              ;  // Skip — wir steuern Zeilenumbrueche selbst

            PTYP_UNIT:
              begin
                var lName := aHost.NormalizeUnitName(lChild.GetText);

                if lFirst then
                  lLine := lIndentStr + '  ' + lName
                else
                  lLine := lIndentStr + ', ' + lName;

                if NextIsLineComment(aNode, i) then
                  // Spalte 0: Unit-Zeile, Spalte 1 wird vom Kommentar gefuellt
                  aWriter.ColWrite(0, lLine)
                else
                  begin
                    aWriter.ColWrite(0, lLine);
                    aWriter.NewLine;
                  end;

                if lFirst then
                  lFirst := False;
              end;

            PTYP_STATIC:
              begin
                var lText := lChild.GetText;
                if Trim(String(lText)) <> '' then
                  begin
                    aWriter.ColWrite(0, lText);
                    aWriter.NewLine;
                  end;
              end;

            PTYP_COMMENT:
              begin
                if lChild.GetSubKind = COMMENT_LINE then
                  begin
                    // // Kommentar: In Spalte 1 fuer Alignment
                    aWriter.ColWrite(1, ' ' + lChild.GetText);
                    aWriter.NewLine;
                  end
                else
                  begin
                    aWriter.ColWrite(0, lChild.GetText);
                    aWriter.NewLine;
                  end;
              end;

            PTYP_CONDITION:
              begin
                aWriter.ColWrite(0, lChild.GetText);
                if not NextIsLineComment(aNode, i) then
                  aWriter.NewLine;
              end;

          else
            aHost.Dispatch(lChild);
          end; // of case
        end;
    end;

  // --- Abschluss ---
  if lAlignActive then
    aWriter.EndAlignment;

  // Letzte Zeile der Phase 1 ausgeben falls noetig
  if lLine <> '' then
    aWriter.Writeln(lLine);

  // Schlusssemikolon: 2 Leerzeilen danach
  if aNode.ChildCount > 0 then
    begin
      lChild := aNode.GetChild(aNode.ChildCount - 1);
      if (lChild.GetTyp = PTYP_STATIC) and (Trim(String(lChild.GetText)) = ';') then
        begin
          aWriter.NewLine;
          aWriter.NewLine;
        end;
    end;

  Result := True;
end;

end.
