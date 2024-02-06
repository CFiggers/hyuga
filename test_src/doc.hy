(require hyrule * :readers *)
(import hyrule.collections *)

(defn fn-sample
  []
  (print "hy!"))

(setv str-sample "sample value")
(setv int-sample 123)
(setv dict-sample {:key 12345})

(defmacro macro-sample
  []
  `[1])

(import matplotlib.pyplot [hist show])
