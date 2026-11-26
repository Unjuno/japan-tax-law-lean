import JapanTaxLaw.LocalTax72_55TwoPrefectureIndividual

/-
# LocalTax72_55TwoPrefectureIndividualSpec — independent spec for 地方税法 第七十二条の五十五(3)

Needle 「二以上の道府県に事務所又は事業所を設けて事業を行う個人」.
The independent spec states the inclusive prefecture-count floor directly as
`2 ≤ prefectures` from statutory literals only, with no implementation
identifier. Universal axiom-free bridge by `rfl`. 「以上」 is INCLUSIVE:
one prefecture is below the floor, two satisfies it.
-/
namespace JapanTaxLaw.LocalTax72_55TwoPrefectureIndividual

open JapanTaxLaw.TaxFinance

def specInScope (prefectures : Nat) : Prop := 2 ≤ prefectures

theorem agree_scope (prefectures : Nat) : inScope prefectures ↔ specInScope prefectures := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_55TwoPrefectureIndividual
