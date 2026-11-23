/-\!
# KotashiProvisoNorms — 但し書例外（旧字体「但し」）25 units, PROVED_SCOPE

25 clauses whose entire norm is a proviso exception using the old orthography
「但し、…この限りでない。」: when an exception condition holds, the main rule is
disabled. Structurally identical to the ただし proviso family, but these units use
「但し」and were not captured by the existing ただし-prefixed audit. Only the
exception structure is kernel-proven; the concrete rule and condition NOT MODELLED.
Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.KotashiProvisoNorms

-- 但し書例外：例外が成立すれば規則は適用されない
def ruleWithKotashi (ruleApplies exceptionHolds : Bool) : Bool := ruleApplies && !exceptionHolds
theorem kotashi_disables : ruleWithKotashi true true = false := by decide
theorem kotashi_keeps : ruleWithKotashi true false = true := by decide
theorem kotashi_no_rule : ruleWithKotashi false false = false := by decide

-- 適用されたなら例外は成立していない
theorem applied_implies_no_kotashi (r e : Bool) (h : ruleWithKotashi r e = true) : ¬ e := by
  cases r <;> cases e <;> simp [ruleWithKotashi] at h ⊢

def kotashiProvisoDeclared : Bool := true
theorem kotashi_proviso_is_declaration : kotashiProvisoDeclared = true := rfl

end JapanTaxLaw.KotashiProvisoNorms
