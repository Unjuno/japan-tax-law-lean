import JapanTaxLaw.OkinawaArt19Bracket20M

/-!
# OkinawaArt19Bracket20MSpec — independent typed specification

Pinned source identical to the implementation module (沖縄の復帰政令 art.19).
The floor is restated as a plain `Nat` literal read independently from
「二千万」 and the comparison is expressed in the complementary form
(amount < 20,000,000) so the spec does not reuse the implementation's `>=`
predicate. 以上 is inclusive; the boundary 20,000,000 is true.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket20M

/-- Independent restatement of 「二千万」 (yen). -/
def specFloor : Nat := 20000000

/-- Independent formulation: not (amount < 20,000,000). -/
def specInTopBracket (amount : Nat) : Bool :=
  if amount < 20000000 then false else true

example : specFloor = 20000000 := by decide
example : specInTopBracket 0 = false := by decide
example : specInTopBracket 19_999_999 = false := by decide
example : specInTopBracket 20_000_000 = true := by decide
example : specInTopBracket 20_000_001 = true := by decide
example : specInTopBracket 100_000_000 = true := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeOkinawaArt19Bracket20M : Bool :=
  let amounts := [0, 1, 19_999_999, 20_000_000, 20_000_001, 100_000_000]
  (bracketFloor == specFloor) &&
    amounts.all fun a => inTopBracket a == specInTopBracket a

example : agreeOkinawaArt19Bracket20M = true := by decide

end JapanTaxLaw.OkinawaArt19Bracket20M
