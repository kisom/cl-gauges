;;;; api calls

(in-package :gauges)
(defparameter *api-key* "")
(defparameter *api-base* "https://secure.gaug.es")

(defun auth-header (&optional (key *api-key*))
  `(("X-Gauges-Token" . ,key)))

(defmacro make-api-request (name method endpoint)
  `(defun ,name (&rest body)
     (let ((api-result
            (drakma:http-request (format nil "~A/~A" *api-base* ,endpoint)
                                 :method ,method
                                 :additional-headers (auth-header)
                                 :parameters body)))
       (json:decode-json-from-string
        (typecase api-result
          (string api-result)
          (otherwise (babel:octets-to-string api-result)))))))

(defun authenticate (key)
  (setf *api-key* key))
