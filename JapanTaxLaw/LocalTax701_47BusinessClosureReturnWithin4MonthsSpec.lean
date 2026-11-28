import JapanTaxLaw.LocalTax701_47BusinessClosureReturnWithin4Months

/-
# LocalTax701_47BusinessClosureReturnWithin4MonthsSpec — independent spec for 地方税法 Num 701_47/1

Needle 「事業所等において個人が行う事業に対して課する事業所税の納税義務者は、その年の翌年三月十五日までに（年の中途において事業を廃止した場合には、当該事業の廃止の日から一月以内（当該事業の廃止が納税義務者の死亡によるときは、四月以内）に）、個人に係る課税期間に係る事業所税の課税標準額及び税額その他必要な事項を記載した総務省令で定める様式による申告書を当該事業所等所在の指定都市等の長に提出するとともに、その申告した税額を当該指定都市等に納付しなければならない。」.
The implementation uses `months <= 4`; this independent spec states the
statutory INCLUSIVE boundary as `months <= 4`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax701_47BusinessClosureReturnWithin4Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months <= 4

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax701_47BusinessClosureReturnWithin4Months
