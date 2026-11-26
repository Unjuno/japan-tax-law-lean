import JapanTaxLaw.LocalTax314_2DisasterExpenseCeiling50k

/-
# LocalTax314_2DisasterExpenseCeiling50kSpec — independent spec for 地方税法 Num 314_2(1)

Needle 「損失の金額に含まれる災害関連支出の金額（損失の金額のうち災害に直接関連して支出をした金額として政令で定める金額をいう。以下この号において同じ。）が五万円以下である場合（災害関連支出の金額がない場合を含む。）」.
The implementation uses `≤ threshold expense`; the independent spec states the same
inclusive bound as `≤ 50000 expense`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax314_2DisasterExpenseCeiling50k

open JapanTaxLaw.TaxFinance

def specInScope (expense : Nat) : Prop := expense ≤ 50000

theorem agree_scope (expense : Nat) : inScope expense ↔ specInScope expense := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax314_2DisasterExpenseCeiling50k
