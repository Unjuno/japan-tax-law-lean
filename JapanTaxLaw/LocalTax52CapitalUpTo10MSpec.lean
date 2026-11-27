import JapanTaxLaw.LocalTax52CapitalUpTo10M

/-
# LocalTax52CapitalUpTo10MSpec — independent spec for 地方税法 Num 52/1

Needle 「ホ　資本金等の額を有する法人（法人税法別表第二に規定する独立行政法人で収益事業を行わないもの及びニに掲げる法人を除く。以下この表において同じ。）で資本金等の額が千万円以下であるもの」.
The implementation uses `amount <= threshold`; the independent spec states
the statutory INCLUSIVE upper bound as `amount <= 10000000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax52CapitalUpTo10M

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount <= 10000000

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax52CapitalUpTo10M
