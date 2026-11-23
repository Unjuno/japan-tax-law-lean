import JapanTaxLaw.CustomsTariffSupplArt1StaggeredEnforcementException

/-!
# CustomsTariffSupplArt1StaggeredEnforcementExceptionSpec — independent spec

Law id: 143AC0000000054, revision from INVENTORY. 附則第一条 proviso — EXCEPTION
「ただし、次の各号に掲げる改正規定は、当該各号に掲げる日から施行する。」. Normative unit: NORM|01ed33c34b3cea793208f86ea0e86fa6c3e2fc52b3f93a0b0dd94c09e6a0bd36

The implementation exposes a constant and a Bool fact. The independent spec states
them as one Prop conjunction, representationally distinct. Axiom-free by cases/rfl.

Not modelled: enumerated items, their dates, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1StaggeredEnforcementException

/-- Independent spec: the staggered-enforcement fact as a Prop. -/
def SpecStaggered (b : EnforcementBasis) (p : Bool) : Prop :=
  b = EnforcementBasis.itemListedDate ∧ p = true

/-- The implementation satisfies the independent spec. Axiom-free. -/
theorem implementation_satisfies_spec :
    SpecStaggered effectiveBasis perItem := by
  unfold SpecStaggered effectiveBasis perItem
  exact And.intro rfl rfl

end JapanTaxLaw.CustomsTariffSupplArt1StaggeredEnforcementException
