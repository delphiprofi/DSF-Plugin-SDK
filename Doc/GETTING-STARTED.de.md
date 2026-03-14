# Erste Schritte mit DSF Plugins

> 🇬🇧 [English Version](GETTING-STARTED.md)

## Voraussetzungen

- Delphi (10.x oder neuer empfohlen) oder Free Pascal
- Der DSF (Delphi Sourcecode Formatter) muss installiert sein

## Schritt 1: DLL-Projekt anlegen

Neues Delphi `library`-Projekt erstellen:

```pascal
library MyPlugin;

uses
  PluginSDK in '..\SDK\PluginSDK.pas',
  MyPlugin.Impl in 'MyPlugin.Impl.pas';

exports
  GetPluginVersion,
  GetPluginName,
  DoUses;           // nur exportieren, was man überschreiben will

begin
end.
```

## Schritt 2: Formatierung implementieren

Implementierungs-Unit anlegen. Jede `Do*`-Funktion hat dieselbe Signatur:

```pascal
function DoUses(aNode: IPluginNode; aWriter: IPluginWriter;
                aHost: IPluginHost; aRules: PPluginRules): LongBool; stdcall;
```

**Die vier Parameter:**

- **`aNode`** — Der AST-Knoten, der formatiert werden soll. Methoden:
  `GetTyp`, `GetText`, `ChildCount`, `GetChild(i)`, `GetNamedChild('name')`.
- **`aWriter`** — Ausgabe schreiben. Wichtige Methoden:
  - `Write(text)` — Text an die aktuelle Zeile anhängen
  - `Writeln(text)` — Text schreiben und neue Zeile beginnen
  - `NewLine` — Zeilenumbruch einfügen
  - `DoIndent` / `DoUnIndent` — Einrückung erhöhen / verringern
  - `BeginAlignment` / `ColWrite` / `EndAlignment` — tabellarische Ausrichtung
- **`aHost`** — Host-Dienste:
  - `Dispatch(node)` — Kind-Knoten zurück an den Formatter delegieren
  - `ApplyCase('keyword')` — konfigurierte Keyword-Schreibweise anwenden
  - `NormalizeUnitName('name')` — Unit-Namen normalisieren
  - `LookupBuiltinType('Integer')` — eingebaute Typ-Aliase wie im Host auflösen
- **`aRules`** — Die aktuellen Formatierungsregeln (nur lesen)

## Optionaler erweiterter Host-Zugriff

Die meisten Plugins brauchen nur die vier Interfaces oben. Für fortgeschrittene
In-Process-Szenarien exportiert das SDK zusätzlich:

- `IPluginNodeHostAccess.GetRawNodeInterface`
- `IPluginWriterHostAccess.GetRawWriterInterface`

Damit kann ein Plugin die rohen Host-Interfaces hinter `aNode` und `aWriter`
anfordern. Das ist optional und für normale externe DLL-Plugins nicht nötig.

## Schritt 3: Pflicht- und empfohlene Exports

Jedes Plugin **muss** `GetPluginVersion` exportieren:

```pascal
function GetPluginVersion: Integer; stdcall;
begin
  Result := PLUGIN_API_VERSION;  // aus PluginSDK.pas
end;
```

Zusätzlich **sollte** ein Plugin `GetPluginName` exportieren, damit der Host
einen lesbaren Namen anzeigen kann:

```pascal
function GetPluginName: WideString; stdcall;
begin
  Result := 'MeinPlugin';
end;
```

> `GetPluginName` ist optional — bestehende Plugins ohne diesen Export
> funktionieren weiterhin.

## Schritt 4: Kompilieren und bereitstellen

1. DLL kompilieren
2. In das Plugin-Verzeichnis des DSF legen
3. Der Formatter erkennt und lädt das Plugin automatisch

## Tipps

- **Klein anfangen**: Nur eine Funktion überschreiben (z.B. `DoUses`) und
  den Formatter alles andere erledigen lassen
- **`Dispatch` nutzen**: Wenn das Plugin Kind-Knoten nicht speziell behandeln
  will, `aHost.Dispatch(childNode)` aufrufen — der Formatter übernimmt
- **`False` zurückgeben**: Wenn die Funktion zur Laufzeit entscheidet, den
  Knoten doch nicht zu behandeln, `False` zurückgeben — der Formatter
  nutzt dann seine Default-Logik
- **Beispiele ansehen**: `FormatterPlugin.SampleImpl.pas` enthält alle 37
  Funktionen als Referenz. `FrankPlugin.DoUses.pas` zeigt ein reales
  Uses-Formatierungs-Plugin
- **Named-Child-Helfer nutzen**: `PluginSDK.pas` enthält jetzt Konstanten wie
  `cSubCondition`, `cSubInheritance`, `cSubGenerics` sowie Hilfsfunktionen wie
  `SubBranchName`, `SubDeclareName` und `SubParamName`

## Verfügbare Do*-Funktionen

| Funktion | AST-Knoten | Beschreibung |
|----------|-----------|-------------|
| `DoFile` | Datei-Root | Top-Level-Container |
| `DoUnit` | `unit` | Unit-Deklaration |
| `DoProgram` | `program` | Programm-Deklaration |
| `DoSection` | `interface` / `implementation` | Abschnitts-Header |
| `DoUses` | `uses` | Uses-Klausel |
| `DoClass` | `class` | Klassen-Deklaration |
| `DoRecord` | `record` | Record-Deklaration |
| `DoInterface` | `interface` (COM) | Interface-Deklaration |
| `DoMethod` | procedure/function | Methoden-Deklaration |
| `DoBlock` | `begin..end` | Code-Block |
| `DoIf` | `if..then..else` | If-Anweisung |
| `DoCase` | `case..of` | Case-Anweisung |
| `DoFor` | `for..do` | For-Schleife |
| `DoWhile` | `while..do` | While-Schleife |
| `DoRepeat` | `repeat..until` | Repeat-Schleife |
| `DoWith` | `with..do` | With-Anweisung |
| `DoTry` | `try..except/finally` | Ausnahmebehandlung |
| ... | ... | und 19 weitere — siehe `PluginSDK.pas` |
