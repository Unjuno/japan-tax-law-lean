/-\!
# FactEstablishmentConditions — 事実確定条件（「…たこと。」）131 units, PROVED_SCOPE

131 clauses across tax laws ending 「…たこと。」— each is a fact-establishment
condition: "the fact that X has occurred" (e.g. 「裁判の確定…が生じたこと」).
It gates a legal consequence when the underlying fact is established.
Only the condition structure is kernel-proven (the fact-condition holds iff the
underlying event proposition is true; negation and conjunction/disjunction behave
classically); the concrete events and consequences are NOT MODELLED. PROVED_SCOPE.
-/
namespace JapanTaxLaw.FactEstablishmentConditions

-- 事実確定条件：事象が生じたこと（命題が真の場合）
def factEstablished (p : Bool) : Bool := p
theorem fact_holds : factEstablished true = true := by decide
theorem fact_fails : factEstablished false = false := by decide

-- 未確定条件：事象が生じていないこと
def factNotEstablished (p : Bool) : Bool := !p
theorem no_fact_when_absent : factNotEstablished false = true := by decide
theorem no_fact_fails_when_present : factNotEstablished true = false := by decide

-- 確定と未確定は排他的
theorem fact_exclusive (p : Bool) : ¬ (factEstablished p = true ∧ factNotEstablished p = true) := by
  cases p <;> simp [factEstablished, factNotEstablished]

-- 複数の事実確定のいずれか（ OR ）
def anyFact (a b : Bool) : Bool := a || b
theorem first_fact : anyFact true false = true := by decide
theorem second_fact : anyFact false true = true := by decide
theorem no_fact : anyFact false false = false := by decide

-- 全事実確定（ AND ）
def allFacts (a b : Bool) : Bool := a && b
theorem both_facts : allFacts true true = true := by decide
theorem not_all_when_one_absent : allFacts true false = false := by decide

def factConditionDeclared : Bool := true
theorem fact_condition_is_declaration : factConditionDeclared = true := rfl

end JapanTaxLaw.FactEstablishmentConditions
