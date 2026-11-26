import JapanTaxLaw.SubstituteMemberResidualTerm

/-
# SubstituteMemberResidualTermSpec — independent spec for 国税審議会令 第四条

Declared statutory scope:
  Law id: 412CO0000000278, revision 412CO0000000278_20260401_507CO0000000412
  Article: 第四条 第一項 ただし書 — only the substitute term 「前任者の残任期間」.

The implementation projects its argument directly. This spec transcribes the
same rule independently as a structural pattern match on Nat constructors
(`0 => 0 | succ n => succ n`): a different formulation, with no implementation
definition reused in any `spec*` def. The universal agreement theorem is proved
by `cases` + `rfl` only, so no axiom is introduced.

Not modelled: the ordinary two-year term, appointment/renewal, other articles,
and human legal determination.
-/

namespace JapanTaxLaw.SubstituteMemberResidualTerm

/-- Independent transcription: the substitute inherits each residual term. -/
def specSubstituteTerm : Nat → Nat
  | 0 => 0
  | Nat.succ n => Nat.succ n

/-- Universal, axiom-free kernel correspondence for every residual term. -/
theorem agree_substitute_term (residual : Nat) :
    substituteTerm residual = specSubstituteTerm residual := by
  cases residual <;> rfl

end JapanTaxLaw.SubstituteMemberResidualTerm
