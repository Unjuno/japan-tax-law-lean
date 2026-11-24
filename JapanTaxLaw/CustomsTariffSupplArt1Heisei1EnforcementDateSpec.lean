import JapanTaxLaw.CustomsTariffSupplArt1Heisei1EnforcementDate

/-!
# CustomsTariffSupplArt1Heisei1EnforcementDateSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY. 附則第一条 REFERENCE
「この法律は、平成元年四月一日から施行する。」. Normative unit: NORM|c1eba0f628630c68c7f8946b94e9d3f7072b2686ad40ae64ab46e7bd1da7af6c

The implementation uses a Date structure and an ordering predicate; the spec
states the enforcement-date components as a Prop conjunction, representationally
distinct. All theorems axiom-free (rfl/And.intro).

Not modelled: Gregorian conversion, cross-era transitions, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1Heisei1EnforcementDate

/-- Independent spec: the enforcement date components. -/
def SpecEnforcementDate (d : Date) : Prop :=
  d.year = 1 ∧ d.month = 4 ∧ d.day = 1

/-- The enforcement date satisfies the spec. -/
theorem enforcement_satisfies_spec : SpecEnforcementDate enforcementDate := by
  unfold SpecEnforcementDate enforcementDate
  exact And.intro rfl (And.intro rfl rfl)

end JapanTaxLaw.CustomsTariffSupplArt1Heisei1EnforcementDate
