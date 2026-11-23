import JapanTaxLaw.TreatyJPUSScope
import JapanTaxLaw.TreatyJPUSScopeSpec

/-!
# TreatyJPUSScopeTests — 条約第一条の演算子（L3 別層）
-/
namespace JapanTaxLaw.TreatyJPUSScopeTests

open JapanTaxLaw.TreatyJPUSScope

theorem scope_spec (a b : Bool) :
    inScope a b = JapanTaxLaw.TreatyJPUSScopeSpec.scopeSpec a b := by
  cases a <;> cases b <;> rfl

theorem relief_spec (r : Nat) :
    preservesRelief r = JapanTaxLaw.TreatyJPUSScopeSpec.reliefSpec r := rfl

example (r : Bool) : inScope true r = true := jp_resident_in_scope r
example (r : Bool) : inScope r true = true := us_resident_in_scope r
example : inScope false false = false := non_resident_out
example (a b : Bool) : inScope a b = inScope b a := scope_comm a b
example (r : Nat) : preservesRelief r = r := relief_preserved r
example : treatyScopeDeclared = true := treaty_scope_is_declaration

end JapanTaxLaw.TreatyJPUSScopeTests
