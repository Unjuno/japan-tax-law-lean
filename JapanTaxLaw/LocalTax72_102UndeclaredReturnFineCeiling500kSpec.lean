import JapanTaxLaw.LocalTax72_102UndeclaredReturnFineCeiling500k

/-
# LocalTax72_102UndeclaredReturnFineCeiling500kSpec — independent spec for 地方税法 Num 72_102/1

Needle 「正当な理由がなくて前条の規定による申告書をその提出期限までに提出しなかつたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」.
The implementation uses `fine ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `fine ≤ 500000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax72_102UndeclaredReturnFineCeiling500k

open JapanTaxLaw.TaxFinance

def specInScope (fine : Nat) : Prop := fine ≤ 500000

theorem agree_scope (fine : Nat) : inScope fine ↔ specInScope fine := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_102UndeclaredReturnFineCeiling500k
