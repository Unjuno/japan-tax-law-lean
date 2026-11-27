import JapanTaxLaw.LocalTax395FalseReturnFineCeiling500k

/-
# LocalTax395FalseReturnFineCeiling500kSpec — independent spec for 地方税法 art. 395(1)

Needle 「前条の規定により申告すべき事項について申告をせず、又は虚偽の申告をしたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」.
The implementation uses `fine ≤ threshold`; the independent spec states the statutory
INCLUSIVE ceiling as `fine ≤ 500000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax395FalseReturnFineCeiling500k

open JapanTaxLaw.TaxFinance

def specInScope (fine : Nat) : Prop := fine ≤ 500000

theorem agree_scope (fine : Nat) : inScope fine ↔ specInScope fine := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax395FalseReturnFineCeiling500k
