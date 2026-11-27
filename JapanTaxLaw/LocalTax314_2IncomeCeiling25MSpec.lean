import JapanTaxLaw.LocalTax314_2IncomeCeiling25M

/-
# LocalTax314_2IncomeCeiling25MSpec — independent spec for 地方税法 Num 314_2/2

Needle 「市町村は、前年の合計所得金額が二千五百万円以下である所得割の納税義務者については、その者の前年の所得について算定した総所得金額、退職所得金額又は山林所得金額から、次の各号に掲げる場合の区分に応じ、当該各号に定める金額を控除するものとする。」.
The implementation uses `income ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `income ≤ 25000000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax314_2IncomeCeiling25M

open JapanTaxLaw.TaxFinance

def specInScope (income : Nat) : Prop := income ≤ 25000000

theorem agree_scope (income : Nat) : inScope income ↔ specInScope income := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax314_2IncomeCeiling25M
