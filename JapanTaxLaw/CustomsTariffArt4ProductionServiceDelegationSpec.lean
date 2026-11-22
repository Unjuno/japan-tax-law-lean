import JapanTaxLaw.CustomsTariffArt4ProductionServiceDelegation

/-!
# CustomsTariffArt4ProductionServiceDelegationSpec — independent spec for 関税定率法 第四条(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第四条(1) Item#3 Subitem1#4 — production-related services (技術, design,
         others) as prescribed by 政令 (Cabinet Order).
Normative unit: NORM|166d1cbfaa939eed4cc5e49d978dc9b3922b053d66b1a8f041261f79a072529d

The implementation defines `inDelegatedClass s` as `(technical ∨ otherProduction)
∧ cabinetDesignated s`. The independent spec states the same delegation as a
PROPOSITIONAL relation via a flat case-disjunction on service class and designation,
and proves universal agreement. Kernel checks axiom-free by exhaustive `cases` over
the finite inductive type (no BEq coercion, no Classical.choice).

Not modelled: actual 政令 content, which concrete services are designated, other
items/articles, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt4ProductionServiceDelegation

/-- Independent spec: delegation as a propositional service/designation relation. -/
def SpecDelegated (s : ServiceClass) : Prop :=
  (s = ServiceClass.technical ∧ cabinetDesignated s = true) ∨
  (s = ServiceClass.otherProduction ∧ cabinetDesignated s = true)

/-- Universal agreement between implementation and spec. Axiom-free by exhaustive cases. -/
theorem agree_delegated (s : ServiceClass) : inDelegatedClass s ↔ SpecDelegated s := by
  cases s <;> simp [inDelegatedClass, SpecDelegated]

/-- The two listed production services are delegated; out-of-scope is not. -/
theorem technical_in_spec : SpecDelegated ServiceClass.technical := by
  unfold SpecDelegated cabinetDesignated
  decide
theorem other_production_in_spec : SpecDelegated ServiceClass.otherProduction := by
  unfold SpecDelegated cabinetDesignated
  decide
theorem out_of_scope_not_in_spec : ¬ SpecDelegated ServiceClass.outOfScope := by
  unfold SpecDelegated cabinetDesignated
  decide

end JapanTaxLaw.CustomsTariffArt4ProductionServiceDelegation
