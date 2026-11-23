import JapanTaxLaw.BareDeonticNorms
import JapanTaxLaw.BareDeonticNormsSpec

/-!
# BareDeonticNormsTests — 裸のデオンティック法様相
-/
namespace JapanTaxLaw.BareDeonticNormsTests
open JapanTaxLaw.BareDeonticNorms

theorem required_spec (P : Prop) : Required P ↔ JapanTaxLaw.BareDeonticNormsSpec.RequiredSpec P := by rfl
theorem permitted_spec (P : Prop) : Permitted P ↔ JapanTaxLaw.BareDeonticNormsSpec.PermittedSpec P := by rfl
theorem prohibited_spec (P : Prop) : Prohibited P ↔ JapanTaxLaw.BareDeonticNormsSpec.ProhibitedSpec P := by rfl
example (P : Prop) : Prohibited P ↔ Required (¬ P) := prohibited_iff_required_not P
example (P : Prop) : Permitted P ↔ ¬ Required (¬ P) := permitted_iff_not_required_not P
example (P : Prop) (h : Required P) : Permitted P := required_implies_permitted P h
example (P : Prop) (a : Prohibited P) (b : Permitted P) : False := prohibited_not_permitted P a b
example : bareDeonticDeclared = true := bare_deontic_is_declaration

end JapanTaxLaw.BareDeonticNormsTests
