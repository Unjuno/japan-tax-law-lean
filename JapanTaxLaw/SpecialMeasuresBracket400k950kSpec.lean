import JapanTaxLaw.SpecialMeasuresBracket400k950k

/-!
# SpecialMeasuresBracket400k950kSpec — independent typed specification

Pinned source identical to the implementation module (租税特別措置法 art. 5).
Both bounds are restated as plain `Nat` literals read independently from
「四十万」 and 「九十五万」. The interval is expressed in complementary forms
so the spec does not reuse the implementation's predicates:
  lower: not (amount < 400,000); upper: not (950,000 ≤ amount).
以上 is inclusive; 未満 is exclusive.
-/

namespace JapanTaxLaw.SpecialMeasuresBracket400k950k

/-- Independent restatement of 「四十万」 (yen). -/
def specLower : Nat := 400000
/-- Independent restatement of 「九十五万」 (yen). -/
def specUpper : Nat := 950000

/-- Independent formulation of the bounded interval. -/
def specInBracket (amount : Nat) : Bool :=
  (if amount < 400000 then false else true) &&
  (if 950000 <= amount then false else true)

example : specLower = 400000 := by decide
example : specUpper = 950000 := by decide
example : specInBracket 0 = false := by decide
example : specInBracket 399_999 = false := by decide
example : specInBracket 400_000 = true := by decide
example : specInBracket 949_999 = true := by decide
example : specInBracket 950_000 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeSpecialMeasuresBracket400k950k : Bool :=
  let amounts := [0, 1, 399_999, 400_000, 949_999, 950_000, 950_001]
  (lowerBound == specLower) && (upperBound == specUpper) &&
    amounts.all fun a => inBracket a == specInBracket a

example : agreeSpecialMeasuresBracket400k950k = true := by decide

end JapanTaxLaw.SpecialMeasuresBracket400k950k
