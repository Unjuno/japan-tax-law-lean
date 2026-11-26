import JapanTaxLaw.LocalTax774DirectorTermWithin3Years

/-
# LocalTax774DirectorTermWithin3YearsSpec — independent spec for 地方税法 Num 774(1)

Needle 「役員の任期は、三年以内において定款で定める期間とする。」.
The implementation uses `≤ threshold years`; the independent spec states the same
inclusive bound as `≤ 3 years`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax774DirectorTermWithin3Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years ≤ 3

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax774DirectorTermWithin3Years
