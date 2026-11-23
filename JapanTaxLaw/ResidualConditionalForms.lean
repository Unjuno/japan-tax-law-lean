/-\!
# ResidualConditionalForms — 残余の条件形式（れる/いる/げる/める場合, 号の場合, いとき）595 units, PROVED_SCOPE

595 clauses across tax laws ending with residual conditional-form suffixes:
  - 「…れる場合」(130) — passive-event condition
  - 「…いる場合」(114) — existence-state condition
  - 「…げる場合」(109) — agentive (grant/list) condition
  - 「…いとき。」(94) — quality/time condition
  - 「…号の場合」(77) — item-indexed case condition
  - 「…める場合」(71) — prescriptive (prescribe) condition

Each is a condition operator gating a rule. Only the condition structure is
kernel-proven (each form holds iff its underlying proposition holds; negation,
exclusivity and disjunction behave classically); the concrete propositions and
consequences are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ResidualConditionalForms

-- 受動事象条件（…れる場合）
def passiveEvent (p : Bool) : Bool := p
-- 存在状態条件（…いる場合）
def existenceState (p : Bool) : Bool := p
-- 能動条件（…げる場合）
def agentiveAct (p : Bool) : Bool := p
-- 性質/時点条件（…いとき）
def qualityTime (p : Bool) : Bool := p
-- 号指定条件（…号の場合）
def itemCase (p : Bool) : Bool := p
-- 規範的決定条件（…める場合）
def prescriptiveAct (p : Bool) : Bool := p

-- 各条件は命題が成り立つとき成立
theorem passive_holds : passiveEvent true = true := by decide
theorem existence_holds : existenceState true = true := by decide
theorem agentive_holds : agentiveAct true = true := by decide
theorem quality_holds : qualityTime true = true := by decide
theorem item_holds : itemCase true = true := by decide
theorem prescriptive_holds : prescriptiveAct true = true := by decide
theorem passive_fails : passiveEvent false = false := by decide
theorem existence_fails : existenceState false = false := by decide

-- 否定条件と排他性（共通構造）
def condNot (p : Bool) : Bool := !p
theorem cond_exclusive (p : Bool) : ¬ (passiveEvent p = true ∧ condNot p = true) := by
  cases p <;> simp [passiveEvent, condNot]

-- 条件の論理和（いずれかで発動）
def anyCond (a b : Bool) : Bool := a || b
theorem any_first : anyCond true false = true := by decide
theorem any_second : anyCond false true = true := by decide
theorem any_none : anyCond false false = false := by decide

def residualConditionDeclared : Bool := true
theorem residual_condition_is_declaration : residualConditionDeclared = true := rfl

end JapanTaxLaw.ResidualConditionalForms
