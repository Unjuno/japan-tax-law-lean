import JapanTaxLaw.LocalTax292SpouseIncomeUpTo10M

/-
# LocalTax292SpouseIncomeUpTo10MSpec — independent spec for 地方税法 Num 292/1/8

Needle 「同一生計配偶者のうち、前年の合計所得金額が千万円以下である市町村民税の納税義務者の配偶者をいう。」.
The implementation uses `yen ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `yen ≤ 10000000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax292SpouseIncomeUpTo10M

open JapanTaxLaw.TaxFinance

def specInScope (yen : Nat) : Prop := yen ≤ 10000000

theorem agree_scope (yen : Nat) : inScope yen ↔ specInScope yen := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax292SpouseIncomeUpTo10M
