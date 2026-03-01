# Changelog

All notable changes to the DSF Plugin SDK will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [0.7-alpha] - 2026-03-01

### Added
- `METHOD_CLASS_FUNCTION` and `METHOD_CLASS_PROCEDURE` constants for class method support
- `CALL_NONE`, `CALL_VAR`, `CALL_CONST`, `CALL_OUT` constants for parameter call-type modifiers
- Extended named-children documentation: `Param.0`..`Param.N`, `ParamCount`, `TypeDec`, `Modifiers`

### Changed
- `FormatterPlugin.SampleImpl.pas` now uses `SysUtils` instead of `System.SysUtils` for broader Delphi version compatibility
- `FormatterPlugin.SampleImpl.pas` uses classic `var` blocks instead of inline `for var` declarations for pre-10.3 compatibility
- `FrankPlugin` `GetPluginName` returns `'FrankPlugin'` instead of `'Frank''s Uses'`

## [0.6-alpha] - 2026-02-24

### Added
- New optional export `GetPluginName: WideString; stdcall;` — allows a plugin
  to report its display name at runtime
- `TGetPluginName` type added to `PluginSDK.pas`
- Host loader reads `GetPluginName` and stores it in `TLoadedPlugin.PluginName`

### Note
`GetPluginName` is **optional**. Existing plugins without this export continue
to work — the host will simply use an empty string as the plugin name.

## [0.5-alpha] - 2026-02-24

### Added
- Initial public release of the Plugin SDK
- `PluginSDK.pas` — single-file SDK with all types and interfaces
- 37 overridable `Do*` formatting functions
- COM-based interfaces (`IPluginNode`, `IPluginWriter`, `IPluginHost`)
- `TPluginRules` record for formatting configuration
- DLL-boundary-safe types (`WideString`, `LongBool`, `stdcall`)
- Full reference plugin (`FormatterPlugin.SampleImpl.pas`) with all 37 functions
- Minimal uses-clause plugin (`FrankPlugin.DoUses.pas`) as real-world example
- Bilingual documentation (English / German)

### Note
This is an **Alpha** release. The API may still change based on feedback.

