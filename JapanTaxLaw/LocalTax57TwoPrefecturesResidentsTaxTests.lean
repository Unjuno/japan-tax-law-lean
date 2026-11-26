import JapanTaxLaw.LocalTax57TwoPrefecturesResidentsTaxSpec

/- Kernel-decided boundary checks for 「（二以上の道府県において事務所又は事業所を有する法人の道府県民税の申告納付）」. -/
namespace JapanTaxLaw.LocalTax57TwoPrefecturesResidentsTax

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 1 = false := by decide  -- threshold_below
example : inScopeBool 2 = true := by decide  -- threshold_at
example : inScopeBool 3 = true := by decide  -- threshold_above
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax57TwoPrefecturesResidentsTax
