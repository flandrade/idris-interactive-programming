-- Notes to show interactive programming with Idris
-- Examples from Edwin Brady's presentation at Code Mesh 2020
-- Dependent Type Driven Program Synthesis in Idris
-- https://youtu.be/brjFqXkUQv0

--- REPEAT AN ELEMENT
-- Step by step

-- 1. Add type definitions
rep_1 : Nat -> a -> List a

-- 2. Add clause (command: Add Clause - over rep) and inspect hole (command: Type Of)
rep_2 : Nat -> a -> List a
rep_2 k x = ?rep_rhs_2

-- 3. Add case (command: Case Split - over k)
rep_3 : Nat -> a -> List a
rep_3 0 x = ?rep_rhs_4
rep_3 (S k) x = ?rep_rhs_5

-- 4. Expression search (command: Proof Search - over rep_rhs_6)
rep_4 : Nat -> a -> List a
rep_4 0 x = []
rep_4 (S k) x = ?rep_rhs_7

-- 4. Manually complete
rep_5 : Nat -> a -> List a
rep_5 0 x = []
rep_5 (S k) x = x :: rep_5 k x

--- REPEAT AN ELEMENT
-- One step

-- 1. Add definitions
rep_6 : Nat -> a -> List a

-- 1. Generate definitions (command: Generate Definition)
rep_7 : Nat -> a -> List a
rep_7 0 x = []
rep_7 (S k) x = x :: rep_7 k x


--- APPEND
-- One step

-- 1. Generate definitions (command: Generate Definition)
append : List a -> List a -> List a
append [] ys = ys
append (x :: xs) ys = x :: append xs ys


-- DEPENDENT TYPES
-- Example from André Videla
-- https://youtu.be/txJiuDM2gUM

ReturnType : Bool -> Type
ReturnType True = String
ReturnType False = Int

-- Use "Add Clause" + "Case Split" + "Type Of"
depends : (b : Bool) -> ReturnType b
depends False = 1
depends True = "UCM"
