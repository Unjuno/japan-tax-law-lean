import JapanTaxLaw.LocalTax73_27_2HousingTaxDeferralWithin6MonthsSpec

/- Kernel-decided boundary checks for 「道府県は、住宅の取得に対して課する不動産取得税を賦課徴収する場合において、当該住宅の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から六月以内の期間を限つて、当該住宅に係る不動産取得税額のうち同項の規定により減額すべき額に相当する税額を徴収猶予するものとする。」. -/
namespace JapanTaxLaw.LocalTax73_27_2HousingTaxDeferralWithin6Months

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 5 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 6 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 7 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 5 = true := by decide  -- bool
example : inScopeBool 6 = true := by decide  -- bool
example : inScopeBool 7 = false := by decide  -- bool
example : inScope 6 ↔ specInScope 6 := agree_scope 6
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax73_27_2HousingTaxDeferralWithin6Months
