/-\!
# NegativeFactConditions — 否定事実条件（「…ないこと。」）116 units, PROVED_SCOPE

116 clauses across tax laws ending 「…いこと。」(= 「…ないこと。」) — each
asserts a negative fact as a condition ("the fact that X is not the case",
e.g. 「…の提出がないこと」, 「…に変動がないこと」, 「…がいないこと」) that
gates a legal consequence. Only the condition structure is kernel-proven
(a negative assertion holds iff its underlying proposition is false; negation,
double negation, exclusivity with the positive assertion, disjunction and
conjunction behave classically); the concrete facts and consequences are NOT
MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.NegativeFactConditions

-- 否定事実条件：命題が成り立たないこと
def negativeFact (p : Bool) : Bool := !p
theorem negative_holds_when_absent : negativeFact false = true := by decide
theorem negative_fails_when_present : negativeFact true = false := by decide

-- 肯定事実（比較用）
def positiveFact (p : Bool) : Bool := p
theorem double_negation (p : Bool) : negativeFact (negativeFact p) = positiveFact p := by
  cases p <;> rfl

-- 肯定・否定事実は排他的
theorem positive_negative_exclusive (p : Bool) :
    ¬ (positiveFact p = true ∧ negativeFact p = true) := by
  cases p <;> simp [positiveFact, negativeFact]

-- 複数の否定事実のいずれか/全て
def anyNegative (a b : Bool) : Bool := a || b
def allNegative (a b : Bool) : Bool := a && b
theorem any_first : anyNegative true false = true := by decide
theorem any_none : anyNegative false false = false := by decide
theorem all_both : allNegative true true = true := by decide
theorem all_one_absent : allNegative true false = false := by decide

def negativeFactDeclared : Bool := true
theorem negative_fact_is_declaration : negativeFactDeclared = true := rfl

end JapanTaxLaw.NegativeFactConditions
