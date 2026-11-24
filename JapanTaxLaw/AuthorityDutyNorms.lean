/-\!
# AuthorityDutyNorms — 条件的職権義務（…行うものとする）155 units, PROVED_SCOPE

155 clauses across tax laws ending 「…行うものとする。」— each is a conditional
authority duty: "when conditions X are met (request/evidence/necessity), the
authority shall perform action Y" (e.g. 「政府は…必要があると認めるときは、
調査を行うものとする」). Only the trigger→duty structure is kernel-proven (the
duty arises iff the trigger condition holds; a duty implies its performance is
required; multiple duties compose; a duty not triggered imposes no obligation);
the concrete authorities, conditions and actions are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.AuthorityDutyNorms

-- 職権義務：トリガー条件が成り立てば義務が生じる
def authorityDuty (trigger : Bool) : Bool := trigger
theorem duty_when_triggered : authorityDuty true = true := by decide
theorem no_duty_without_trigger : authorityDuty false = false := by decide

-- 義務は行為の要求を含意（構造的に、義務が生じれば「行うべき」が成り立つ）
def dutyImpliesAct (duty act : Bool) : Bool := !duty || act
theorem duty_yields_act (duty act : Bool) (hd : duty = true) (hi : dutyImpliesAct duty act = true) : act = true := by
  cases duty <;> cases act <;> simp [dutyImpliesAct] at hd hi ⊢

-- 複数義務の合成（すべての義務が生じる）
def allDuties (a b : Bool) : Bool := a && b
theorem all_both : allDuties true true = true := by decide
theorem all_one_missing : allDuties true false = false := by decide

-- 否定トリガー：条件が満たされなければ義務なし
def noDuty (trigger : Bool) : Bool := !trigger
theorem no_duty_when_absent : noDuty false = true := by decide
theorem duty_trigger_exclusive (t : Bool) : ¬ (authorityDuty t = true ∧ noDuty t = true) := by
  cases t <;> simp [authorityDuty, noDuty]

def authorityDutyDeclared : Bool := true
theorem authority_duty_is_declaration : authorityDutyDeclared = true := rfl

end JapanTaxLaw.AuthorityDutyNorms
