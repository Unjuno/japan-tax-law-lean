import JapanTaxLaw.OwnershipOverHalf

/-!
# Independent spec — art. 31(4)一 strict >50% test

The spec restates strict excess as the negation of the non-strict comparison.
Agreement is universal over every share-count pair.
-/
namespace JapanTaxLaw.OwnershipOverHalf

def specWithinHalf (ownedShares totalShares : Nat) : Bool :=
  decide (ownedShares * percentBase <= thresholdPercent * totalShares)

theorem agree_spec_impl (ownedShares totalShares : Nat) :
    specWithinHalf ownedShares totalShares = (!exceedsHalf ownedShares totalShares) := by
  unfold specWithinHalf exceedsHalf
  by_cases h : thresholdPercent * totalShares < ownedShares * percentBase
  · have hn : ¬ ownedShares * percentBase <= thresholdPercent * totalShares := Nat.not_le.mpr h
    simp [h, hn]
  · have hle : ownedShares * percentBase <= thresholdPercent * totalShares := Nat.le_of_not_gt h
    simp [h, hle]

example : specWithinHalf 50 100 = true := by decide
example : specWithinHalf 51 100 = false := by decide

end JapanTaxLaw.OwnershipOverHalf
