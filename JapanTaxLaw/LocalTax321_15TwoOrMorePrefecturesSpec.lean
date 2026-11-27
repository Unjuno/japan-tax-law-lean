import JapanTaxLaw.LocalTax321_15TwoOrMorePrefectures

/-
# LocalTax321_15TwoOrMorePrefecturesSpec — independent spec for 地方税法 Num 321_15/1

Needle 「前条第六項の通知に係る同条第一項の市町村長の処分に不服がある関係市町村長は、道府県知事（関係市町村が二以上の道府県に係るときは、総務大臣）に対し、決定を求める旨を申し出ることができる。」.
The implementation uses `threshold <= prefectures`; the independent spec states
the statutory INCLUSIVE lower bound as `2 <= prefectures`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax321_15TwoOrMorePrefectures

open JapanTaxLaw.TaxFinance

def specInScope (prefectures : Nat) : Prop := 2 <= prefectures

theorem agree_scope (prefectures : Nat) : inScope prefectures ↔ specInScope prefectures := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax321_15TwoOrMorePrefectures
