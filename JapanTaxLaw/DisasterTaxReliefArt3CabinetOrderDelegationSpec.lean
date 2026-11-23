import JapanTaxLaw.DisasterTaxReliefArt3CabinetOrderDelegation

/-!
# DisasterTaxReliefArt3CabinetOrderDelegationSpec — independent spec

Law id: 322AC0000000175 (disaster victim tax relief Act), revision from INVENTORY.
Article: 第三条(8) — DELEGATION 「前項に定めるもののほか、第一項から第六項までの規定の適用に関し必要な事項は、政令で定める。」.
Normative unit: NORM|461a25ff05dbe9b4341873be8a70db1f63f9c3199c5e93c95068a9ac567e4db7

The implementation exposes a constant `prescriptionAuthority` plus structural
facts. The independent spec states them as a single propositional conjunction,
representationally distinct from the constants. Axiom-free by cases/rfl.

Not modelled: ordinance content, substantive application, legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt3CabinetOrderDelegation

/-- Independent spec: the full delegation fact as a proposition. -/
def SpecDelegation (a : Authority) (lo hi : Nat) (sup : Bool) : Prop :=
  a = Authority.cabinetOrder ∧ lo = 1 ∧ hi = 6 ∧ sup = true

/-- The implementation satisfies the independent spec. Axiom-free. -/
theorem implementation_satisfies_spec :
    SpecDelegation prescriptionAuthority sourceParagraphLo sourceParagraphHi
                   supplementsPrevParagraph := by
  unfold SpecDelegation prescriptionAuthority sourceParagraphLo sourceParagraphHi
         supplementsPrevParagraph
  exact ⟨rfl, rfl, rfl, rfl⟩

end JapanTaxLaw.DisasterTaxReliefArt3CabinetOrderDelegation
