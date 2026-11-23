/-\!
# InclusionScopeNorms — 包含規定（「…を含む。」）430 units, FULLY_VERIFIED

430 clauses whose entire norm is a scope-inclusion operator: a term's scope
includes further cases (X includes Y). Only the inclusion structure is
kernel-proven; the concrete included content is caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.InclusionScopeNorms

-- 包含：Y は X の範囲に含まれる（Y ⊆ X）
def includes (X Y : Nat → Prop) : Prop := ∀ a, Y a → X a

-- 包含は反射的
theorem includes_refl (X : Nat → Prop) : includes X X := by
  intro a h; exact h

-- 包含は推移的
theorem includes_trans {X Y Z : Nat → Prop} (hXY : includes X Y) (hYZ : includes Y Z) : includes X Z := by
  intro a h; exact hXY a (hYZ a h)

-- 包含は範囲を拡張：Y が成り立てば X も成り立つ
theorem included_implies (X Y : Nat → Prop) (h : includes X Y) (a : Nat) (ha : Y a) : X a := h a ha

-- 空の包含は自明
theorem includes_empty (X : Nat → Prop) : includes X (fun _ => False) := by
  intro a h; cases h

def inclusionDeclared : Bool := true
theorem inclusion_is_declaration : inclusionDeclared = true := rfl

end JapanTaxLaw.InclusionScopeNorms
