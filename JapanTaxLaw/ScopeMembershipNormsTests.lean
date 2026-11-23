import JapanTaxLaw.ScopeMembershipNorms
import JapanTaxLaw.ScopeMembershipNormsSpec

/-!
# ScopeMembershipNormsTests — 範囲帰属
-/
namespace JapanTaxLaw.ScopeMembershipNormsTests
open JapanTaxLaw.ScopeMembershipNorms

theorem in_spec (a s : Nat) : inScope a s ↔ JapanTaxLaw.ScopeMembershipNormsSpec.inScopeSpec a s := by rfl
theorem not_spec (a s : Nat) : notInScope a s ↔ JapanTaxLaw.ScopeMembershipNormsSpec.notInScopeSpec a s := by rfl
example (s : Nat) : inScope s s := membership_refl s
example {a b s : Nat} (h : a = b) : inScope a s ↔ inScope b s := membership_congr h
example (s t : Nat) (h : s ≠ t) : notInScope s t := excluded_not_in s t h
example {a s : Nat} (h : inScope a s) (hn : notInScope a s) : False := membership_exclusion_contradiction h hn
example : scopeMembershipDeclared = true := scope_membership_is_declaration

end JapanTaxLaw.ScopeMembershipNormsTests
