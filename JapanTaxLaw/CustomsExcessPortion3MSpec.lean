import JapanTaxLaw.CustomsExcessPortion3M

/-!
# CustomsExcessPortion3MSpec — independent typed specification

Pinned source identical to the implementation module (関税法 art. 12の3(3)
第三号). The threshold is restated as a plain `Nat` literal read independently
from 「三百万」 and the comparison is expressed in the complementary form
(not (amount ≤ 3,000,000)) so the spec does not reuse the implementation's
`>` predicate. 超える is exclusive; the boundary 3,000,000 is false.
-/

namespace JapanTaxLaw.CustomsExcessPortion3M

/-- Independent restatement of 「三百万」 (yen). -/
def specThreshold : Nat := 3000000

/-- Independent formulation: not (amount ≤ 3,000,000). -/
def specIsExcess (amount : Nat) : Bool :=
  if amount <= 3000000 then false else true

example : specThreshold = 3000000 := by decide
example : specIsExcess 0 = false := by decide
example : specIsExcess 2_999_999 = false := by decide
example : specIsExcess 3_000_000 = false := by decide
example : specIsExcess 3_000_001 = true := by decide
example : specIsExcess 10_000_000 = true := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeCustomsExcessPortion3M : Bool :=
  let amounts := [0, 1, 2_999_999, 3_000_000, 3_000_001, 10_000_000]
  (excessThreshold == specThreshold) &&
    amounts.all fun a => isExcess a == specIsExcess a

example : agreeCustomsExcessPortion3M = true := by decide

end JapanTaxLaw.CustomsExcessPortion3M
