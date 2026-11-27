import JapanTaxLaw.LocalTax30FalseTaxManagerFineWithin300k

/-
# LocalTax30FalseTaxManagerFineWithin300kSpec — independent spec for 地方税法 Num 30/1

Needle 「前条第一項の規定により申告すべき納税管理人について虚偽の申告をし、又は偽りその他不正の手段により同項の承認若しくは同条第二項の認定を受けたときは、その違反行為をした者は、三十万円以下の罰金に処する。」.
The implementation uses `yen ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `yen ≤ 300000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax30FalseTaxManagerFineWithin300k

open JapanTaxLaw.TaxFinance

def specInScope (yen : Nat) : Prop := yen ≤ 300000

theorem agree_scope (yen : Nat) : inScope yen ↔ specInScope yen := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax30FalseTaxManagerFineWithin300k
