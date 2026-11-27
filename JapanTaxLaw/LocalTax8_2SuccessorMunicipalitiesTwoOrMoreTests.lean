import JapanTaxLaw.LocalTax8_2SuccessorMunicipalitiesTwoOrMoreSpec

/- Kernel-decided boundary checks for 「前項の規定によつて消滅市町村の徴収金に係る権利を承継する承継市町村が二以上ある場合において、当該承継市町村がそれぞれ承継すべき当該消滅市町村の徴収金に係る権利について当該承継市町村の長の間において意見を異にし、その協議がととのわないときは、道府県知事（当該承継市町村が二以上の道府県の区域にわたる場合においては、総務大臣）に対し、その決定を求める旨を申し出なければならない。」. -/
namespace JapanTaxLaw.LocalTax8_2SuccessorMunicipalitiesTwoOrMore

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax8_2SuccessorMunicipalitiesTwoOrMore
