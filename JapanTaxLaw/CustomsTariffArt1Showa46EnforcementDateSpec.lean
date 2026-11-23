import JapanTaxLaw.CustomsTariffArt1Showa46EnforcementDate

/-!
# CustomsTariffArt1Showa46EnforcementDateSpec — independent spec 関税定率法 附則第一条

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 附則第一条（施行期日）— this Act comes into force from 昭和46年1月1日.
Verbatim source: 「この法律は、昭和四十六年一月一日から施行する。」
Normative unit: NORM|3ae41f5f074cf6b4f9da3b4a62e85f726a734f3c0108278bf1e3ae2002245bf4

The implementation uses nested lexicographic `leDate`; the independent spec is a
FLAT disjunction of field comparisons (>, >=), representationally distinct.
Agreement is proved by explicit case analysis, axiom-free (no omega/simp/propext).

Not modelled: Gregorian identification of 昭和 year 1, cross-era transitions,
other supplementary provisions, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt1Showa46EnforcementDate

/-- Independent spec: flat disjunction form of the in-force condition. -/
def SpecInForce (d : Date) : Prop :=
  d.year > 46 ∨
  (d.year = 46 ∧ d.month > 1) ∨
  (d.year = 46 ∧ d.month = 1 ∧ d.day >= 1)

/-- Universal agreement. Axiom-free: explicit case analysis with equality symmetry. -/
theorem agree_in_force (d : Date) : inForce d ↔ SpecInForce d := by
  unfold inForce leDate enforcementDate SpecInForce
  constructor
  · intro h
    rcases h with h | ⟨hy, h | ⟨hm, hd⟩⟩
    · left; exact h
    · right; left; exact ⟨hy.symm, h⟩
    · right; right; exact ⟨hy.symm, hm.symm, hd⟩
  · intro h
    rcases h with h | hrest
    · left; exact h
    · rcases hrest with ⟨hy, hmon⟩ | ⟨hy, hm, hd⟩
      · right; constructor
        · exact hy.symm
        · left; exact hmon
      · right; constructor
        · exact hy.symm
        · right; exact ⟨hm.symm, hd⟩

/-- In force ON the enforcement date. -/
theorem in_force_at_date : inForce ⟨46, 1, 1⟩ := by
  unfold inForce leDate enforcementDate
  decide

/-- Not in force before the enforcement year. -/
theorem not_in_force_before_year : ¬ inForce ⟨45, 12, 31⟩ := by
  unfold inForce leDate enforcementDate
  decide

/-- Not in force earlier in the enforcement year. -/
theorem not_in_force_before_month : ¬ inForce ⟨46, 0, 28⟩ := by
  unfold inForce leDate enforcementDate
  decide

end JapanTaxLaw.CustomsTariffArt1Showa46EnforcementDate
