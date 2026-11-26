import JapanTaxLaw.LocalTax72_55TwoPrefectureIndividualSpec

/- Kernel-decided boundary checks for 「二以上の道府県に事務所又は事業所を設けて事業を行う個人」. -/
namespace JapanTaxLaw.LocalTax72_55TwoPrefectureIndividual

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at (以上 inclusive)
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- threshold_below
example : inScopeBool 2 = true := by decide  -- threshold_at
example : inScopeBool 3 = true := by decide  -- threshold_above
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_55TwoPrefectureIndividual
