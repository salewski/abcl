(require :asdf)
(in-package :cl-user)

(asdf:defsystem jss
  :author "Alan Ruttenberg, Mark Evenson"
  :long-description "<urn:abcl.org/release/1.5.0/contrib/jss#>"
  :version "3.2.3" 
  :components ((:module base :pathname "" :serial t 
                        :components ((:file "packages")
                                     (:file "invoke")
                                     (:file "collections")
				     (:file "optimize-java-call")
                                     (:file "classpath")
				     (:file "transform-to-field")
                                     (:file "compat"))))
  :perform (asdf:test-op (op c)
                         (asdf:test-system :jss/tests)))


(asdf:defsystem jss/tests
  :defsystem-depends-on (quicklisp-abcl
                         prove-asdf)
  :depends-on (jss
               prove)
  :components ((:module tests
                        :pathname "" 
                        :components ((:test-file "jss-tests"))))
  :perform (asdf:test-op (op c)
                         (uiop:symbol-call :prove-asdf 'run-test-system c)))








   


