# `__main__.py` function diagrams and documentation

Hyuga's entry point is the [`main`](/hyuga/__main__.py#L7) function in [`__main__.py`](/hyuga/__main__.py).

That function, which is called at the bottom of `__main__/py` (only if `__name__` = `"__main__"`), parses command line arguments using `argparse` and checks whether the `--version` flag has been passed to the program at the command line. 
    If so, it prints a version string and exits.
    Otherwise, it calls the [`start`](/hyuga/server.hy#114) function from [`server.hy`](/hyuga/server.hy), which initiates the LSP.

## `main()` function

```mermaid
---
title: (main) function diagram
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