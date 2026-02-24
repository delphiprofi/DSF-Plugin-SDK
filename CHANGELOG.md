# Changelog

All notable changes to the DSF Plugin SDK will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

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

