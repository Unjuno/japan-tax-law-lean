import JapanTaxLaw.StatutoryDelegationAndDefinitions
import JapanTaxLaw.StatutoryDelegationAndDefinitionsSpec

/-!
# StatutoryDelegationAndDefinitionsTests
-/
namespace JapanTaxLaw.StatutoryDelegationAndDefinitionsTests

open JapanTaxLaw.StatutoryDelegationAndDefinitions

def defs : Nat → Nat := fun n => 10 + n

theorem def_spec (t : Nat) :
    definitionOf t defs = JapanTaxLaw.StatutoryDelegationAndDefinitionsSpec.itemDefinitionSpec t defs := by rfl

theorem deleg_spec :
    transitionalDelegationDeclared = true := by rfl

theorem reading_spec (r : Nat) :
    technicalReading r = JapanTaxLaw.StatutoryDelegationAndDefinitionsSpec.cabinetReadingSpec r := by rfl

example : definitionOf 3 defs = 13 := by decide
example : technicalReading 7 = 7 := by decide
example (t r : Nat) : ∃ d, definitionOf t defs = d ∧ ∃ x, technicalReading r = x :=
  all_structures_total t r defs
example : TransitionalHeading.declared = true := rfl

end JapanTaxLaw.StatutoryDelegationAndDefinitionsTests
