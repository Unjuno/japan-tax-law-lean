import JapanTaxLaw.LocalTax455FineCeiling1M

/-
# LocalTax455FineCeiling1MSpec — independent spec for 地方税法 Num 455/1

Needle 「偽りその他不正の行為により軽自動車税の全部又は一部を免れたときは、その違反行為をした者は、百万円以下の罰金に処する。」.
The implementation uses `fine ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `fine ≤ 1000000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax455FineCeiling1M

open JapanTaxLaw.TaxFinance

def specInScope (fine : Nat) : Prop := fine ≤ 1000000

theorem agree_scope (fine : Nat) : inScope fine ↔ specInScope fine := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax455FineCeiling1M
