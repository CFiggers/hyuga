# `server.hy` function diagrams and documentation

[`server.hy`](/hyuga/server.hy), as well as defining several functions of its own, imports [lsprotocol](), [pygls](https://github.com/openlawlibrary/pygls), and the other modules in Hyuga. 

The most important feature of `server.hy` is the `$SERVER` object, which is a `LanguageServer` as defined by the [pygls](https://github.com/openlawlibrary/pygls) library.

```mermaid
---
title: $SERVER object diagram
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

## `completion` function diagram

## `hover` function diagram

## `definition` function diagram

```mermaid
---
title: (definition) function diagram
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

definition[["(definition) 
             params → [Location] | None"]]:::red

params(["params"]):::blue

subgraph try
    cwa[["(cursor-word-all)
          $SERVER → ...params → str"]]:::orange
    logword("log word"):::blue
    wordisnone{"word = None?"}:::blue
    getmatches[["(get-matches)
                 word : str → ...$SERVER → ...params → [[sym val]]"]]:::orange
    getloclist[["(create-location-list)
                 [[sym val]] → [Location]"]]:::orange
    ret(["return [Location]"]):::green
    no(["return None"]):::green
end

subgraph except
    exception([exception]):::blue
    logerror[[log error]]:::blue
    raise("raise exception"):::red
end

%% Relationships

definition --> params --> try --> except

cwa --> logword --> wordisnone -->|yes| getmatches
                    wordisnone -->|no| no

getmatches --> getloclist --> ret

exception --> logerror --> raise

```

## `did-open` function diagram



## `did-close` function diagram



## `did-change` function diagram



## `start` function diagram

```mermaid
---
title: (start) function diagram
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

start[["(start)
        -> None"]]:::red
logging("initialize logging"):::blue
server.io[["($SERVER.start_io)
            -> None"]]:::violet
ret(["return None"]):::green

%% Relationships

start --> logging --> server.io --> ret

```
