{-# OPTIONS --allow-exec #-}

module Day1 where

open import Static

open import Data.String
open import Data.List
open import Data.Nat
-- open import Prelude.String
-- open import Prelude.List
-- open import Prelude.Maybe
-- open import Prelude.Nat

input1 : String
input1 = file-contents "../inputs/1.1"

i : List String
i = lines input1

-- o : List Int -> Int
-- o i = snd (foldl (λ (prev, count), current → if (current > prev) then (current, count+1) else (prev, count)) (0, 0))


