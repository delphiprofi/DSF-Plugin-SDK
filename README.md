# DSF Plugin SDK

**Version 0.5 Alpha**

> 🇩🇪 [Deutsche Version](README.de.md)

The **DSF Plugin SDK** allows you to write custom formatting plugins for the
[Delphiprofi DSF (Delphi Sourcecode Formatter)](https://delphiprofi.de).
A plugin is a standard Windows DLL that exports one or more `Do*` functions.
The formatter calls these functions instead of its built-in logic, giving you
full control over how specific language constructs are rendered.

## Key Features

- **Single-file SDK** — only `PluginSDK.pas` is needed to build a plugin
- **37 overridable formatting functions** — from `DoUses` to `DoIf` to `DoMethod`
- **DLL-boundary-safe types** — `WideString`, `LongBool`, COM interfaces (`stdcall`)
- **No host dependencies** — plugins link only against the SDK, not the formatter itself
- **Selective overriding** — export only the functions you want to customize;
  everything else falls back to the formatter's default behavior
- **Compatible** with Delphi, Free Pascal, C++ and C#

## Repository Structure

```
SDK/
  PluginSDK.pas              — the SDK (the only file your plugin needs)
Examples/
  FormatterPlugin.dpr        — sample DLL project (all 37 Do* functions)
  FormatterPlugin.SampleImpl.pas  — reference implementation
  FrankPlugin.dpr            — minimal plugin (overrides DoUses only)
  FrankPlugin.DoUses.pas     — Frank-style uses formatting
Doc/
  GETTING-STARTED.md         — quick start guide (English)
  GETTING-STARTED.de.md      — quick start guide (German)
```

## Quick Start

1. Copy `SDK/PluginSDK.pas` into your project
2. Create a `library` project (DLL)
3. Export `GetPluginVersion` (required) and whichever `Do*` functions you want to override
4. Compile and place the DLL where the DSF can find it

See [Doc/GETTING-STARTED.md](Doc/GETTING-STARTED.md) for a detailed walkthrough.

## How It Works

The DSF parses Delphi source code into an Abstract Syntax Tree (AST).
When writing output, the formatter checks for each node type whether a plugin
exports the corresponding `Do*` function. If it does, the plugin function is
called with four arguments:

| Parameter | Description |
|-----------|-------------|
| `aNode: IPluginNode` | The AST node to format (type, text, children) |
| `aWriter: IPluginWriter` | Output writer (Write, Writeln, NewLine, Indent, Alignment) |
| `aHost: IPluginHost` | Host services (Dispatch children, ApplyCase, NormalizeUnitName) |
| `aRules: PPluginRules` | Current formatting rules (indentation, spacing, etc.) |

Return `True` to indicate the plugin handled the node, or `False` to let the
formatter apply its default behavior.

## License

MIT License — see [LICENSE.md](LICENSE.md)

## Status

⚠️ **Alpha** — The API may still change. Feedback is welcome!

