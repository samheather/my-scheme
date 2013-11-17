#lang eopl
(define-datatype bintree bintree?
  (leaf-node
   (num integer?))
  (interior-node
   (key symbol?)
   (left bintree?)
   (right bintree?)))

(define a (interior-node 'a (leaf-node 3) (interior-node 'b (leaf-node 4) (leaf-node 5))))
;(define a (interior-node 'a (leaf-node 3) (interior-node ('b (leaf-node 5) (leaf-node 7)))))