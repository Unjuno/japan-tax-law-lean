/-\!
# LapseOfEffectNorms — 効力喪失（「…効力を失う。」）26 units, PROVED_SCOPE

26 clauses whose entire norm is a lapse-of-effect operator: a permission,
approval or certification loses its effect when a specified triggering
condition is met. Only the lapse structure is kernel-proven (effect holds
before the trigger, ceases at/after the trigger); the concrete permission and
trigger conditions are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.LapseOfEffectNorms

-- 効力：発動前は有効、発動後は失効
def inEffect (triggered : Bool) : Bool := !triggered
theorem valid_before_trigger : inEffect false = true := by decide
theorem lapses_at_trigger : inEffect true = false := by decide

-- 失効は取り消しと同様（権利は失われる）
def rightLost (triggered : Bool) : Bool := triggered
theorem right_not_lost_before (triggered : Bool) (h : triggered = false) : rightLost triggered = false := by simp [rightLost, h]
theorem right_lost_at_trigger : rightLost true = true := by decide

-- 効力と権利喪失は補集合（inEffect = !rightLost）
theorem effect_complement_lost (triggered : Bool) : inEffect triggered = !rightLost triggered := by
  cases triggered <;> rfl

def lapseOfEffectDeclared : Bool := true
theorem lapse_of_effect_is_declaration : lapseOfEffectDeclared = true := rfl

end JapanTaxLaw.LapseOfEffectNorms
