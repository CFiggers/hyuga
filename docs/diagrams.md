# Hyuga project structure diagrams

This document contains a series of [Mermaid](https://mermaid.js.org/) diagrams visually documenting the structure of Hyuga, along with some accompanying description/commentary.

## High-level module dependency map

The following diagram shows high-level module dependencies in the Hyuga project. Arrows indicate "imports" or "depends upon", as in: 

`(importing module) --depends upon--> (imported module)`

For simplicity, external module imports (which notably include hy, hyrule, lsprotocol, and pygls) are not shown. Also, nearly every module loads the `logging` and `sym.helper` modules. For simplicity of the diagram, those two "common" modules are not shown below.

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

    server:::orange
    lspspec:::blue
    api:::orange
    version:::blue
    cursor:::blue
    global:::blue

    subgraph sym
        sym.loader:::orange
        sym.doc:::purple
        sym.dummy:::purple
        sym.filter:::purple
        sym.summary:::purple
    end

    subgraph uri
        uri.helper:::violet
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

## Top-level Modules

### `__main__.py`

Hyuga's entry point is the [`main`](/hyuga/__main__.py#L7) function in [`__main__.py`](/hyuga/__main__.py).

That function, which is called at the bottom of `__main__/py` (only if `__name__` = `"__main__"`), parses command line arguments using `argparse` and checks whether the `--version` flag has been passed to the program at the command line. 
    If so, it prints a version string and exits.
    Otherwise, it calls the [`start`](/hyuga/server.hy#114) function from [`server.hy`](/hyuga/server.hy), which initiates the LSP.

#### `main()` function

```mermaid
%%{init: {"look": "handDrawn"} }%%
graph TD

%% Style Classes
classDef violet stroke:#862e9c
classDef purple stroke:#5f3dc4
classDef indigo stroke:#364fc7
classDef blue stroke:#1864ab
classDef green stroke:#5c940d
classDef orange stroke:#e67700
classDef red stroke:#8b0000

%% Nodes

main("main()"):::red
parseargs("parse arguments"):::blue
decision{"--version flag?"}:::blue
showversion["Print version info"]:::blue
exit(["exit"]):::blue

subgraph server
    start[["(start)"]]:::orange
end

%% Relationships


main --> parseargs --> decision -->|yes| showversion --> exit
                       decision -->|no| start

```


### `server.hy`

[`server.hy`](/hyuga/server.hy), as well as defining several functions of its own, imports [lsprotocol](), [pygls](), and the other modules in Hyuga. 

```mermaid
---
title: (start) function
config:
    look: handDrawn
---
graph TD

%% Style Classes
classDef violet stroke:#862e9c
classDef purple stroke:#5f3dc4
classDef indigo stroke:#364fc7
classDef blue stroke:#1864ab
classDef green stroke:#5c940d
classDef orange stroke:#e67700
classDef red stroke:#8b0000

%% Nodes

start("(start)"):::red
logging("initialize logging"):::blue
server.io("($SERVER.start_io)"):::orange

%% Relationships

start --> logging --> server.io

```

The most important feature of `server.hy` is the `$SERVER` object, which is a `LanguageServer` as defined by the [pygls]() library.

```mermaid
---
title: $SERVER Object
---
classDiagram

class LanguageServer["LanguageServer (from pygls)"]{
    ClientCapabilities client_capabilities
    ServerCapabilities server_capabilities
    Progress work_done_progress
    Workspace workspace
    start_io()
}

class SERVER["$SERVER"]{
    +TEXT_DOCUMENT_COMPLETION #160;(completion)
    +TEXT_DOCUMENT_HOVER      #160;(hover)
    +TEXT_DOCUMENT_DEFINITION #160;(definition)
    +TEXT_DOCUMENT_DID_OPEN   #160;(did-open)
    +TEXT_DOCUMENT_DID_CLOSE  #160;(did-close)
    +TEXT_DOCUMENT_DID_CHANGE #160;(did-change)
}

LanguageServer <|-- SERVER

%% classDef violet stroke:#862e9c
%% classDef purple stroke:#5f3dc4
%% classDef indigo stroke:#364fc7
%% classDef blue stroke:#1864ab
%% classDef green stroke:#5c940d
%% classDef orange stroke:#e67700
%% classDef red stroke:#8b0000


```

The following symbols are defined by [lsprotocol]() in `lsprotocol.types`:

- TEXT_DOCUMENT_COMPLETION
- TEXT_DOCUMENT_HOVER
- TEXT_DOCUMENT_DEFINITION
- TEXT_DOCUMENT_DID_OPEN
- TEXT_DOCUMENT_DID_CLOSE
- TEXT_DOCUMENT_DID_CHANGE


### `api.hy`


### `cursor.hy`


### `global.hy`


### `lspspec.hy`


```mermaid
---
config:
    look: handDrawn
---
graph TD

%% Style Classes
classDef violet stroke:#862e9c
classDef purple stroke:#5f3dc4
classDef indigo stroke:#364fc7
classDef blue stroke:#1864ab
classDef green stroke:#5c940d
classDef orange stroke:#e67700
classDef red stroke:#8b0000

%% Nodes

cll("(create-location-list) 
     → [Location]"):::red

subgraph id ["->>"]
    direction LR
    input([input]):::blue
    cl("map (create-location) 
        → Location"):::blue
    dl("(distinct-locations) 
        → [Location]"):::blue
    list:::blue
end

%% Relationships

cll --> id

input --> cl --> dl --> list

```

```mermaid
---
config:
    look: handDrawn
---
graph TD

%% Style Classes
classDef violet stroke:#862e9c
classDef purple stroke:#5f3dc4
classDef indigo stroke:#364fc7
classDef blue stroke:#1864ab
classDef green stroke:#5c940d
classDef orange stroke:#e67700
classDef red stroke:#8b0000

%% Nodes

ccl("(create-completion-list) -> CompletionList"):::red

%% Relationships


```

```mermaid
---
config:
    look: handDrawn
---
graph TD

%% Style Classes
classDef violet stroke:#862e9c
classDef purple stroke:#5f3dc4
classDef indigo stroke:#364fc7
classDef blue stroke:#1864ab
classDef green stroke:#5c940d
classDef orange stroke:#e67700
classDef red stroke:#8b0000

%% Nodes

ch("(create-hover) -> Hover"):::red

%% Relationships


```


### `version.hy`


### `log.hy`


## `sym` Modules

### `sym/loader.hy`


### `sym/filter.hy`


### `sym/dummy.hy`


### `sym/doc.hy`


### `sym/helper.hy`


## `uri` Modules

### `uri/helper.hy`


