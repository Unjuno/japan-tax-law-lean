import JapanTaxLaw.OkinawaArt19Bracket600k1M

/-!
# OkinawaArt19Bracket600k1MSpec — independent typed specification

Pinned source identical to the implementation module (沖縄の復帰政令 art.19).
Both bounds are restated as plain `Nat` literals read independently from
「六十万」 and 「百万」. The interval is expressed in complementary forms so the
spec does not reuse the implementation's predicates:
  lower: not (amount < 600,000); upper: not (1,000,000 ≤ amount).
以上 is inclusive; 未満 is exclusive.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket600k1M

/-- Independent restatement of 「六十万」 (yen). -/
def specLower : Nat := 600000
/-- Independent restatement of 「百万」 (yen). -/
def specUpper : Nat := 1000000

/-- Independent formulation of the bounded interval. -/
def specInBracket (amount : Nat) : Bool :=
  (if amount < 600000 then false else true) &&
  (if 1000000 <= amount then false else true)

example : specLower = 600000 := by decide
example : specUpper = 1000000 := by decide
example : specInBracket 0 = false := by decide
example : specInBracket 599_999 = false := by decide
example : specInBracket 600_000 = true := by decide
example : specInBracket 999_999 = true := by decide
example : specInBracket 1_000_000 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeOkinawaArt19Bracket600k1M : Bool :=
  let amounts := [0, 1, 599_999, 600_000, 999_999, 1_000_000, 1_000_001]
  (lowerBound == specLower) && (upperBound == specUpper) &&
    amounts.all fun a => inBracket a == specInBracket a

example : agreeOkinawaArt19Bracket600k1M = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket600k1M
