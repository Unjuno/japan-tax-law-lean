import JapanTaxLaw.LocalTax603CollectionDeferralWithin5YearsSpec

/- Kernel-decided boundary checks for 「市町村長は、土地の所有者等から前二項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該土地の取得の日から五年以内で政令で定める期間を限つて、当該土地に係る特別土地保有税に係る地方団体の徴収金の徴収を猶予するものとする。」. -/
namespace JapanTaxLaw.LocalTax603CollectionDeferralWithin5Years

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 4 = true := by decide  -- threshold_below
example : inScopeBool 5 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 6 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope threshold; decide  -- zero (Prop)
example : inScope 5 := by unfold inScope threshold; decide  -- threshold_at (inclusive, Prop)
example : inScope 5 ↔ specInScope 5 := agree_scope 5
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax603CollectionDeferralWithin5Years
