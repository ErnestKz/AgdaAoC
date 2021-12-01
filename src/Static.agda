{-# OPTIONS --allow-exec #-}

-- Embed a file as a string inside of an agda program.
-- To use this, make sure to add '/bin/cat' to '~/.agda/executables'

module Static where

open import Function

open import Data.Unit
open import Data.Product
open import Data.Nat

open import Data.List
open import Data.String

open import Relation.Binary.PropositionalEquality

open import Reflection

postulate
  execTC : (exe : String) (args : List String) (stdIn : String)
         → TC (Σ ℕ (λ _ → Σ String (λ _ → String)))

{-# BUILTIN AGDATCMEXEC execTC #-}

macro
  file-contents : String → Term → TC ⊤
  file-contents path hole = do
    (exitCode , (stdOut , stdErr)) ← execTC "cat" (path ∷ []) ""
    case exitCode of λ
      { zero → unify hole (lit (string stdOut))
      ; _ → typeError (strErr "file-contents failed:" ∷ strErr stdErr ∷ [])
      }

-- example : String
-- example = file-contents "./inputs/a.txt"
