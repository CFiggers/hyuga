(require hyrule * :readers *)

(import asyncio)
(import pytest)

(import lsprotocol.types [InitializeParams])

(import hyuga.server *)
(import fixture [fixture-syms])

#_(defn :async [pytest.fixture] 
  ls-server []
  (asyncio.create-task ($SERVER.start_io))
  (yield $SERVER)
  (await $SERVER.stop))

#_(defn :async [pytest.mark.asyncio] 
  test_initialize-request []
  (setv params (InitializeParams :process-id None 
                                 :root-uri None
                                 :capabilities {}))
  (setv response (await (ls-server.lsp.send-request "textDocument/Initialize" params)))
  
  (assert (is-not response.capabilities None)))