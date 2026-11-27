import JapanTaxLaw.LocalTax321_15TwoOrMorePrefecturesSpec

/- Kernel-decided boundary checks for 「前条第六項の通知に係る同条第一項の市町村長の処分に不服がある関係市町村長は、道府県知事（関係市町村が二以上の道府県に係るときは、総務大臣）に対し、決定を求める旨を申し出ることができる。」. -/
namespace JapanTaxLaw.LocalTax321_15TwoOrMorePrefectures

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 2 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 3 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero (Prop)
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at (inclusive, Prop)
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax321_15TwoOrMorePrefectures
