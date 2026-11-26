import JapanTaxLaw.LocalTax453FalseReportFine300k

/-
# LocalTax453FalseReportFine300kSpec — independent spec for 地方税法 Num 453(1)

Needle 「前条の規定により申告し、又は報告すべき事項について虚偽の申告又は報告をしたときは、その違反行為をした者は、三十万円以下の罰金に処する。」.
The implementation uses `yen ≤ threshold`; the independent spec states
the 三十万円以下 upper ceiling on the fine as `yen ≤ 300000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax453FalseReportFine300k

open JapanTaxLaw.TaxFinance

def specInScope (yen : Nat) : Prop := yen ≤ 300000

theorem agree_scope (yen : Nat) : inScope yen ↔ specInScope yen := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax453FalseReportFine300k
