import JapanTaxLaw.LocalTax73_18ReportWithin10Days

/-
# LocalTax73_18ReportWithin10DaysSpec — independent spec for 地方税法 Num 73_18/4

Needle 「市町村長は、前項の規定による申告書若しくは報告書を受け取つた場合又は自ら不動産の取得の事実を発見した場合には、その日から十日以内に当該申告書若しくは報告書を道府県知事に送付し、又は当該取得の事実を通知するものとする。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 10`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax73_18ReportWithin10Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 10

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax73_18ReportWithin10Days
