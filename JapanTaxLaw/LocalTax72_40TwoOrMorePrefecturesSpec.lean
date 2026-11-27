import JapanTaxLaw.LocalTax72_40TwoOrMorePrefectures

/-
# LocalTax72_40TwoOrMorePrefecturesSpec — independent spec for 地方税法 Num 72_40/2

Needle 「二以上の道府県において事務所又は事業所を設けて事業を行う法人に係る法人税の課税標準について、前項の規定によつて税務官署に対しすべき更正又は決定の請求は、当該法人の主たる事務所又は事業所所在地の道府県知事（外国法人にあつては、この法律の施行地において行う事業の経営の責任者が主として執務する事務所又は事業所所在地の道府県知事）又は当該法人の主たる事務所又は事業所所在地の道府県知事を経由して関係道府県知事が行うものとする。」.
The implementation uses `threshold ≤ prefectures`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ prefectures`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax72_40TwoOrMorePrefectures

open JapanTaxLaw.TaxFinance

def specInScope (prefectures : Nat) : Prop := 2 ≤ prefectures

theorem agree_scope (prefectures : Nat) : inScope prefectures ↔ specInScope prefectures := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_40TwoOrMorePrefectures
