(import logging)
(import logging.handlers [RotatingFileHandler])
(import traceback)
(import os.path)
(import tempfile)

(setv logger (logging.getLogger "hyuga"))
(let [handler (RotatingFileHandler :filename (os.path.join (tempfile.gettempdir) "hyuga.log")
                                   :maxBytes 1000000
                                   :backupCount 2)]
  (.setLevel logger logging.DEBUG)
  (.setFormatter handler (logging.Formatter "%(levelname)-9s %(asctime)s [%(name)s] %(message)s"))
  (logger.addHandler handler))

(defn error-trace
  [logfn fname e]
  "TODO: doc"
  (let [tb (.join "" (traceback.format_exc))]
    (logfn f"{fname}: error e={e}\n----- stacktrace -----\n{tb}\n----- stacktrace end -----")))

(defn log-error
  [fname e]
  (error-trace logger.error fname e))

(defn log-warn
  [fname e]
  (error-trace logger.warning fname e))
