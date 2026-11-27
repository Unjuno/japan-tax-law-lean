import JapanTaxLaw.LocalTax73_24TwoYearNewHouseCondition

/-
# LocalTax73_24TwoYearNewHouseConditionSpec — independent spec for 地方税法 Num 73_24/1/1

Needle 「土地を取得した日から二年以内に当該土地の上に特例適用住宅が新築された場合（当該取得をした者（以下この号において「取得者」という。）が当該土地を当該特例適用住宅の新築の時まで引き続き所有している場合又は当該特例適用住宅の新築が当該取得者から当該土地を取得した者により行われる場合に限る。）」.
The implementation uses `years ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `years ≤ 2`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax73_24TwoYearNewHouseCondition

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years ≤ 2

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax73_24TwoYearNewHouseCondition
