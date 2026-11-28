import JapanTaxLaw.LocalTax163TaxEvasionUpTo5Years

/-
# LocalTax163TaxEvasionUpTo5YearsSpec — independent spec for 地方税法 Num 163/1

Needle 「偽りその他不正の行為により自動車税の全部又は一部を免れたときは、その違反行為をした者は、五年以下の拘禁刑若しくは百万円以下の罰金に処し、又はこれを併科する。」.
The implementation uses `years <= 5`; this independent spec states the
statutory INCLUSIVE boundary as `years <= 5`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax163TaxEvasionUpTo5Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 5

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax163TaxEvasionUpTo5Years
