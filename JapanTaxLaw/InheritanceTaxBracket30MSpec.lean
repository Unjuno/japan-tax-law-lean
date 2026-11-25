import JapanTaxLaw.InheritanceTaxBracket30M

/-!
# InheritanceTaxBracket30MSpec — independent typed specification

Pinned source identical to the implementation module (相続税法 art. 21の7).
The threshold is restated as a plain `Nat` literal read independently from
「三千万」 and the comparison is expressed in the complementary form
(not (amount ≤ 30,000,000)) so the spec does not reuse the implementation's
`>` predicate. 超える is exclusive; the boundary 30,000,000 is false.
-/

namespace JapanTaxLaw.InheritanceTaxBracket30M

/-- Independent restatement of 「三千万」 (yen). -/
def specThreshold : Nat := 30000000

/-- Independent formulation: not (amount ≤ 30,000,000). -/
def specExceeds (amount : Nat) : Bool :=
  if amount <= 30000000 then false else true

example : specThreshold = 30000000 := by decide
example : specExceeds 0 = false := by decide
example : specExceeds 29_999_999 = false := by decide
example : specExceeds 30_000_000 = false := by decide
example : specExceeds 30_000_001 = true := by decide
example : specExceeds 100_000_000 = true := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeInheritanceTaxBracket30M : Bool :=
  let amounts := [0, 1, 29_999_999, 30_000_000, 30_000_001, 100_000_000]
  (bracketThreshold == specThreshold) &&
    amounts.all fun a => exceedsBracket a == specExceeds a

example : agreeInheritanceTaxBracket30M = true := by decide

end JapanTaxLaw.InheritanceTaxBracket30M
