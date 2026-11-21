import JapanTaxLaw.ExclusionAndExtensionNorms
import JapanTaxLaw.ExclusionAndExtensionNormsSpec

/-!
# ExclusionAndExtensionNormsTests — 適用除外・期間延長
-/
namespace JapanTaxLaw.ExclusionAndExtensionNormsTests

open JapanTaxLaw.ExclusionAndExtensionNorms

theorem exclusion_spec (c : Bool) :
    ruleApplies c = JapanTaxLaw.ExclusionAndExtensionNormsSpec.exclusionSpec c := by rfl

theorem any_spec (f : List Bool) :
    anyExclusion f = JapanTaxLaw.ExclusionAndExtensionNormsSpec.anySpec f := by rfl

theorem extend_spec (o e c : Nat) :
    extendPeriod o e c = JapanTaxLaw.ExclusionAndExtensionNormsSpec.extendSpec o e c := by
  unfold extendPeriod JapanTaxLaw.ExclusionAndExtensionNormsSpec.extendSpec
  by_cases h : e <= c <;> simp [h]

example : ruleApplies true = false := excluded_when_condition
example : ruleApplies false = true := applies_when_no_condition
example : anyExclusion [] = false := any_exclusion_empty
example : anyExclusion [false, true] = true := any_exclusion_true
example : anyExclusion [false, false] = false := any_exclusion_none
example (o e c : Nat) (h : e <= c) : extendPeriod o e c = o + e := extend_within_cap o e c h
example (o e c : Nat) (h : c < e) : extendPeriod o e c = o + c := extend_over_cap o e c h
example : exclusionDeclared = true := exclusion_is_declaration

end JapanTaxLaw.ExclusionAndExtensionNormsTests
