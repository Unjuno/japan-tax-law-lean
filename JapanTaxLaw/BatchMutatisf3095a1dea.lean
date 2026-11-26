import JapanTaxLaw.TaxFinance

/-! Generated template for a mutatis-mutandis reference. The referenced rule's
    effect, the target-case match, and applicability itself are
    caller-established (Bool) and NOT resolved by this pipeline. -/
namespace JapanTaxLaw.BatchMutatisf3095a1dea

def appliesVia (targetMatch : Bool) (referencedEffect : Bool) : Bool :=
  targetMatch && referencedEffect

theorem requires_both (t r : Bool) : appliesVia t r = true → t = true ∧ r = true := by
  intro h
  cases t <;> cases r <;> simp [appliesVia] at h ⊢

end JapanTaxLaw.BatchMutatisf3095a1dea
