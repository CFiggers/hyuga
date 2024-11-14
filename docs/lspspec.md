# `lspspec.hy` function diagrams and documentation

## `fix-dummy` function diagram


## `decide-kind-by-summary` function diagram


## `decide-kind-by-type` function diagram


## `decide-kind` function diagram

## `create-item` function diagram

```mermaid
---
title: (create-item) function diagram
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

ci[["(create-items) 
      word -> full-sym/dic -> CompletionItem]"]]:::red

word([word]):::blue
root-uri([root-uri]):::blue
doc-uri([doc-uri]):::blue
ret(["return CompletionList"]):::green

%% Relationships

ci --> root-uri --> doc-uri --> ret

```

## `create-items` function diagram

```mermaid
---
title: (create-items) function diagram
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

ci[["(create-items) 
      word -> root-uri -> doc-uri -> [CompletionItem]"]]:::red

word([word]):::blue
root-uri([root-uri]):::blue
doc-uri([doc-uri]):::blue
ret(["return [CompletionItem]"]):::green

%% Relationships

ci --> root-uri --> doc-uri --> ret

```

## `create-completion-list` function diagram

```mermaid
---
title: (create-completion-list) function diagram
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

ccl[["(create-completion-list) 
      items -> [is-incomplete False] -> CompletionList"]]:::red

items([items]):::blue
is-incomplete(["[is-incomplete False]"]):::blue
log("log count of items"):::blue
cl[["(CompletionList)
     is-incomplete -> items -> CompletionList"]]:::violet
ret(["return CompletionList"]):::green

%% Relationships

ccl --> items --> is-incomplete --> log --> cl --> ret

```


## `create-hover` function diagram

```mermaid
---
title: (create-hover) function diagram
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

ch[["(create-hover) 
     -> Hover"]]:::red

docs([docs]):::blue
hover[["(Hover docs)
        docs -> Hover"]]:::violet
ret(["return Hover"]):::green


%% Relationships

ch --> docs --> hover --> ret

```

## `create-location` function diagram

```mermaid
---
title: (create-location) function diagram
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

cl[["(create-location) 
     pos -> uri -> Location"]]:::red

pos([pos : tuple]):::blue
uri([uri : string]):::blue

obj-pos["obj-pos : Position"]:::blue
obj-range["obj-range : Range"]:::blue

loc[["(Location)
       uri -> obj-range -> Location"]]:::violet
ret(["return Location"]):::green


%% Relationships

cl --> pos --> uri --> obj-pos --> obj-range --> loc --> ret

```

## `distinct-locations` function diagram 

```mermaid
---
title: (distinct-locations) function diagram
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

dl[["(distinct-locations) 
     [Location]  → [Location]"]]:::red
input(["items : [Location]"]):::blue
ret["ret : [Location]"]:::blue

subgraph id ["for [item items]"]
    %% direction LR
    
    if{item in ret?}:::blue
    put("add item to ret"):::blue
    continue(["continue"]):::blue
end

return(["return ret : [Location]"]):::green

%% Relationships

dl --> input --> ret --> id --> return

if -->|yes| continue
if -->|no| put --> continue

```

## `create-location-list` function diagram

```mermaid
---
title: (create-location-list) function diagram
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

cll[["(create-location-list) 
     [[sym val]]  → [Location]"]]:::red

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
