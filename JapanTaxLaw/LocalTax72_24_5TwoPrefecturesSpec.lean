import JapanTaxLaw.LocalTax72_24_5TwoPrefectures

/-
# LocalTax72_24_5TwoPrefecturesSpec — independent spec for 地方税法 Num 72_24_5(3)

Needle 「前項の場合においては、その区分計算の方法について、事務所又は事業所所在地の道府県知事（二以上の道府県において事務所又は事業所を設けて事業を行う法人にあつては、主たる事務所又は事業所所在地の道府県知事）の承認を受けなければならない。」.
The implementation uses `threshold ≤ prefectures`; the independent spec states the same
inclusive bound as `2 ≤ prefectures`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax72_24_5TwoPrefectures

open JapanTaxLaw.TaxFinance

def specInScope (prefectures : Nat) : Prop := 2 ≤ prefectures

theorem agree_scope (prefectures : Nat) : inScope prefectures ↔ specInScope prefectures := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_24_5TwoPrefectures
