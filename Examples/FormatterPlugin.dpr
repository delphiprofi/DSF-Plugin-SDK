library FormatterPlugin;

// =====>     DDDDD    SSSSS  FFFFFF    Delphi Sourcecode Formatter
// ====>     D    D  S       F          © F. Lauter   aka Mavarik
// ===>     D    D   SSSS   FFF
// ==>     D    D       S  F
// =>     DDDDD   SSSSS   F             Version 2018 - 2026

{*****************************************************************
 * FDK-Formatter Beispiel-Plugin-DLL (M4)
 *
 * Exportiert alle 37 Do*-Funktionen als Referenz-Implementierung.
 * Nutzt ausschliesslich PluginSDK.pas — keine Host-Units noetig.
 *
 * In der Praxis exportiert eine Plugin-DLL nur die Funktionen
 * die sie tatsaechlich ueberschreiben will. Nicht exportierte
 * Funktionen werden vom Host-Formatter default behandelt.
 *****************************************************************}

uses
  PluginSDK in 'PluginSDK.pas',
  FormatterPlugin.SampleImpl in 'FormatterPlugin.SampleImpl.pas';

exports
  // Pflicht
  GetPluginVersion,
  GetPluginName,

  // Alle 37 Do*-Funktionen (optional — nur exportieren was man ueberschreiben will)
  DoNewLine,
  DoSeparator,
  DoStatic,
  DoComment,
  DoCondition,
  DoFile,
  DoProgram,
  DoUnit,
  DoSource,
  DoSection,
  DoUses,
  DoClass,
  DoRecord,
  DoInterface,
  DoClassPart,
  DoConstSection,
  DoVarSection,
  DoTypeSection,
  DoTypeDec,
  DoMethod,
  DoBlock,
  DoParam,
  DoSourceLine,
  DoCall,
  DoAll,
  DoIf,
  DoCase,
  DoVariantCase,
  DoTry,
  DoFor,
  DoWhile,
  DoWith,
  DoRepeat,
  DoIfdefBlock,
  DoIfdefBranch,
  DoAsm,
  DoEnum;

begin
end.
