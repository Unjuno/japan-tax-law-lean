import JapanTaxLaw.LocalTax312CapitalUpTo10MInclusive

/-
# LocalTax312CapitalUpTo10MInclusiveSpec — independent spec for 地方税法 Num 312/1

Needle 「二　資本金等の額を有する法人で資本金等の額が千万円以下であるもののうち、従業者数の合計数が五十人を超えるもの」.
The implementation uses `capital <= 10_000_000`; this independent spec states the
statutory INCLUSIVE boundary as `capital <= 10_000_000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax312CapitalUpTo10MInclusive

open JapanTaxLaw.TaxFinance

def specInScope (capital : Nat) : Prop := capital <= 10_000_000

theorem agree_scope (capital : Nat) : inScope capital ↔ specInScope capital := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax312CapitalUpTo10MInclusive
