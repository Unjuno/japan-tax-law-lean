import JapanTaxLaw.CustomsTariffSupplArt1ExceptionDate

/-!
# CustomsTariffSupplArt1ExceptionDateSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY. 附則第一条(2) EXCEPTION
「ただし、次に掲げる規定は、平成四年一月一日から施行する。」. Normative unit: NORM|34bc97d6d32588ad832ab14de19ae658b3d7e00e7bb4bacc59564498bfe859c3

The implementation selects a Date by pattern match; the spec states the same
selection as a Prop equality disjunction, representationally distinct.
All theorems axiom-free (rfl / left/right + And.intro, decide).

Not modelled: the listed provisions themselves, cross-era conversion, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1ExceptionDate

/-- Independent spec: the applicable date is given by a Prop disjunction. -/
def SpecApplicableDate (k : ProvisionKind) (d : Date) : Prop :=
  (k = ProvisionKind.listed ∧ d = exceptionDate) ∨
  (k = ProvisionKind.other ∧ d = generalDate)

/-- Spec at a listed provision. -/
theorem spec_listed : SpecApplicableDate ProvisionKind.listed exceptionDate := by
  left
  exact And.intro rfl rfl

/-- Spec at any other provision. -/
theorem spec_other : SpecApplicableDate ProvisionKind.other generalDate := by
  right
  exact And.intro rfl rfl

/-- The implementation's listed-provision date satisfies the spec. -/
theorem impl_listed_matches_spec :
    SpecApplicableDate ProvisionKind.listed (applicableDate ProvisionKind.listed) := by
  left
  exact And.intro rfl rfl

/-- The implementation's other-provision date satisfies the spec. -/
theorem impl_other_matches_spec :
    SpecApplicableDate ProvisionKind.other (applicableDate ProvisionKind.other) := by
  right
  exact And.intro rfl rfl

end JapanTaxLaw.CustomsTariffSupplArt1ExceptionDate
