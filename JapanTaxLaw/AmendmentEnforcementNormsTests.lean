import JapanTaxLaw.AmendmentEnforcementNorms
import JapanTaxLaw.AmendmentEnforcementNormsSpec

/-!
# AmendmentEnforcementNormsTests — 改正規定の施行
-/
namespace JapanTaxLaw.AmendmentEnforcementNormsTests

open JapanTaxLaw.AmendmentEnforcementNorms

theorem effective_spec (d e : Nat) :
    effectiveFrom d e = true ↔ JapanTaxLaw.AmendmentEnforcementNormsSpec.effectiveSpec d e := by
  simp [effectiveFrom, JapanTaxLaw.AmendmentEnforcementNormsSpec.effectiveSpec]

theorem window_spec (p e b : Nat) :
    inEnforcementWindow p e b = true ↔ JapanTaxLaw.AmendmentEnforcementNormsSpec.windowSpec p e b := by
  simp [inEnforcementWindow, JapanTaxLaw.AmendmentEnforcementNormsSpec.windowSpec]

example (e : Nat) : effectiveFrom e e = true := effective_at e
example (d e : Nat) (h : d < e) : effectiveFrom d e = false := not_before d e h
example (p e b : Nat) (h : inEnforcementWindow p e b = true) : p < e := window_lower p e b h
example (p e b : Nat) (h : inEnforcementWindow p e b = true) : e <= p + b := window_upper p e b h
example (e : Nat) : itemEffective e e = true := item_at_date e
example : enforcementDeclared = true := enforcement_is_declaration

end JapanTaxLaw.AmendmentEnforcementNormsTests
