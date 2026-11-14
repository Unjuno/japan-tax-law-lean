import JapanTaxLaw.Verdict

/-!
# Verdict — decision lemmas (small equational facts)

Local, mechanical-level lemmas used by the statutory model and its
specification. All proofs are by exhaustive case analysis.
-/

namespace JapanTaxLaw.Verdict

theorem and_eq_yes {a b : Verdict} : JapanTaxLaw.Verdict.and a b = .yes ↔ a = .yes ∧ b = .yes := by
  cases a <;> cases b <;> decide
theorem and_eq_no {a b : Verdict} : JapanTaxLaw.Verdict.and a b = .no ↔ a = .no ∨ b = .no := by
  cases a <;> cases b <;> decide
theorem or_eq_yes {a b : Verdict} : JapanTaxLaw.Verdict.or a b = .yes ↔ a = .yes ∨ b = .yes := by
  cases a <;> cases b <;> decide
theorem or_eq_no {a b : Verdict} : JapanTaxLaw.Verdict.or a b = .no ↔ a = .no ∧ b = .no := by
  cases a <;> cases b <;> decide
theorem not_eq_yes {a : Verdict} : JapanTaxLaw.Verdict.not a = .yes ↔ a = .no := by
  cases a <;> decide
theorem not_eq_no {a : Verdict} : JapanTaxLaw.Verdict.not a = .no ↔ a = .yes := by
  cases a <;> decide

end JapanTaxLaw.Verdict
