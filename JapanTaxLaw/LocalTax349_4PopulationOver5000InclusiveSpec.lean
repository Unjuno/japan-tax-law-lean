import JapanTaxLaw.LocalTax349_4PopulationOver5000Inclusive

/-
# LocalTax349_4PopulationOver5000InclusiveSpec — independent spec for 地方税法 Num 349_4/1

Needle 「人口五千人以上一万人未満の市町村」.
The implementation uses `5_000 <= population`; this independent spec states the
statutory INCLUSIVE boundary as `5_000 <= population`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax349_4PopulationOver5000Inclusive

open JapanTaxLaw.TaxFinance

def specInScope (population : Nat) : Prop := 5_000 <= population

theorem agree_scope (population : Nat) : inScope population ↔ specInScope population := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax349_4PopulationOver5000Inclusive
