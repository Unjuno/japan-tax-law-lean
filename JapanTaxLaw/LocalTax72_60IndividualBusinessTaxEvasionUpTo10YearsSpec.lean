import JapanTaxLaw.LocalTax72_60IndividualBusinessTaxEvasionUpTo10Years

/-
# LocalTax72_60IndividualBusinessTaxEvasionUpTo10YearsSpec — independent spec for 地方税法 Num 72_60/1

Needle 「偽りその他不正の行為により個人の行う事業に対する事業税の全部又は一部を免れたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」.
The implementation uses `years <= 10`; this independent spec states the
statutory INCLUSIVE boundary as `years <= 10`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax72_60IndividualBusinessTaxEvasionUpTo10Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 10

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax72_60IndividualBusinessTaxEvasionUpTo10Years
