(import pytest)

(import hyuga.sym.doc *)
(import fixture [fixture-syms])

#_(defn [(pytest.mark.parametrize 
         #("sym_hy" "symtype" "scope" "uri" "expected")
         [#([True] [True] [True] [True]
            "     [True] [[True]]
        [True]

Built-in mutable sequence.

If no argument is given, the constructor creates a new empty list.
The argument must be an iterable if specified.")])]
  test_create-docs
  [sym-hy symtype scope uri expected fixture-syms]
  (print f"expected: { expected }")
  (print f"got:      { (create-docs sym-hy symtype scope uri) }")
  (assert (= (create-docs sym-hy symtype scope uri) expected)))
