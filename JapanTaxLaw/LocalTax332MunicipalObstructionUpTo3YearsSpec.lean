import JapanTaxLaw.LocalTax332MunicipalObstructionUpTo3Years

/-
# LocalTax332MunicipalObstructionUpTo3YearsSpec — independent spec for 地方税法 Num 332/1

Needle 「市町村民税の納税者又は特別徴収義務者が滞納処分の執行を免れる目的でその財産を隠蔽し、損壊し、若しくは市町村の不利益に処分し、その財産に係る負担を偽つて増加する行為をし、又はその現状を改変して、その財産の価額を減損し、若しくはその滞納処分に係る滞納処分費を増大させる行為をしたときは、その者は、三年以下の拘禁刑若しくは二百五十万円以下の罰金に処し、又はこれを併科する。」.
The implementation uses `years <= 3`; this independent spec states the
statutory INCLUSIVE boundary as `years <= 3`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax332MunicipalObstructionUpTo3Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 3

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax332MunicipalObstructionUpTo3Years
