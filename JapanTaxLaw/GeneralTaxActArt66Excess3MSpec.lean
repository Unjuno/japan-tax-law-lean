import JapanTaxLaw.GeneralTaxActArt66Excess3M

/-!
# GeneralTaxActArt66Excess3MSpec — independent typed specification

Pinned source identical to the implementation module (国税通則法 art.66(3)(3)).
The threshold is restated as a plain `Nat` literal read independently from
「三百万」. The excess is expressed in the complementary form (if the threshold
is at least the amount, the excess is zero) so the spec does not reuse the
implementation's `amount > threshold` predicate. The boundary 3,000,000 is
strictly excluded.
-/

namespace JapanTaxLaw.GeneralTaxActArt66Excess3M

/-- Independent restatement of 「三百万」 (yen). -/
def specThreshold : Nat := 3000000

/-- Independent formulation: if 3,000,000 >= amount then 0 else amount - 3,000,000. -/
def specExcess (amount : Nat) : Nat :=
  if 3000000 >= amount then 0 else amount - 3000000

example : specThreshold = 3000000 := by decide
example : specExcess 0 = 0 := by decide
example : specExcess 2_999_999 = 0 := by decide
example : specExcess 3_000_000 = 0 := by decide
example : specExcess 3_000_001 = 1 := by decide
example : specExcess 5_000_000 = 2_000_000 := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeGeneralTaxActArt66Excess3M : Bool :=
  let amounts := [0, 1, 2_999_999, 3_000_000, 3_000_001, 5_000_000, 10_000_000]
  (threshold == specThreshold) &&
    amounts.all fun a => excessPortion a == specExcess a

example : agreeGeneralTaxActArt66Excess3M = true := by decide

end JapanTaxLaw.GeneralTaxActArt66Excess3M
