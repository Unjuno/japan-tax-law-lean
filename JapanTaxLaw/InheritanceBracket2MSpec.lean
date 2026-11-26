import JapanTaxLaw.InheritanceBracket2M

/-!
# InheritanceBracket2MSpec — independent typed specification

Pinned source identical to the implementation module (相続税法 art. 21の7).
The cap is restated as a plain `Nat` literal read independently from 「二百万」
and the comparison is expressed in the complementary form (2,000,000 < amount)
so the spec does not reuse the implementation's `<=` predicate. 以下 is
inclusive; the boundary 2,000,000 is true.
-/

namespace JapanTaxLaw.InheritanceBracket2M

/-- Independent restatement of 「二百万」 (yen). -/
def specCap : Nat := 2000000

/-- Independent formulation: not (2,000,000 < amount). -/
def specInBracket (amount : Nat) : Bool :=
  if 2000000 < amount then false else true

example : specCap = 2000000 := by decide
example : specInBracket 0 = true := by decide
example : specInBracket 1_999_999 = true := by decide
example : specInBracket 2_000_000 = true := by decide
example : specInBracket 2_000_001 = false := by decide
example : specInBracket 10_000_000 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeInheritanceBracket2M : Bool :=
  let amounts := [0, 1, 1_999_999, 2_000_000, 2_000_001, 10_000_000]
  (bracketCap == specCap) &&
    amounts.all fun a => inBracket a == specInBracket a

example : agreeInheritanceBracket2M = true := by decide

end JapanTaxLaw.InheritanceBracket2M
