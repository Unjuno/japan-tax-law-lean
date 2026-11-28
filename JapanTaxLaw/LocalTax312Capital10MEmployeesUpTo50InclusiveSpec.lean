import JapanTaxLaw.LocalTax312Capital10MEmployeesUpTo50Inclusive

/-
# LocalTax312Capital10MEmployeesUpTo50InclusiveSpec — independent spec for 地方税法 Num 312/1

Needle 「ホ　資本金等の額を有する法人（法人税法別表第二に規定する独立行政法人で収益事業を行わないもの及びニに掲げる法人を除く。以下この表において同じ。）で資本金等の額が千万円以下であるもののうち、市町村内に有する事務所、事業所又は寮等の従業者（政令で定める役員を含む。）の数の合計数（次号から第九号まで及び第五項において「従業者数の合計数」という。）が五十人以下のもの」.
The implementation uses `capital <= 10_000_000`; this independent spec states the
statutory INCLUSIVE boundary as `capital <= 10_000_000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax312Capital10MEmployeesUpTo50Inclusive

open JapanTaxLaw.TaxFinance

def specInScope (capital : Nat) : Prop := capital <= 10_000_000

theorem agree_scope (capital : Nat) : inScope capital ↔ specInScope capital := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax312Capital10MEmployeesUpTo50Inclusive
