import JapanTaxLaw.LocalTax37ElderSpouseIncomeUpTo9500000Inclusive

/-
# LocalTax37ElderSpouseIncomeUpTo9500000InclusiveSpec — independent spec for 地方税法 Num 37/1

Needle 「（ｉｉ）　当該控除対象配偶者が老人控除対象配偶者である場合　十万円（当該納税義務者の前年の合計所得金額が九百万円を超え九百五十万円以下である場合には六万円、当該納税義務者の前年の合計所得金額が九百五十万円を超え千万円以下である場合には三万円）」.
The implementation uses `income <= 9_500_000`; this independent spec states the
statutory INCLUSIVE boundary as `income <= 9_500_000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax37ElderSpouseIncomeUpTo9500000Inclusive

open JapanTaxLaw.TaxFinance

def specInScope (income : Nat) : Prop := income <= 9_500_000

theorem agree_scope (income : Nat) : inScope income ↔ specInScope income := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax37ElderSpouseIncomeUpTo9500000Inclusive
