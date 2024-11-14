# Hyuga project structure diagrams

This document contains a series of [Mermaid](https://mermaid.js.org/) diagrams visually documenting the structure of Hyuga, along with some accompanying description/commentary.

## High-level module dependency map

The following diagram shows high-level module dependencies in the Hyuga project. Arrows indicate "imports" or "depends upon", as in: 

`(importing module) —depends upon→ (imported module)`

For simplicity, external module imports (which notably include [hy](https://hylang.org/), [hyrule](https://hylang.org/hyrule/doc/v0.7.0), [lsprotocol](https://github.com/microsoft/lsprotocol), and [pygls](https://github.com/openlawlibrary/pygls)) are not shown. Also, nearly every module loads the `logging` and `sym.helper` modules. For simplicity of the diagram, those two "common" modules are not shown below.

`server`, `api`, and `sym.loader` are the most important modules in the project, so they are color-coded orange.

```mermaid
%%{init: {"flowchart": {"defaultRenderer": "elk"},
          "look": "handDrawn"} }%%
graph TD

%% Style Classes
classDef violet stroke:#862e9c
classDef purple stroke:#5f3dc4
classDef indigo stroke:#364fc7
classDef blue stroke:#1864ab
classDef green stroke:#5c940d
classDef orange stroke:#e67700
classDef red stroke:#8b0000

%% Entities
root("#95;#95;main#95;#95;"):::red

    server("`**server**`"):::orange
    lspspec:::blue
    api("`**api**`"):::orange
    version:::blue
    cursor:::blue
    global:::blue

    subgraph sym
        sym.loader("`**sym.loader**`"):::orange
        sym.doc:::purple
        sym.dummy:::purple
        sym.filter:::purple
        sym.summary:::purple
    end

    subgraph uri
        uri.helper:::indigo
    end

%% Relationships
root --> server
root --> version

server --> api
server --> version
server --> sym.loader
server --> cursor
server --> lspspec

lspspec --> api

api --> global
api --> sym.loader

sym.loader --> sym.doc
sym.loader --> sym.dummy
sym.loader --> sym.filter
sym.loader --> sym.summary

sym.loader --> uri.helper

```

## Module Documentation ToC

Function diagrams and documentation for individual modules can be found on the following pages:

- [\_\_main\_\_.py](__main__.md)
- [api.hy](api.md)
- [cursor.hy](cursor.md)
- [global.hy](global.md)
- [log.hy](log.md)
- [lspspec.hy](lspspec.md)
- [server.hy](server.md)
- [version.hy](version.md)
- [`sym` submodule](sym/index.md)
  - [doc.hy](sym/doc.md)
  - [dummy.hy](sym/dummy.md)
  - [filter.hy](sym/filter.md)
  - [helper.hy](sym/helper.md)
  - [loader.hy](sym/loader.md)
  - [summary.hy](sym/summary.md)
- [`uri` submodule](uri/index.md)
  - [helper.hy](uri/helper.md)
