import JapanTaxLaw.SpecialMeasuresBracket10M80M

/-!
# SpecialMeasuresBracket10M80MSpec — independent typed specification

Pinned source identical to the implementation module (租税特別措置法 art.5 附則).
Both bounds are restated as plain `Nat` literals read independently from
「千万」 and 「八千万」. The interval uses complementary forms so the spec does not
reuse the implementation's predicates:
  lower: not (amount < 10,000,000); upper: not (80,000,000 <= amount).
以上 is inclusive; 未満 is exclusive.
-/

namespace JapanTaxLaw.SpecialMeasuresBracket10M80M

/-- Independent restatement of 「千万」 (yen). -/
def specLower : Nat := 10000000
/-- Independent restatement of 「八千万」 (yen). -/
def specUpper : Nat := 80000000

/-- Independent formulation of the bounded interval. -/
def specInBracket (amount : Nat) : Bool :=
  (if amount < 10000000 then false else true) &&
  (if 80000000 <= amount then false else true)

example : specLower = 10000000 := by decide
example : specUpper = 80000000 := by decide
example : specInBracket 0 = false := by decide
example : specInBracket 9_999_999 = false := by decide
example : specInBracket 10_000_000 = true := by decide
example : specInBracket 79_999_999 = true := by decide
example : specInBracket 80_000_000 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeSpecialMeasuresBracket10M80M : Bool :=
  let amounts := [0, 1, 9_999_999, 10_000_000, 79_999_999, 80_000_000, 80_000_001]
  (lowerBound == specLower) && (upperBound == specUpper) &&
    amounts.all fun a => inBracket a == specInBracket a

example : agreeSpecialMeasuresBracket10M80M = true := by decide

end JapanTaxLaw.SpecialMeasuresBracket10M80M