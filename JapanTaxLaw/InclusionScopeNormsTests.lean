import JapanTaxLaw.InclusionScopeNorms
import JapanTaxLaw.InclusionScopeNormsSpec

/-!
# InclusionScopeNormsTests — 包含規定
-/
namespace JapanTaxLaw.InclusionScopeNormsTests
open JapanTaxLaw.InclusionScopeNorms

theorem includes_spec (X Y : Nat → Prop) :
    includes X Y ↔ JapanTaxLaw.InclusionScopeNormsSpec.includesSpec X Y := by rfl
example (X : Nat → Prop) : includes X X := includes_refl X
example {X Y Z : Nat → Prop} (hXY : includes X Y) (hYZ : includes Y Z) : includes X Z := includes_trans hXY hYZ
example (X Y : Nat → Prop) (h : includes X Y) (a : Nat) (ha : Y a) : X a := included_implies X Y h a ha
example (X : Nat → Prop) : includes X (fun _ => False) := includes_empty X
example : inclusionDeclared = true := inclusion_is_declaration

end JapanTaxLaw.InclusionScopeNormsTests
