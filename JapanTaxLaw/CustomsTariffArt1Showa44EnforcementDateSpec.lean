import JapanTaxLaw.CustomsTariffArt1Showa44EnforcementDate

/-!
# CustomsTariffArt1Showa44EnforcementDateSpec — independent spec 関税定率法 附則第一条

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 附則第一条（施行期日）— this Act comes into force from 昭和44年4月1日.
Verbatim source: 「この法律は、昭和四十四年四月一日から施行する。」
Normative unit: NORM|f5b0c58ff722cf183a1f093f7781bb702342f46bb63ff38fa4ec48985ec483ec

The implementation defines `inForce d := leDate enforcementDate d` with nested
lexicographic `leDate`. The independent spec restates the in-force condition as a
FLAT disjunction of field comparisons using `>` / `>=` (representationally
distinct), with universal agreement proved by explicit case analysis
(axiom-free — no omega, no Classical.choice, no simp/propext).

Boundaries: in force ON the enforcement date and after; not before.
Cross-era comparison is out of scope.

Not modelled: Gregorian identification of 昭和 year 1, cross-era transitions,
other supplementary provisions, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt1Showa44EnforcementDate

/-- Independent spec: flat disjunction form of the in-force condition. -/
def SpecInForce (d : Date) : Prop :=
  d.year > 44 ∨
  (d.year = 44 ∧ d.month > 4) ∨
  (d.year = 44 ∧ d.month = 4 ∧ d.day >= 1)

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
theorem in_force_at_date : inForce ⟨44, 4, 1⟩ := by
  unfold inForce leDate enforcementDate
  decide

/-- Not in force before the enforcement year. -/
theorem not_in_force_before_year : ¬ inForce ⟨43, 12, 31⟩ := by
  unfold inForce leDate enforcementDate
  decide

/-- Not in force earlier in the enforcement year. -/
theorem not_in_force_before_month : ¬ inForce ⟨44, 3, 30⟩ := by
  unfold inForce leDate enforcementDate
  decide

end JapanTaxLaw.CustomsTariffArt1Showa44EnforcementDate
