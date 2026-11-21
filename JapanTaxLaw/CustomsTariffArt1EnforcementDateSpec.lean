import JapanTaxLaw.CustomsTariffArt1EnforcementDate

/-!
# CustomsTariffArt1EnforcementDateSpec — independent spec for 関税定率法 附則第一条

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 附則第一条（施行期日）— this Act comes into force from 昭和42年6月1日.
Normative unit: NORM|21111ed8a33c42e815231a5c0a00eff4d3929eb2c478b1b8de466f6f41097bcc

The implementation defines `inForce d := leDate enforcementDate d` with a nested
lexicographic `leDate`. The independent spec restates the in-force condition as a
FLAT disjunction of field comparisons using `>` / `>=` (representationally distinct
from the nested `<` / `<=` form), and proves universal agreement by explicit case
analysis on the disjunction structure (axiom-free — no omega, no Classical.choice).

Boundaries: in force ON the enforcement date and after; not before.
Cross-era comparison is out of scope (the statute fixes one era, 昭和).

Not modelled: Gregorian identification of 昭和 year 1, cross-era transitions,
other supplementary provisions, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt1EnforcementDate

/-- Independent spec: flat disjunction form of the in-force condition. -/
def SpecInForce (d : Date) : Prop :=
  d.year > 42 ∨
  (d.year = 42 ∧ d.month > 6) ∨
  (d.year = 42 ∧ d.month = 6 ∧ d.day >= 1)

/-- Universal agreement between the nested implementation and the flat spec.
    Axiom-free: explicit case analysis with equality symmetry. -/
theorem agree_in_force (d : Date) : inForce d ↔ SpecInForce d := by
  unfold inForce leDate enforcementDate SpecInForce
  constructor
  · intro h
    rcases h with h | ⟨hy, h | ⟨hm, hd⟩⟩
    · left
      exact h
    · right; left
      exact ⟨hy.symm, h⟩
    · right; right
      exact ⟨hy.symm, hm.symm, hd⟩
  · intro h
    rcases h with h | hrest
    · left
      exact h
    · rcases hrest with ⟨hy, hmon⟩ | ⟨hy, hm, hd⟩
      · right; constructor
        · exact hy.symm
        · left
          exact hmon
      · right; constructor
        · exact hy.symm
        · right
          exact ⟨hm.symm, hd⟩

/-- In force ON the enforcement date. -/
theorem in_force_at_date : inForce ⟨42, 6, 1⟩ := by
  unfold inForce leDate enforcementDate
  decide

/-- Not in force before the enforcement year. -/
theorem not_in_force_before_year : ¬ inForce ⟨41, 12, 31⟩ := by
  unfold inForce leDate enforcementDate
  decide

/-- Not in force earlier in the enforcement year. -/
theorem not_in_force_before_month : ¬ inForce ⟨42, 5, 31⟩ := by
  unfold inForce leDate enforcementDate
  decide

end JapanTaxLaw.CustomsTariffArt1EnforcementDate
