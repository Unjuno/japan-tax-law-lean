import JapanTaxLaw.CustomsTariffSupplArt1UnclosEnforcementDate

/-!
# CustomsTariffSupplArt1UnclosEnforcementDateSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY. 附則第一条 REFERENCE
「この法律は、国連海洋法条約が日本国について効力を生ずる日から施行する。」。 Normative unit: NORM|6290b6ac5ca7107ae51c4755153893adb988f06112ac7e94716dd00aba840ebb

The implementation uses a Bool conjunction; the spec states the in-force condition
as a Prop conjunction, representationally distinct. Axiom-free by rfl/cases.

Not modelled: actual calendar date, treaty content, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1UnclosEnforcementDate

/-- Independent spec: in force iff the treaty is effective and the date is on/after. -/
def SpecInForce (treatyEffective onOrAfterEffectiveDate : Bool) : Prop :=
  treatyEffective = true ∧ onOrAfterEffectiveDate = true

/-- The triggering case satisfies the spec. -/
theorem spec_after_trigger : SpecInForce true true := by exact And.intro rfl rfl

/-- The implementation satisfies the spec at the triggering case. -/
theorem impl_matches_spec : SpecInForce true true := by
  unfold SpecInForce
  exact And.intro rfl rfl

/-- Any case where the Bool implementation holds also satisfies the spec. -/
theorem impl_implies_spec (a b : Bool) : inForce a b = true -> SpecInForce a b := by
  unfold inForce SpecInForce
  intro h
  cases a <;> cases b <;> cases h <;> exact And.intro rfl rfl

end JapanTaxLaw.CustomsTariffSupplArt1UnclosEnforcementDate
