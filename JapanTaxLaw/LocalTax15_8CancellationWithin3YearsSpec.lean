import JapanTaxLaw.LocalTax15_8CancellationWithin3Years

/-
# LocalTax15_8CancellationWithin3YearsSpec — independent spec for 地方税法 Num 15_8/1

Needle 「地方団体の長は、前条第一項各号の規定により滞納処分の執行を停止した後三年以内に、その停止に係る滞納者につき同項各号に該当する事実がないと認めるときは、その執行の停止を取り消さなければならない。」.
The implementation uses `years ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `years ≤ 3`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax15_8CancellationWithin3Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years ≤ 3

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax15_8CancellationWithin3Years
