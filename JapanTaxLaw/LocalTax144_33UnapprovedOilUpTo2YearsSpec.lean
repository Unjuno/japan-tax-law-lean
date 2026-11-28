import JapanTaxLaw.LocalTax144_33UnapprovedOilUpTo2Years

/-
# LocalTax144_33UnapprovedOilUpTo2YearsSpec — independent spec for 地方税法 Num 144_33/4

Needle 「前条第一項の規定に違反して道府県知事の承認を受けないで同項第三号若しくは第四号の行為を行つたとき、又は偽りその他不正の手段により同項の承認を受けたときは、その違反行為をした者は、二年以下の拘禁刑又は百万円以下の罰金に処する。」.
The implementation uses `years <= 2`; this independent spec states the
statutory INCLUSIVE boundary as `years <= 2`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax144_33UnapprovedOilUpTo2Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 2

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax144_33UnapprovedOilUpTo2Years
