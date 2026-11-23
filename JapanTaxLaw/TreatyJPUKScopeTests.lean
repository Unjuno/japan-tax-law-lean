import JapanTaxLaw.TreatyJPUKScope
import JapanTaxLaw.TreatyJPUKScopeSpec

/-!
# TreatyJPUKScopeTests — 日英 第一条・第三条１
-/
namespace JapanTaxLaw.TreatyJPUKScopeTests
open JapanTaxLaw.TreatyJPUKScope

theorem scope_spec (a b : Bool) : inScope a b = JapanTaxLaw.TreatyJPUKScopeSpec.inScopeSpec a b := by rfl
theorem transparent_spec (f t : Bool) : fiscallyTransparentAttribution f t = JapanTaxLaw.TreatyJPUKScopeSpec.fiscallyTransparentAttributionSpec f t := by rfl
example : inScope true false = true := jp_resident_in_scope
example : inScope false true = true := uk_resident_in_scope
example : inScope true true = true := both_residents_in_scope
example : inScope false false = false := neither_not_in_scope
example : fiscallyTransparentAttribution true true = true := transparent_attributed
example : fiscallyTransparentAttribution false true = false := nontransparent_not_attributed
example : ukScopeDeclared = true := uk_scope_is_declaration

end JapanTaxLaw.TreatyJPUKScopeTests
