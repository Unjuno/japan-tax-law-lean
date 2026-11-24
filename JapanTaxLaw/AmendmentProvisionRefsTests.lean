import JapanTaxLaw.AmendmentProvisionRefs
import JapanTaxLaw.AmendmentProvisionRefsSpec

/-!
# AmendmentProvisionRefsTests — 改正規定の列挙
-/
namespace JapanTaxLaw.AmendmentProvisionRefsTests
open JapanTaxLaw.AmendmentProvisionRefs

theorem empty_spec : emptyAmend = JapanTaxLaw.AmendmentProvisionRefsSpec.emptyAmendSpec := by rfl
theorem combine_spec (a b : AmendList) : combineAmend a b = JapanTaxLaw.AmendmentProvisionRefsSpec.combineAmendSpec a b := by rfl
theorem net_spec (a : AmendList) : netChange a = JapanTaxLaw.AmendmentProvisionRefsSpec.netChangeSpec a := by rfl
example (a b : AmendList) : combineAmend a b = (a.1 + b.1, a.2.1 + b.2.1, a.2.2 + b.2.2) := combine_is_additive a b
example (a : AmendList) : combineAmend emptyAmend a = a := empty_is_identity a
example (add del : Nat) (h : add = del) : netChange (add, del, 0) = 0 := balanced_amend_net_zero add del h
example (a b : AmendList) : combineAmend a b = combineAmend b a := combine_commutative a b
example : amendmentRefDeclared = true := amendment_ref_is_declaration

end JapanTaxLaw.AmendmentProvisionRefsTests
