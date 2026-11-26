import JapanTaxLaw.OkinawaArt19Bracket1M2M

/-!
# OkinawaArt19Bracket1M2MSpec — independent typed specification

Pinned source identical to the implementation module (沖縄の復帰政令 art.19).
Both bounds are restated as plain `Nat` literals read independently from
「百万」 and 「二百万」. The interval is expressed in complementary forms so the
spec does not reuse the implementation's predicates:
  lower: not (amount < 1,000,000); upper: not (2,000,000 ≤ amount).
以上 is inclusive; 未満 is exclusive.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket1M2M

/-- Independent restatement of 「百万」 (yen). -/
def specLower : Nat := 1000000
/-- Independent restatement of 「二百万」 (yen). -/
def specUpper : Nat := 2000000

/-- Independent formulation of the bounded interval. -/
def specInBracket (amount : Nat) : Bool :=
  (if amount < 1000000 then false else true) &&
  (if 2000000 <= amount then false else true)

example : specLower = 1000000 := by decide
example : specUpper = 2000000 := by decide
example : specInBracket 0 = false := by decide
example : specInBracket 999_999 = false := by decide
example : specInBracket 1_000_000 = true := by decide
example : specInBracket 1_999_999 = true := by decide
example : specInBracket 2_000_000 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeOkinawaArt19Bracket1M2M : Bool :=
  let amounts := [0, 1, 999_999, 1_000_000, 1_999_999, 2_000_000, 2_000_001]
  (lowerBound == specLower) && (upperBound == specUpper) &&
    amounts.all fun a => inBracket a == specInBracket a

example : agreeOkinawaArt19Bracket1M2M = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket1M2M
