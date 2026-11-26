import JapanTaxLaw.NationalTaxSmallBracket500k

/-!
# NationalTaxSmallBracket500kSpec — independent typed specification

Pinned source identical to the implementation module (国税通則法 art. 66(3)
第一号). The cap is restated as a plain `Nat` literal read independently from
「五十万」 and the comparison is expressed in the complementary form
(500,000 < amount) so the spec does not reuse the implementation's `<=`
predicate. 以下 is inclusive; the boundary 500,000 is true.
-/

namespace JapanTaxLaw.NationalTaxSmallBracket500k

/-- Independent restatement of 「五十万」 (yen). -/
def specCap : Nat := 500000

/-- Independent formulation: not (500,000 < amount). -/
def specInSmallBracket (amount : Nat) : Bool :=
  if 500000 < amount then false else true

example : specCap = 500000 := by decide
example : specInSmallBracket 0 = true := by decide
example : specInSmallBracket 499_999 = true := by decide
example : specInSmallBracket 500_000 = true := by decide
example : specInSmallBracket 500_001 = false := by decide
example : specInSmallBracket 1_000_000 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeNationalTaxSmallBracket500k : Bool :=
  let amounts := [0, 1, 499_999, 500_000, 500_001, 1_000_000]
  (bracketCap == specCap) &&
    amounts.all fun a => inSmallBracket a == specInSmallBracket a

example : agreeNationalTaxSmallBracket500k = true := by decide

end JapanTaxLaw.NationalTaxSmallBracket500k
