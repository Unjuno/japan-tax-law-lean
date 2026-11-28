import JapanTaxLaw.LocalTax349_4PopulationOver35000Inclusive

/-
# LocalTax349_4PopulationOver35000InclusiveSpec — independent spec for 地方税法 Num 349_4/1

Needle 「人口三万五千人未満の場合には十二億八千万円、人口三万五千人以上の場合には十二億八千万円に人口三万人から計算して人口五千人を増すごとに八千万円を加算した額」.
The implementation uses `35_000 <= population`; this independent spec states the
statutory INCLUSIVE boundary as `35_000 <= population`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax349_4PopulationOver35000Inclusive

open JapanTaxLaw.TaxFinance

def specInScope (population : Nat) : Prop := 35_000 <= population

theorem agree_scope (population : Nat) : inScope population ↔ specInScope population := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax349_4PopulationOver35000Inclusive
