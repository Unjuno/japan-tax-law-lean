import JapanTaxLaw.InheritanceTaxArt15NoBioChildTwoAdoptedConditionSpec

/-!
# InheritanceTaxArt15NoBioChildTwoAdoptedConditionTests — kernel-checked checks

Verifies CONDITION 「当該被相続人に実子がなく、養子の数が二人以上である場合」: no actual child AND two-or-more adopted children.
-/

namespace JapanTaxLaw.InheritanceTaxArt15NoBioChildTwoAdoptedCondition

example : qualifies false 2 = true := zero_bio_two_adopted
example : qualifies false 3 = true := zero_bio_three_adopted
example : qualifies false 1 = false := zero_bio_one_adopted
example : qualifies true 3 = false := bio_child_excludes
example : SpecQualifies false 2 := spec_two_adopted
example : SpecQualifies false 3 := spec_three_adopted
example : (qualifies false 2 = true) ↔ SpecQualifies false 2 := agree_two_adopted
example (b : Bool) (n : Nat) : qualifies b n = true -> SpecQualifies b n := impl_implies_spec b n

end JapanTaxLaw.InheritanceTaxArt15NoBioChildTwoAdoptedCondition
