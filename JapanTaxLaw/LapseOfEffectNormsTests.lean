import JapanTaxLaw.LapseOfEffectNorms
import JapanTaxLaw.LapseOfEffectNormsSpec

/-!
# LapseOfEffectNormsTests — 効力喪失
-/
namespace JapanTaxLaw.LapseOfEffectNormsTests
open JapanTaxLaw.LapseOfEffectNorms

theorem effect_spec (t : Bool) : inEffect t = JapanTaxLaw.LapseOfEffectNormsSpec.inEffectSpec t := by
  cases t <;> rfl
theorem lost_spec (t : Bool) : rightLost t = JapanTaxLaw.LapseOfEffectNormsSpec.rightLostSpec t := by rfl
example : inEffect false = true := valid_before_trigger
example : inEffect true = false := lapses_at_trigger
example : rightLost false = false := right_not_lost_before false rfl
example : rightLost true = true := right_lost_at_trigger
example (t : Bool) : inEffect t = !rightLost t := effect_complement_lost t
example : lapseOfEffectDeclared = true := lapse_of_effect_is_declaration

end JapanTaxLaw.LapseOfEffectNormsTests
