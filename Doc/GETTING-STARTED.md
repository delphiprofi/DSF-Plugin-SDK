# Getting Started with DSF Plugins

> 🇩🇪 [Deutsche Version](GETTING-STARTED.de.md)

## Prerequisites

- Delphi (10.x or newer recommended) or Free Pascal
- The DSF (Delphi Sourcecode Formatter) installed

## Step 1: Create a DLL Project

Create a new Delphi `library` project:

```pascal
library MyPlugin;

uses
  PluginSDK in '..\SDK\PluginSDK.pas',
  MyPlugin.Impl in 'MyPlugin.Impl.pas';

exports
  GetPluginVersion,
  DoUses;           // export only what you want to override

begin
end.
```

## Step 2: Implement Your Formatting

Create your implementation unit. Every `Do*` function has the same signature:

```pascal
function DoUses(aNode: IPluginNode; aWriter: IPluginWriter;
                aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
```

**The four parameters:**

- **`aNode`** — The AST node you are formatting. Use `GetTyp`, `GetText`,
  `ChildCount`, `GetChild(i)`, and `GetNamedChild('name')` to inspect it.
- **`aWriter`** — Write your formatted output. Key methods:
  - `Write(text)` — append text to the current line
  - `Writeln(text)` — write text and start a new line
  - `NewLine` — insert a line break
  - `DoIndent` / `DoUnIndent` — increase / decrease indentation
  - `BeginAlignment` / `ColWrite` / `EndAlignment` — tabular alignment
- **`aHost`** — Host services:
  - `Dispatch(node)` — delegate a child node back to the formatter
  - `ApplyCase('keyword')` — apply the configured keyword casing
  - `NormalizeUnitName('name')` — normalize a unit name
- **`aRules`** — The current formatting rules (read-only record)

## Step 3: The Required Export

Every plugin **must** export `GetPluginVersion`:

```pascal
function GetPluginVersion: Integer; stdcall;
begin
  Result := PLUGIN_API_VERSION;  // from PluginSDK.pas
end;
```

## Step 4: Compile and Deploy

1. Compile your DLL
2. Place it in the DSF's plugin directory
3. The formatter will automatically detect and load the plugin

## Tips

- **Start small**: Override just one function (e.g. `DoUses`) and let the
  formatter handle everything else
- **Use `Dispatch`**: When your plugin encounters child nodes it doesn't
  want to handle specially, call `aHost.Dispatch(childNode)` to delegate
  back to the formatter
- **Return `False`**: If your function decides at runtime that it doesn't
  want to handle a particular node, return `False` — the formatter will
  use its default logic
- **Look at the examples**: `FormatterPlugin.SampleImpl.pas` contains all
  37 functions as a reference. `FrankPlugin.DoUses.pas` shows a real-world
  uses-clause formatter

## Available Do* Functions

| Function | AST Node | Description |
|----------|----------|-------------|
| `DoFile` | File root | Top-level container |
| `DoUnit` | `unit` | Unit declaration |
| `DoProgram` | `program` | Program declaration |
| `DoSection` | `interface` / `implementation` | Section header |
| `DoUses` | `uses` | Uses clause |
| `DoClass` | `class` | Class declaration |
| `DoRecord` | `record` | Record declaration |
| `DoInterface` | `interface` (COM) | Interface declaration |
| `DoMethod` | procedure/function | Method declaration |
| `DoBlock` | `begin..end` | Code block |
| `DoIf` | `if..then..else` | If statement |
| `DoCase` | `case..of` | Case statement |
| `DoFor` | `for..do` | For loop |
| `DoWhile` | `while..do` | While loop |
| `DoRepeat` | `repeat..until` | Repeat loop |
| `DoWith` | `with..do` | With statement |
| `DoTry` | `try..except/finally` | Exception handling |
| ... | ... | and 19 more — see `PluginSDK.pas` |

