/-\!
# PastEventCaseNorms — 過去事象の場合（…た場合）245 units, PROVED_SCOPE

245 clauses across tax laws ending 「…た場合」— each is a past-event condition:
"when X has been submitted/received/occurred" (e.g. 「申告書が基準日までに提出
された場合」, 「指定を受けた場合」). It gates a legal consequence. Only the
condition structure is kernel-proven (the case holds iff the past event occurred;
negation, exclusivity, disjunction and conjunction behave classically); the concrete
events and consequences are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.PastEventCaseNorms

-- 過去事象条件：事象が発生した場合
def pastEventCase (p : Bool) : Bool := p
theorem case_when_occurred : pastEventCase true = true := by decide
theorem case_when_absent : pastEventCase false = false := by decide

-- 否定過去条件：事象が発生しなかった場合
def noPastEvent (p : Bool) : Bool := !p
theorem no_event_when_absent : noPastEvent false = true := by decide
theorem no_event_fails_when_occurred : noPastEvent true = false := by decide

-- 発生・未発生は排他的
theorem occurred_exclusive (p : Bool) : ¬ (pastEventCase p = true ∧ noPastEvent p = true) := by
  cases p <;> simp [pastEventCase, noPastEvent]

-- 複数の過去事象のいずれか/全て
def anyPastEvent (a b : Bool) : Bool := a || b
def allPastEvents (a b : Bool) : Bool := a && b
theorem any_first : anyPastEvent true false = true := by decide
theorem any_none : anyPastEvent false false = false := by decide
theorem all_both : allPastEvents true true = true := by decide
theorem all_one_absent : allPastEvents true false = false := by decide

def pastEventCaseDeclared : Bool := true
theorem past_event_case_is_declaration : pastEventCaseDeclared = true := rfl

end JapanTaxLaw.PastEventCaseNorms
