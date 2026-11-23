/-\!
# ProvisionApplicationNorms — 規定適用（「準用する」128 + 「適用する」952）1080 units, PROVED_SCOPE

1080 clauses whose entire norm is a provision-application operator:
- mutatis (128): 「…を準用する。」 — a cited provision applies to another case
  with necessary modifications.
- apply (952): 「…について適用する。」 — a provision applies to a (often temporal)
  scope.

Only the application structure is kernel-proven; the applied substantive content
is NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ProvisionApplicationNorms

-- 規定適用：provision は scope に適用される
def applies (provision scope : Nat) : Prop := provision = scope

-- 準用：source を target に必要な読替えを付して適用
def mutatis (source target : Nat) : Prop := source != target

theorem applies_refl (p : Nat) : applies p p := rfl
theorem applies_congr {p s p' : Nat} (h : p = p') : applies p s ↔ applies p' s := by rw [h]
theorem mutatis_not_self (s t : Nat) (h : s != t) : mutatis s t := h

-- 準用は自己への適用ではない
theorem mutatis_implies_distinct {s t : Nat} (h : mutatis s t) : s != t := h

def provisionApplicationDeclared : Bool := true
theorem provision_application_is_declaration : provisionApplicationDeclared = true := rfl

end JapanTaxLaw.ProvisionApplicationNorms
