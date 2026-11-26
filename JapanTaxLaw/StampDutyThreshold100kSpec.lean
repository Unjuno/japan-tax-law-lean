import JapanTaxLaw.StampDutyThreshold100k

/-!
# StampDutyThreshold100kSpec — independent typed specification

Pinned source identical to the implementation module (印紙税法 art. 4).
The threshold is restated as a plain `Nat` literal read independently from
「十万」 and the comparison is expressed in the complementary form
(not (amount ≤ 100,000)) so the spec does not reuse the implementation's
`>` predicate. 超える is exclusive; the boundary 100,000 is false.
-/

namespace JapanTaxLaw.StampDutyThreshold100k

/-- Independent restatement of 「十万」 (yen). -/
def specThreshold : Nat := 100000

/-- Independent formulation: not (amount ≤ 100,000). -/
def specExceeds (amount : Nat) : Bool :=
  if amount <= 100000 then false else true

example : specThreshold = 100000 := by decide
example : specExceeds 0 = false := by decide
example : specExceeds 99_999 = false := by decide
example : specExceeds 100_000 = false := by decide
example : specExceeds 100_001 = true := by decide
example : specExceeds 1_000_000 = true := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeStampDutyThreshold100k : Bool :=
  let amounts := [0, 1, 99_999, 100_000, 100_001, 1_000_000]
  (threshold == specThreshold) &&
    amounts.all fun a => exceedsThreshold a == specExceeds a

example : agreeStampDutyThreshold100k = true := by decide

end JapanTaxLaw.StampDutyThreshold100k
