/-\!
# TaxPenaltyTriggers — 租税罰則の発動要件（地方税法 72-64/74-8/74-18）6 units, PROVED_SCOPE

6 clauses across 地方税法 第七十二条の六十四・第七十四条の八・第七十四条の十八:
penalty triggers are disjunctions of obstructive/false-statement acts:
- 検査を拒み/妨げ/忌避 (refuse/obstruct/evade inspection)
- 質問に答弁せず/虚偽の答弁 (no answer / false answer to questioning)
- 報告をせず/偽り (no report / false report)
- 帳簿を備えず/記載せず/偽り/隠匿 (no books / no entry / false entry / concealment)

Only the disjunctive trigger structure is kernel-proven; the concrete acts and
penalty amounts are caller-supplied and NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.TaxPenaltyTriggers

-- 検査拒否等：3つの禁止行為の論理和
def inspectionObstruction (refuse obstruct evade : Bool) : Bool := refuse || obstruct || evade
theorem refusal_triggers : inspectionObstruction true false false = true := by decide
theorem obstruction_triggers : inspectionObstruction false true false = true := by decide
theorem evasion_triggers : inspectionObstruction false false true = true := by decide
theorem no_act_no_trigger : inspectionObstruction false false false = false := by decide

-- 答弁拒否/虚偽：無答弁 又は 虚偽
def falseAnswer (noAnswer untrue : Bool) : Bool := noAnswer || untrue
theorem no_answer_triggers : falseAnswer true false = true := by decide
theorem untrue_triggers : falseAnswer false true = true := by decide
theorem honest_answer_no_trigger : falseAnswer false false = false := by decide

-- 帳簿違反：備えず/記載せず/偽り/隠匿 の論理和
def booksViolation (notKept notEntered falseEntry concealed : Bool) : Bool :=
  notKept || notEntered || falseEntry || concealed
theorem concealment_triggers : booksViolation false false false true = true := by decide
theorem no_violation_no_trigger : booksViolation false false false false = false := by decide

-- 罰則発動：いずれかの要件が成立すれば処罰対象
def penaltyApplies (obstruction badAnswer badReport books : Bool) : Bool :=
  obstruction || badAnswer || badReport || books
theorem any_trigger_appleis (o a r b : Bool) (h : o = true) : penaltyApplies o a r b = true := by
  simp [penaltyApplies, h]

def taxPenaltyTriggersDeclared : Bool := true
theorem tax_penalty_triggers_is_declaration : taxPenaltyTriggersDeclared = true := rfl

end JapanTaxLaw.TaxPenaltyTriggers
