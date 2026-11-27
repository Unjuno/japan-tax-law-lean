import JapanTaxLaw.LocalTax72_66DemandNoticeWithin20Days

/-
# LocalTax72_66DemandNoticeWithin20DaysSpec — independent spec for 地方税法 Num 72_66/1

Needle 「納税者が納期限（法人の行う事業に対する事業税について更正又は決定があつた場合においては、不足税額の納期限をいう。以下法人の行う事業に対する事業税について同じ。）までに事業税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 20`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax72_66DemandNoticeWithin20Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 20

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_66DemandNoticeWithin20Days
