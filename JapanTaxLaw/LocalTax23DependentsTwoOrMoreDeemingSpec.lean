import JapanTaxLaw.LocalTax23DependentsTwoOrMoreDeeming

/-
# LocalTax23DependentsTwoOrMoreDeemingSpec — independent spec for 地方税法 Num 23/4

Needle 「二以上の道府県民税の納税義務者の扶養親族又は特定親族に該当する者がある場合には、その者は、政令で定めるところにより、これらの納税義務者のうちいずれか一の納税義務者の扶養親族又は特定親族にのみ該当するものとみなす。」.
The implementation uses `threshold ≤ taxpayers`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ taxpayers`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax23DependentsTwoOrMoreDeeming

open JapanTaxLaw.TaxFinance

def specInScope (taxpayers : Nat) : Prop := 2 ≤ taxpayers

theorem agree_scope (taxpayers : Nat) : inScope taxpayers ↔ specInScope taxpayers := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax23DependentsTwoOrMoreDeeming
