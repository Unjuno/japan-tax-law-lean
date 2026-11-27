import JapanTaxLaw.OkinawaArt19Bracket10M15M

/-!
# OkinawaArt19Bracket10M15MSpec — independent typed specification

Pinned source identical to the implementation module (沖縄の復帰政令 art.19).
Both bounds are restated as plain `Nat` literals read independently from
「千万」 and 「千五百万」. The interval uses complementary forms so the spec does
not reuse the implementation's predicates:
  lower: not (amount < 10,000,000); upper: not (15,000,000 <= amount).
以上 is inclusive; 未満 is exclusive.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket10M15M

/-- Independent restatement of 「千万」 (yen). -/
def specLower : Nat := 10000000
/-- Independent restatement of 「千五百万」 (yen). -/
def specUpper : Nat := 15000000

/-- Independent formulation of the bounded interval. -/
def specInBracket (amount : Nat) : Bool :=
  (if amount < 10000000 then false else true) &&
  (if 15000000 <= amount then false else true)

example : specLower = 10000000 := by decide
example : specUpper = 15000000 := by decide
example : specInBracket 0 = false := by decide
example : specInBracket 9_999_999 = false := by decide
example : specInBracket 10_000_000 = true := by decide
example : specInBracket 14_999_999 = true := by decide
example : specInBracket 15_000_000 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeOkinawaArt19Bracket10M15M : Bool :=
  let amounts := [0, 1, 9_999_999, 10_000_000, 14_999_999, 15_000_000, 15_000_001]
  (lowerBound == specLower) && (upperBound == specUpper) &&
    amounts.all fun a => inBracket a == specInBracket a

example : agreeOkinawaArt19Bracket10M15M = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket10M15M
