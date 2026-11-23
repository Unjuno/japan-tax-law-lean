import JapanTaxLaw.FactEstablishmentConditions
import JapanTaxLaw.FactEstablishmentConditionsSpec

/-!
# FactEstablishmentConditionsTests — 事実確定条件
-/
namespace JapanTaxLaw.FactEstablishmentConditionsTests
open JapanTaxLaw.FactEstablishmentConditions

theorem fact_spec (p : Bool) : factEstablished p = JapanTaxLaw.FactEstablishmentConditionsSpec.factEstablishedSpec p := by rfl
theorem nofact_spec (p : Bool) : factNotEstablished p = JapanTaxLaw.FactEstablishmentConditionsSpec.factNotEstablishedSpec p := by rfl
theorem any_spec (a b : Bool) : anyFact a b = JapanTaxLaw.FactEstablishmentConditionsSpec.anyFactSpec a b := by rfl
theorem all_spec (a b : Bool) : allFacts a b = JapanTaxLaw.FactEstablishmentConditionsSpec.allFactsSpec a b := by rfl
example : factEstablished true = true := fact_holds
example : factEstablished false = false := fact_fails
example : factNotEstablished false = true := no_fact_when_absent
example : factNotEstablished true = false := no_fact_fails_when_present
example (p : Bool) : ¬ (factEstablished p = true ∧ factNotEstablished p = true) := fact_exclusive p
example : anyFact true false = true := first_fact
example : anyFact false true = true := second_fact
example : anyFact false false = false := no_fact
example : allFacts true true = true := both_facts
example : allFacts true false = false := not_all_when_one_absent
example : factConditionDeclared = true := fact_condition_is_declaration

end JapanTaxLaw.FactEstablishmentConditionsTests
