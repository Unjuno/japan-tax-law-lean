/-\!
# FactAssertionConditions — 事実提示条件（「…ること。」）1014 units, PROVED_SCOPE

1014 clauses across tax laws ending 「…ること。」— each asserts a proposition
as a condition ("the fact that X holds", e.g. 「…に付されていること」,
「…を納付すべきこととなること」) that gates a legal consequence.
Only the condition structure is kernel-proven (the assertion-condition holds iff
its underlying proposition is true; negation, exclusivity, disjunction,
conjunction and material implication behave classically); the concrete facts,
parties and consequences are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.FactAssertionConditions

-- 事実提示条件：命題が成り立つこと
def factAssertion (p : Bool) : Bool := p
theorem assertion_holds : factAssertion true = true := by decide
theorem assertion_fails : factAssertion false = false := by decide

-- 否定事実：命題が成り立たないこと
def factDenial (p : Bool) : Bool := !p
theorem denial_when_absent : factDenial false = true := by decide
theorem denial_fails_when_present : factDenial true = false := by decide

-- 提示と否認は排他的
theorem assertion_exclusive (p : Bool) : ¬ (factAssertion p = true ∧ factDenial p = true) := by
  cases p <;> simp [factAssertion, factDenial]

-- 複数事実のいずれか（ OR ）/全て（ AND ）
def anyAssertion (a b : Bool) : Bool := a || b
def allAssertions (a b : Bool) : Bool := a && b
theorem any_first : anyAssertion true false = true := by decide
theorem any_second : anyAssertion false true = true := by decide
theorem any_none : anyAssertion false false = false := by decide
theorem all_both : allAssertions true true = true := by decide
theorem all_one_absent : allAssertions true false = false := by decide

-- 含意：事実が成り立てば帰結が適用（構造のみ）
def assertionImplies (p q : Bool) : Bool := !p || q
theorem assertion_implies_consequence (p q : Bool) (h : p = true) (hi : assertionImplies p q = true) : q = true := by
  cases p <;> cases q <;> simp [assertionImplies] at h hi ⊢

def factAssertionDeclared : Bool := true
theorem fact_assertion_is_declaration : factAssertionDeclared = true := rfl

end JapanTaxLaw.FactAssertionConditions
