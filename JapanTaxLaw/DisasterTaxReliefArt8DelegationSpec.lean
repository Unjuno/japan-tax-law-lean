import JapanTaxLaw.DisasterTaxReliefArt8Delegation

/-!
# DisasterTaxReliefArt8DelegationSpec — independent spec

Law id: 322AC0000000175 (災害被害者に対する租税の減免、徴収猶予等に関する法律), revision from INVENTORY.
Article 8(2) DELEGATION 「前項に定めるもののほか、同項の規定の適用に関し必要な事項は、政令で定める。」.
Normative unit: NORM|d351e6ace9606ec2a4061c0a13824f8b21e9bbee9be7c1457e7d7cafbf136433

The implementation uses a Bool conjunction; the spec states the residual scope
as a Prop conjunction, representationally distinct. Axiom-free by rfl/And.intro.

Not modelled: delegated Cabinet Order content, preceding paragraph substance,
legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt8Delegation

/-- Independent spec: the residual delegation scope as a Prop. -/
def SpecDelegatedMatter (alreadyPrescribed necessaryForApplication : Bool) : Prop :=
  alreadyPrescribed = false ∧ necessaryForApplication = true

/-- The necessary non-prescribed residual satisfies the spec. -/
theorem spec_residual : SpecDelegatedMatter false true := by
  exact And.intro rfl rfl

/-- Agreement between the Bool implementation and the Prop spec at the residual. -/
theorem agree_residual : (isDelegatedMatter false true = true) ↔ SpecDelegatedMatter false true := by
  constructor
  · intro _h
    exact And.intro rfl rfl
  · intro _h
    rfl

/-- The delegation target in the spec is Cabinet Order. -/
theorem spec_target : delegatedTarget = DelegationTarget.cabinetOrder := rfl

end JapanTaxLaw.DisasterTaxReliefArt8Delegation
