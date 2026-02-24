library FrankPlugin;

// =====>     DDDDD    SSSSS  FFFFFF    Delphi Sourcecode Formatter
// ====>     D    D  S       F          F. Lauter   aka Mavarik
// ===>     D    D   SSSS   FFF
// ==>     D    D       S  F
// =>     DDDDD   SSSSS   F             Version 2018 - 2026

// FDK-Formatter Frank-Style Plugin-DLL (M4)
// Ueberschreibt nur DoUses mit Franks zweiphasiger Formatierung

uses
  PluginSDK in 'PluginSDK.pas',
  FrankPlugin.DoUses in 'FrankPlugin.DoUses.pas';

exports
  GetPluginVersion,
  GetPluginName,
  DoUses;

begin
end.
