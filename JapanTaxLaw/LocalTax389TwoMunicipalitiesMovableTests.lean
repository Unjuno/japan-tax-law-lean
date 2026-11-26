import JapanTaxLaw.LocalTax389TwoMunicipalitiesMovableSpec

/- Kernel-decided boundary checks for 「総務省令で定める船舶、車両その他の移動性償却資産又は可動性償却資産で二以上の市町村にわたつて使用されるもののうち総務大臣が指定するもの」. -/
namespace JapanTaxLaw.LocalTax389TwoMunicipalitiesMovable

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : inScope 2 := by unfold inScope threshold; decide
example : inScope 3 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 2 = true := by decide
example : inScopeBool 3 = true := by decide
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax389TwoMunicipalitiesMovable
