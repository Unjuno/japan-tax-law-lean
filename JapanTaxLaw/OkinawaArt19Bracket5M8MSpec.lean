import JapanTaxLaw.OkinawaArt19Bracket5M8M

/-!
# OkinawaArt19Bracket5M8MSpec — independent typed specification

Pinned source identical to the implementation module (沖縄の復帰政令 art.19).
Both bounds are restated as plain `Nat` literals read independently from
「五百万」 and 「八百万」. The interval uses complementary forms so the spec does
not reuse the implementation's predicates:
  lower: not (amount < 5,000,000); upper: not (8,000,000 <= amount).
以上 is inclusive; 未満 is exclusive.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket5M8M

/-- Independent restatement of 「五百万」 (yen). -/
def specLower : Nat := 5000000
/-- Independent restatement of 「八百万」 (yen). -/
def specUpper : Nat := 8000000

/-- Independent formulation of the bounded interval. -/
def specInBracket (amount : Nat) : Bool :=
  (if amount < 5000000 then false else true) &&
  (if 8000000 <= amount then false else true)

example : specLower = 5000000 := by decide
example : specUpper = 8000000 := by decide
example : specInBracket 0 = false := by decide
example : specInBracket 4_999_999 = false := by decide
example : specInBracket 5_000_000 = true := by decide
example : specInBracket 7_999_999 = true := by decide
example : specInBracket 8_000_000 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeOkinawaArt19Bracket5M8M : Bool :=
  let amounts := [0, 1, 4_999_999, 5_000_000, 7_999_999, 8_000_000, 8_000_001]
  (lowerBound == specLower) && (upperBound == specUpper) &&
    amounts.all fun a => inBracket a == specInBracket a

example : agreeOkinawaArt19Bracket5M8M = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket5M8M
