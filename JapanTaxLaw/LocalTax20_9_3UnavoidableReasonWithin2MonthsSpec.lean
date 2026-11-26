import JapanTaxLaw.LocalTax20_9_3UnavoidableReasonWithin2Months

/-
# LocalTax20_9_3UnavoidableReasonWithin2MonthsSpec — independent spec for 地方税法 Num 20_9_3(2)

Needle 「その他当該地方税の法定納期限後に生じた前二号に類する政令で定めるやむを得ない理由があるとき。　当該理由が生じた日の翌日から起算して二月以内」.
The implementation uses `≤ threshold months`; the independent spec states the same
inclusive bound as `≤ 2 months`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax20_9_3UnavoidableReasonWithin2Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months ≤ 2

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax20_9_3UnavoidableReasonWithin2Months
