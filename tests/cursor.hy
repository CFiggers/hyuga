(require hyrule * :readers *)

(import pytest)
; (import toolz.itertoolz [first])
; (import toolz)

(import lsprotocol.types [DidOpenTextDocumentParams
                          TextDocumentItem])

(import hyuga.server *)
(import hyuga.cursor *)
(import fixture [fixture-syms])

#_(defn [(pytest.mark.parametrize
        #("params" "uri" "ln" "expected")
        #(#((DidOpenTextDocumentParams
             :text-document
             (TextDocumentItem
              :language-id "hy"
              :text ""
              :version 1
              :uri "file:///home/cfigg/projects/hy/hyuga/tests/resources/sample-code.hy"))
            "file:///home/cfigg/projects/hy/hyuga/tests/resources/sample-code.hy"
            1
            "(import re)\n")))]
  test_cursor-line
  [params uri ln expected]
  ($SERVER.start_io)
  (print f"expected: { expected }")
  (print f"got:      { (cursor-line $SERVER uri ln) }")
  (assert (= (cursor-line $SERVER uri ln) expected)))