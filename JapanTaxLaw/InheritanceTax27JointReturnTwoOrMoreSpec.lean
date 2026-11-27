import JapanTaxLaw.InheritanceTax27JointReturnTwoOrMore

/-
# InheritanceTax27JointReturnTwoOrMoreSpec — independent spec for 相続税法 Num 27/5

Needle 「同一の被相続人から相続又は遺贈により財産を取得した者又はその者の相続人で第一項、第二項（次条第二項において準用する場合を含む。）又は第三項の規定により申告書を提出すべきもの又は提出することができるものが二人以上ある場合において、当該申告書の提出先の税務署長が同一であるときは、これらの者は、政令で定めるところにより、当該申告書を共同して提出することができる。」.
The implementation uses `threshold ≤ persons`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ persons`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.InheritanceTax27JointReturnTwoOrMore

open JapanTaxLaw.TaxFinance

def specInScope (persons : Nat) : Prop := 2 ≤ persons

theorem agree_scope (persons : Nat) : inScope persons ↔ specInScope persons := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax27JointReturnTwoOrMore
