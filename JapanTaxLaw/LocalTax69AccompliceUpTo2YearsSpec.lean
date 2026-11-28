import JapanTaxLaw.LocalTax69AccompliceUpTo2Years

/-
# LocalTax69AccompliceUpTo2YearsSpec — independent spec for 地方税法 Num 69/3

Needle 「情を知つて前二項の行為につき納税者又はその財産を占有する第三者の相手方となつたときは、その相手方としてその違反行為をした者は、二年以下の拘禁刑若しくは百五十万円以下の罰金に処し、又はこれを併科する。」.
The implementation uses `years <= 2`; this independent spec states the
statutory INCLUSIVE boundary as `years <= 2`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax69AccompliceUpTo2Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 2

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax69AccompliceUpTo2Years
