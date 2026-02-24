# FDK-Formatter Plugin SDK

**Version 0.5 Alpha**

> 🇬🇧 [English Version](README.md)

Das **FDK-Formatter Plugin SDK** ermöglicht es, eigene Formatierungs-Plugins für den
[FDK Delphi Source Code Formatter](https://delphiprofi.de) zu schreiben.
Ein Plugin ist eine gewöhnliche Windows-DLL, die eine oder mehrere `Do*`-Funktionen
exportiert. Der Formatter ruft diese Funktionen anstelle seiner eingebauten Logik
auf — damit hat man volle Kontrolle darüber, wie bestimmte Sprachkonstrukte
formatiert werden.

## Hauptmerkmale

- **Ein-Datei-SDK** — nur `PluginSDK.pas` wird benötigt
- **37 überschreibbare Formatierungsfunktionen** — von `DoUses` bis `DoIf` bis `DoMethod`
- **DLL-grenzsichere Typen** — `WideString`, `LongBool`, COM-Interfaces (`stdcall`)
- **Keine Host-Abhängigkeiten** — Plugins linken nur gegen das SDK, nicht gegen den Formatter
- **Selektives Überschreiben** — nur die Funktionen exportieren, die man ändern will;
  alles andere fällt auf das Default-Verhalten des Formatters zurück
- **Kompatibel** mit Delphi, Free Pascal, C++ und C#

## Repository-Struktur

```
SDK/
  PluginSDK.pas              — das SDK (die einzige Datei, die ein Plugin braucht)
Examples/
  FormatterPlugin.dpr        — Beispiel-DLL-Projekt (alle 37 Do*-Funktionen)
  FormatterPlugin.SampleImpl.pas  — Referenz-Implementierung
  FrankPlugin.dpr            — Minimal-Plugin (überschreibt nur DoUses)
  FrankPlugin.DoUses.pas     — Frank-Style Uses-Formatierung
Doc/
  GETTING-STARTED.md         — Kurzanleitung (Englisch)
  GETTING-STARTED.de.md      — Kurzanleitung (Deutsch)
```

## Schnellstart

1. `SDK/PluginSDK.pas` ins eigene Projekt kopieren
2. Ein `library`-Projekt (DLL) erstellen
3. `GetPluginVersion` (Pflicht) und die gewünschten `Do*`-Funktionen exportieren
4. Kompilieren und die DLL dort ablegen, wo der FDK-Formatter sie findet

Siehe [Doc/GETTING-STARTED.de.md](Doc/GETTING-STARTED.de.md) für eine ausführliche Anleitung.

## So funktioniert es

Der FDK-Formatter parst Delphi-Quellcode in einen abstrakten Syntaxbaum (AST).
Bei der Ausgabe prüft der Formatter für jeden Knotentyp, ob ein Plugin die
entsprechende `Do*`-Funktion exportiert. Falls ja, wird die Plugin-Funktion
mit vier Parametern aufgerufen:

| Parameter | Beschreibung |
|-----------|-------------|
| `aNode: IPluginNode` | Der AST-Knoten (Typ, Text, Kinder) |
| `aWriter: IPluginWriter` | Ausgabe-Writer (Write, Writeln, NewLine, Indent, Alignment) |
| `aHost: IPluginHost` | Host-Dienste (Dispatch, ApplyCase, NormalizeUnitName) |
| `aRules: PPluginRules` | Aktuelle Formatierungsregeln (Einrückung, Abstände, etc.) |

Rückgabe `True` = Plugin hat den Knoten verarbeitet. `False` = Formatter
verwendet sein Default-Verhalten.

## Lizenz

MIT-Lizenz — siehe [LICENSE.md](LICENSE.md)

## Status

⚠️ **Alpha** — Die API kann sich noch ändern. Feedback ist willkommen!

