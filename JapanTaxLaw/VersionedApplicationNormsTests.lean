import JapanTaxLaw.VersionedApplicationNorms
import JapanTaxLaw.VersionedApplicationNormsSpec

/-!
# VersionedApplicationNormsTests — 新旧法の選択
-/
namespace JapanTaxLaw.VersionedApplicationNormsTests

open JapanTaxLaw.VersionedApplicationNorms

theorem after_spec (d e : Nat) :
    appliesAfter d e = true ↔ JapanTaxLaw.VersionedApplicationNormsSpec.afterSpec d e := by
  simp [appliesAfter, JapanTaxLaw.VersionedApplicationNormsSpec.afterSpec]

theorem before_spec (d e : Nat) :
    appliesBefore d e = true ↔ JapanTaxLaw.VersionedApplicationNormsSpec.beforeSpec d e := by
  simp [appliesBefore, JapanTaxLaw.VersionedApplicationNormsSpec.beforeSpec]

theorem old_spec (f : Bool) :
    oldLawFor f = JapanTaxLaw.VersionedApplicationNormsSpec.oldLawSpec f := by rfl

theorem amended_spec (p : Bool) :
    amendedApplies p = JapanTaxLaw.VersionedApplicationNormsSpec.amendedSpec p := by rfl

example (e : Nat) : appliesAfter e e = true := after_at_boundary e
example (e : Nat) : appliesBefore e e = false := before_at_boundary e
example (d e : Nat) : ¬ (appliesAfter d e = true ∧ appliesBefore d e = true) := exclusive d e
example (d e : Nat) : appliesAfter d e = true ∨ appliesBefore d e = true := exhaustive d e
example : oldLawFor true = true := old_when_flagged
example : oldLawFor false = false := new_when_not_flagged
example : amendedApplies true = false := not_applied_if_pending
example : amendedApplies false = true := applied_if_not_pending
example : versionDeclared = true := version_is_declaration

end JapanTaxLaw.VersionedApplicationNormsTests
