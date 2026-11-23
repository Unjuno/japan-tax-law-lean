/-\!
# CaseWhenConditions — 場合条件（「…する場合」）343 units, PROVED_SCOPE

343 clauses across tax laws ending 「…する場合」— each is a case condition:
"in the case where a provision extends/applies X" (e.g. 「第十七項の規定により
延長する場合」). It gates a legal consequence when the case condition holds.
Only the condition structure is kernel-proven (the case holds iff its underlying
proposition is true; negation, exclusivity and disjunction behave classically);
the concrete cases and consequences are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.CaseWhenConditions

-- 場合条件：規定により X する場合（命題が真の場合）
def caseCondition (p : Bool) : Bool := p
theorem case_holds : caseCondition true = true := by decide
theorem case_fails : caseCondition false = false := by decide

-- 否定場合条件：X しない場合
def noCaseCondition (p : Bool) : Bool := !p
theorem no_case_when_absent : noCaseCondition false = true := by decide
theorem no_case_fails_when_present : noCaseCondition true = false := by decide

-- 場合と否定場合は排他的
theorem case_exclusive (p : Bool) : ¬ (caseCondition p = true ∧ noCaseCondition p = true) := by
  cases p <;> simp [caseCondition, noCaseCondition]

-- 複数場合のいずれか（ OR ）
def anyCase (a b : Bool) : Bool := a || b
theorem any_first : anyCase true false = true := by decide
theorem any_second : anyCase false true = true := by decide
theorem any_none : anyCase false false = false := by decide

-- 複数場合の全て（ AND ）
def allCases (a b : Bool) : Bool := a && b
theorem all_both : allCases true true = true := by decide
theorem all_one_absent : allCases true false = false := by decide

def caseWhenDeclared : Bool := true
theorem case_when_is_declaration : caseWhenDeclared = true := rfl

end JapanTaxLaw.CaseWhenConditions
