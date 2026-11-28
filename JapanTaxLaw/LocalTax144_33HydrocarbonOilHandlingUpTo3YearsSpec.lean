import JapanTaxLaw.LocalTax144_33HydrocarbonOilHandlingUpTo3Years

/-
# LocalTax144_33HydrocarbonOilHandlingUpTo3YearsSpec — independent spec for 地方税法 Num 144_33/3

Needle 「第一項の犯罪に係る炭化水素油について、情を知つてこれを運搬し、保管し、有償若しくは無償で取得し、又は処分の媒介若しくはあつせんをしたときは、その違反行為をした者は、三年以下の拘禁刑若しくは三百万円以下の罰金に処し、又はこれを併科する。」.
The implementation uses `years <= 3`; this independent spec states the
statutory INCLUSIVE boundary as `years <= 3`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax144_33HydrocarbonOilHandlingUpTo3Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 3

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax144_33HydrocarbonOilHandlingUpTo3Years
