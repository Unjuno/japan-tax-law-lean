import JapanTaxLaw.LocalTax73_27_6RealEstateTaxDeferralWithin5YearsSpec

/- Kernel-decided boundary checks for 「道府県は、不動産の取得に対して課する不動産取得税を賦課徴収する場合において、当該不動産の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から五年以内の期間（当該不動産が同項に規定する土地改良事業に係るものである場合には、同日から同項に規定する一年を経過する日までの期間）を限つて、当該不動産に係る不動産取得税額を徴収猶予するものとする。」. -/
namespace JapanTaxLaw.LocalTax73_27_6RealEstateTaxDeferralWithin5Years

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

end JapanTaxLaw.LocalTax73_27_6RealEstateTaxDeferralWithin5Years
