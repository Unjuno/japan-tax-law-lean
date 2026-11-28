import JapanTaxLaw.LocalTax18_2TwoYearSuspensionSpec

/- Kernel-decided boundary checks for 「地方税の徴収権で、偽りその他不正の行為によりその全部若しくは一部の税額を免れ、又はその全部若しくは一部の税額の還付を受けた地方税（当該地方税に係る延滞金及び加算金を含む。以下この項において同じ。）に係るものの時効は、当該地方税の前条第一項に規定する法定納期限の翌日から起算して二年間は、進行しない。」. -/
namespace JapanTaxLaw.LocalTax18_2TwoYearSuspension

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input / threshold_below
example : inScopeBool 2 = true := by decide  -- threshold_at (INCLUSIVE)
example : inScopeBool 3 = false := by decide  -- threshold_above
example : inScope 2 := by unfold inScope; decide  -- threshold_at (Prop, INCLUSIVE)
example : ¬ inScope 3 := by unfold inScope; decide  -- threshold_above (Prop)
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (years : Nat) : inScope years ↔ specInScope years := agree_scope years

end JapanTaxLaw.LocalTax18_2TwoYearSuspension
