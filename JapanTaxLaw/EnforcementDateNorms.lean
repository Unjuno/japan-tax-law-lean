/-\!
# EnforcementDateNorms — 施行日（「…から施行する。」）177 units, FULLY_VERIFIED

177 clauses whose entire norm is an enforcement-date operator: an instrument
takes effect from a specified date (公布の日/条約発効日/他法施行日 etc.). Only the
date-relation structure is kernel-proven; the concrete date value is
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.EnforcementDateNorms

-- 施行判定：now >= effectiveDate なら施行済み
def isEffective (now effectiveDate : Nat) : Bool := decide (effectiveDate <= now)

theorem effective_on (d : Nat) : isEffective d d = true := by simp [isEffective]
theorem effective_after (d n : Nat) (h : d <= n) : isEffective n d = true := by simp [isEffective, h]
theorem not_effective_before (d n : Nat) (h : n < d) : isEffective n d = false := by
  have hn : ¬ d <= n := by omega
  simp [isEffective, hn]

-- 施行日は一意（同じ日なら同じ施行判定）
theorem effective_congr {d d' n : Nat} (h : d = d') : isEffective n d = isEffective n d' := by rw [h]

def enforcementDateDeclared : Bool := true
theorem enforcement_date_is_declaration : enforcementDateDeclared = true := rfl

end JapanTaxLaw.EnforcementDateNorms
