{-# OPTIONS --allow-exec #-}

module Day1 where

open import Static

open import Data.String using (String; lines)
open import Data.List using (List; _∷_; [])
open import Prelude.Nat
open import Prelude.Int
open import Prelude.Bool
open import Prelude.Ord

input : List String
input = lines (file-contents "../inputs/1_1")

sol : List Nat -> Nat
sol [] = 0
sol (x ∷ []) = 0
sol (x1 ∷ (x2 ∷ [])) with (x1 <? x2)
... | true =  1
... | false =  0
sol (x1 ∷ (x2 ∷ xs)) with (x1 <? x2)
... | true  = 1 +N (sol (x2 ∷ xs))
... | false = 0 +N (sol (x2 ∷ xs))
