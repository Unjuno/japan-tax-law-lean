import JapanTaxLaw.KotashiProvisoNorms
import JapanTaxLaw.KotashiProvisoNormsSpec

/-!
# KotashiProvisoNormsTests — 但し書例外
-/
namespace JapanTaxLaw.KotashiProvisoNormsTests
open JapanTaxLaw.KotashiProvisoNorms

theorem kotashi_spec (r e : Bool) : ruleWithKotashi r e = JapanTaxLaw.KotashiProvisoNormsSpec.ruleWithKotashiSpec r e := by rfl
example : ruleWithKotashi true true = false := kotashi_disables
example : ruleWithKotashi true false = true := kotashi_keeps
example : ruleWithKotashi false false = false := kotashi_no_rule
example (r e : Bool) (h : ruleWithKotashi r e = true) : ¬ e := applied_implies_no_kotashi r e h
example : kotashiProvisoDeclared = true := kotashi_proviso_is_declaration

end JapanTaxLaw.KotashiProvisoNormsTests
