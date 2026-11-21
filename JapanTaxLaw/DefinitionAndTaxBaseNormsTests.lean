import JapanTaxLaw.DefinitionAndTaxBaseNorms
import JapanTaxLaw.DefinitionAndTaxBaseNormsSpec

/-!
# DefinitionAndTaxBaseNormsTests — 定義・課税標準
-/
namespace JapanTaxLaw.DefinitionAndTaxBaseNormsTests

open JapanTaxLaw.DefinitionAndTaxBaseNorms

theorem rate_spec (r : Nat) :
    rateFromTable r = JapanTaxLaw.DefinitionAndTaxBaseNormsSpec.rateSpec r := by rfl

example (k v : Nat) (r : List (Nat × Nat)) : lookupDef ((k, v) :: r) k = some v := def_hit k v r
example (q : Nat) : lookupDef [] q = none := def_miss q
example (p q : Nat) : baseValue .price p q = p := base_is_price p q
example (p q : Nat) : baseValue .quantity p q = q := base_is_quantity p q
example (r : Nat) : rateFromTable r = r := rate_identity r
example : definitionDeclared = true := definition_is_declaration

end JapanTaxLaw.DefinitionAndTaxBaseNormsTests
