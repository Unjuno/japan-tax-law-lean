import JapanTaxLaw.DeemingAndProvisoNorms
import JapanTaxLaw.DeemingAndProvisoNormsSpec

/-!
# DeemingAndProvisoNormsTests — 擬制・例外
-/
namespace JapanTaxLaw.DeemingAndProvisoNormsTests

open JapanTaxLaw.DeemingAndProvisoNorms

theorem deem_spec (x : Bool) :
    deemApply x = JapanTaxLaw.DeemingAndProvisoNormsSpec.deemSpec x := by rfl

theorem deem_extend_spec (r d : Bool) :
    deemExtend r d = JapanTaxLaw.DeemingAndProvisoNormsSpec.deemExtendSpec r d := by rfl

theorem rule_exception_spec (r e : Bool) :
    ruleWithException r e = JapanTaxLaw.DeemingAndProvisoNormsSpec.ruleExceptionSpec r e := by rfl

example : deemApply true = true := deem_when_x
example : deemApply false = false := deem_not_when_not_x
example : deemExtend true false = true := deem_extend_real
example : deemExtend false true = true := deem_extend_deemed
example : deemExtend false false = false := deem_extend_none
example : ruleWithException true true = false := proviso_disables
example : ruleWithException true false = true := proviso_keeps
example : ruleWithException false false = false := proviso_no_rule
example (r e : Bool) (h : ruleWithException r e = true) : ¬ e := applied_implies_no_exception r e h
example : deemingDeclared = true := deeming_is_declaration

end JapanTaxLaw.DeemingAndProvisoNormsTests
