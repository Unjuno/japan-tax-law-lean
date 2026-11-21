import JapanTaxLaw.DependentAgeSupport
import JapanTaxLaw.DependentAgeSupportSpec

/-
# DependentAgeSupportTests — kernel-decided boundary checks for 329AC0000000149 art. 2

Every closed check below is a Nat/Bool expression discharged by `by decide` (or
`by rfl`); the general impl/spec bridges are universal omega theorems from the
spec module. Coverage: ages 0/1/20/21/22 (二十一歳 未満/以上 STRICT vs INCLUSIVE),
support 499/500/501 per 1000 (十分の五 = 5/10), total = 0 (undefined ratio),
small inputs, Nat saturating-subtraction boundaries, and impl/spec agreement.
-/

namespace JapanTaxLaw.DependentAgeSupport

-- (a) age: 0, 1 and 20 are 二十一歳未満 -> automatically dependent.
example : isDependentChild 0 = true := by decide
example : isDependentChild 1 = true := by decide
example : isDependentChild 20 = true := by decide

-- (b) age: 21 and 22 are NOT 未満 (STRICT < 21).
example : isDependentChild 21 = false := by decide
example : isDependentChild 22 = false := by decide

-- (c) support 499/1000 is below 十分の五 (5/10).
example : supportRatioMet 499 1000 = false := by decide
example : isDependentAdultChild 21 499 1000 = false := by decide

-- (d) support 500/1000 is exactly 5/10: 「以上」 is INCLUSIVE -> qualifies.
example : supportRatioMet 500 1000 = true := by decide
example : isDependentAdultChild 21 500 1000 = true := by decide

-- (e) support 501/1000 is above 5/10.
example : supportRatioMet 501 1000 = true := by decide
example : isDependentAdultChild 21 501 1000 = true := by decide

-- (f) total = 0: the ratio is undefined, so the support test is false.
example : supportRatioMet 1 0 = false := by decide
example : supportRatioMet 0 0 = false := by decide
example : isDependentAdultChild 21 500 0 = false := by decide
example : isDependentAdultChild 0 0 0 = false := by decide

-- (g) small positive inputs: exact cross-multiplication at 5/10.
-- 1/2 is exactly 5/10, so the INCLUSIVE >= test passes (true).
example : supportRatioMet 1 2 = true := by decide
example : supportRatioMet 1 1 = true := by decide
example : isDependentAdultChild 21 1 2 = true := by decide
example : isDependentAdultChild 21 1 1 = true := by decide
-- 1/3 < 5/10, so the test fails (false).
example : supportRatioMet 1 3 = false := by decide

-- (h) Nat identity / saturation boundaries at the statutory numerals.
example : 21 - 21 = 0 := by decide
example : 0 + 0 = 0 := by decide
example : 10 * 499 - 5 * 1000 = 0 := by decide
example : 10 * 500 - 5 * 1000 = 0 := by decide
example : 10 * 501 - 5 * 1000 = 10 := by decide

-- (i) impl/spec agreement at concrete points.
example : isDependentChild 20 = specUnderAge 20 := by decide
example : isDependentChild 21 = specUnderAge 21 := by decide
example : supportRatioMet 499 1000 = specSupportMet 499 1000 := by decide
example : supportRatioMet 500 1000 = specSupportMet 500 1000 := by decide
example : isDependentAdultChild 21 500 1000 = specAdultChild 21 500 1000 := by decide
example : specAge = 21 := by decide
example : specNum = 5 := by decide
example : specDen = 10 := by decide

-- (j) impl/spec agreement for every Nat input (universal omega bridges).
example (a : Nat) : isDependentChild a = specUnderAge a := by
  exact agreeUnderAge a
example (b t : Nat) : supportRatioMet b t = specSupportMet b t := by
  exact agreeSupportMet b t
example (a b t : Nat) : isDependentAdultChild a b t = specAdultChild a b t := by
  exact agreeAdultChild a b t

end JapanTaxLaw.DependentAgeSupport
