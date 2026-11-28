import JapanTaxLaw.LocalTax37_2PriorPeriodWithin4YearsSpec

/- Kernel-decided boundary checks for 「都道府県等が指定対象期間の初日前四年以内（当該都道府県等が指定を受けていた期間に限る。次号において「特定期間」という。）において前各号に掲げる基準のうち適合すべきこととされていたものに適合していなかつた事実がないこと（当該事実により既に第五項の規定による指定の取消し（以下この条において「指定の取消し」という。）を受けた場合を除く。）。」. -/
namespace JapanTaxLaw.LocalTax37_2PriorPeriodWithin4Years

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 3 = true := by decide  -- threshold_below
example : inScopeBool 4 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 5 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 4 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 5 := by unfold inScope; decide  -- outside (Prop)
example : inScope 4 ↔ specInScope 4 := agree_scope 4
example (years : Nat) : inScope years ↔ specInScope years := agree_scope years

end JapanTaxLaw.LocalTax37_2PriorPeriodWithin4Years
