import JapanTaxLaw.CustomsTariffArt7MutatisMutandisException

/-!
# CustomsTariffArt7MutatisMutandisExceptionSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.7(15) EXCEPTION/READING/CONDITION 「第七項、第八項（第一号を除く。）及び第九項の規定は、前項の調査が開始された場合について準用する。」.
Normative unit: NORM|1432e7d9fd592fd3f859fd0bb6be8bf74a4119a191bd87e0ad89bbc16a123d15

The implementation is a Bool-valued selector; the spec states applicability as
a Prop (the investigation flag set AND the provision is neither the excluded
item 1 nor an unenumerated provision), representationally distinct. Equivalence
is proved by exhaustive kernel reduction, not assumed. Axiom-free; no
decide/simp/propext/omega.

Not modelled: incorporated provisions' content, legal effect, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt7MutatisMutandisException

/-- Independent spec: applicability as a Prop with explicit exclusions. -/
def SpecApplies (investigationStarted : Bool) (p : Provision) : Prop :=
  investigationStarted = true /\ p ≠ Provision.paragraph8Item1 /\ p ≠ Provision.other

/-- The Bool implementation and the Prop spec agree. -/
theorem applies_spec (s : Bool) (p : Provision) : applies s p = true ↔ SpecApplies s p := by
  cases s with
  | false =>
      constructor
      · intro h
        cases h
      · intro h
        cases h.1
  | true =>
      cases p with
      | paragraph7 =>
          constructor
          · intro h
            refine ⟨rfl, ?_, ?_⟩
            · intro hp
              cases hp
            · intro hp
              cases hp
          · intro h
            rfl
      | paragraph8Item1 =>
          constructor
          · intro h
            cases h
          · intro h
            exact (h.2.1 rfl).elim
      | paragraph8Other =>
          constructor
          · intro h
            refine ⟨rfl, ?_, ?_⟩
            · intro hp
              cases hp
            · intro hp
              cases hp
          · intro h
            rfl
      | paragraph9 =>
          constructor
          · intro h
            refine ⟨rfl, ?_, ?_⟩
            · intro hp
              cases hp
            · intro hp
              cases hp
          · intro h
            rfl
      | other =>
          constructor
          · intro h
            cases h
          · intro h
            exact (h.2.2 rfl).elim

end JapanTaxLaw.CustomsTariffArt7MutatisMutandisException
