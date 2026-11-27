import JapanTaxLaw.LocalTax349_5TwoLargeAssetsMergerSpec

/- Kernel-decided boundary checks for 「この場合において、一の納税義務者が一の市町村の区域内において第一適用年度を同じくする二以上の新設大規模償却資産を所有するときは、これらの新設大規模償却資産を合わせて一の新設大規模償却資産とみなす。」. -/
namespace JapanTaxLaw.LocalTax349_5TwoLargeAssetsMerger

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax349_5TwoLargeAssetsMerger
