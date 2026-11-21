import JapanTaxLaw.MaxLengthMultiplier115
import JapanTaxLaw.MaxLengthMultiplier115Spec

/-
# MaxLengthMultiplier115Tests — kernel-decided checks for 登録免許税法施行令 第二十一条

Pinned source: law 342CO0000000146, revision 342CO0000000146_20261001_507CO0000000124,
  data/raw/342CO0000000146_20261001_507CO0000000124.law.json,
  sha256 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b.
Every closed check below is a Nat/Bool expression discharged by `by decide`.
Coverage: exact 1.15x (115/100), just above/below, before=0 guard, small inputs,
Nat cross-multiplication identity/saturation, and impl/spec agreement (concrete
points plus the universal commutativity bridge).
-/

namespace JapanTaxLaw.MaxLengthMultiplier115

-- (a) exactly 1.15x: (after=115, before=100) passes the INCLUSIVE ceiling.
example : withinLengthLimit 115 100 = true := by decide
example : specWithin 115 100 = true := by decide

-- (b) just above / just below the ceiling at before=100.
example : withinLengthLimit 116 100 = false := by decide
example : withinLengthLimit 114 100 = true := by decide
example : specWithin 116 100 = false := by decide
example : specWithin 114 100 = true := by decide

-- (c) before=0 guard: with before=0 only after=0 passes.
example : withinLengthLimit 0 0 = true := by decide
example : withinLengthLimit 1 0 = false := by decide
example : specWithin 0 0 = true := by decide
example : specWithin 1 0 = false := by decide

-- (d) small inputs: after <= before implies after <= 1.15 * before.
example : withinLengthLimit 0 1 = true := by decide
example : withinLengthLimit 1 1 = true := by decide
example : withinLengthLimit 2 2 = true := by decide
example : withinLengthLimit 11 10 = true := by decide
example : withinLengthLimit 12 10 = false := by decide
example : withinLengthLimit 13 10 = false := by decide

-- (e) statutory constants and 115/100 sanity witness.
example : multiplierNumer = 115 := by decide
example : multiplierDenom = 100 := by decide
example : multiplierNumer * 100 = 115 * multiplierDenom := by decide
example : specNum = 115 := by decide
example : specDen = 100 := by decide

-- (f) Nat cross-multiplication identity and saturation boundaries.
example : 100 * 115 = 115 * 100 := by decide
example : 100 * 115 - 115 * 100 = 0 := by decide
example : 100 * 0 = 0 := by decide

-- (g) impl/spec agreement at concrete points (kernel-decided).
example : withinLengthLimit 115 100 = specWithin 115 100 := by decide
example : withinLengthLimit 116 100 = specWithin 116 100 := by decide
example : withinLengthLimit 114 100 = specWithin 114 100 := by decide
example : withinLengthLimit 0 0 = specWithin 0 0 := by decide
example : withinLengthLimit 1 0 = specWithin 1 0 := by decide

-- (h) impl/spec agreement for every Nat input (universal commutativity bridge).
example (after before : Nat) : withinLengthLimit after before = specWithin after before := by
  exact agreeWithin after before

end JapanTaxLaw.MaxLengthMultiplier115
