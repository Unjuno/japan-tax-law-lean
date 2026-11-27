import JapanTaxLaw.CustomsTariffArt15TreatyGoodsDelegation

/-!
# CustomsTariffArt15TreatyGoodsDelegationSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.15(1) item10 DELEGATION 「条約の規定により輸入の後特定の用途に供されることを条件として関税を免除することとされている貨物で政令で定めるもの」.
Normative unit: NORM|e88e79c160c4c7a008abfc095e601ed439e9cbeefd112e183044f3c2e2a8a57c

The implementation uses a Bool conjunction; the spec states the same gate as a
Prop conjunction of two equalities, representationally distinct. Agreement is
proved by cases in the kernel. Axiom-free; no decide/simp/propext.

Not modelled: treaty content, cabinet-order content, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt15TreatyGoodsDelegation

/-- Independent spec: both gates hold as Props. -/
def SpecInScope (treatyExempt cabinetDesignated : Bool) : Prop :=
  treatyExempt = true ∧ cabinetDesignated = true

/-- The implementation agrees with the spec. -/
theorem spec_agreement (a b : Bool) : inScope a b = true ↔ SpecInScope a b := by
  cases a with
  | false =>
      constructor
      · intro h
        cases h
      · intro h
        cases h with
        | intro ha hb => cases ha
  | true =>
      cases b with
      | false =>
          constructor
          · intro h
            cases h
          · intro h
            cases h with
            | intro ha hb => cases hb
      | true =>
          constructor
          · intro h
            constructor <;> rfl
          · intro h
            rfl

end JapanTaxLaw.CustomsTariffArt15TreatyGoodsDelegation
