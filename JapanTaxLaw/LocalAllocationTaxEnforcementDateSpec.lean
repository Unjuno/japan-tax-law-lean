import JapanTaxLaw.LocalAllocationTaxEnforcementDate

/-!
# LocalAllocationTaxEnforcementDateSpec — independent spec for 地方交付税法 1963-amendment 附則 第一条

Law id: 325AC0000000211 (地方交付税法, Local Allocation Tax Act)
Revision: 325AC0000000211_20261102_508AC0000000062
Statutory article: 附則（昭和三八年三月二二日法律第二三号）第一条（施行期日）
Normative unit: NORM|fb5a0e940fe5c31e14cdc8f7832e98b1b6df531a1fc429e963161c0c838bceaf

The implementation states the bound as a conjunction of inequalities
`promulgationDay ≤ enforcementDay ∧ enforcementDay - promulgationDay ≤ maxDelayDays`.
The independent spec reformulates it as membership in a closed interval:
`enforcementDay ∈ [promulgationDay, promulgationDay + maxDelayDays]`, expressed
via two `≤` comparisons against that interval's endpoints. These are distinct
formulations (subtraction form vs interval-endpoint form); the kernel proves
equivalence for ALL day pairs.

Boundary theorems are universal over their variables.

Not modelled: the actual cabinet-order date, substantive local-allocation-tax
rules, other supplementary provisions, 政令 details.
-/

namespace JapanTaxLaw.LocalAllocationTaxEnforcementDate

/-- Independent spec: membership in the closed interval [p, p+90]. -/
def specWithinEnforcementRange (promulgationDay enforcementDay : Nat) : Prop :=
  promulgationDay ≤ enforcementDay ∧ enforcementDay ≤ promulgationDay + maxDelayDays

/-- Correspondence for all day pairs. Universal, kernel-checked. -/
theorem agree_enforcement_range (promulgationDay enforcementDay : Nat) :
    withinEnforcementRange promulgationDay enforcementDay ↔
      specWithinEnforcementRange promulgationDay enforcementDay := by
  unfold withinEnforcementRange specWithinEnforcementRange
  constructor
  · intro h
    exact ⟨h.1, by
      calc
        enforcementDay = enforcementDay - promulgationDay + promulgationDay :=
          (Nat.sub_add_cancel h.1).symm
        _ ≤ maxDelayDays + promulgationDay := Nat.add_le_add_right h.2 promulgationDay
        _ = promulgationDay + maxDelayDays := Nat.add_comm _ _⟩
  · intro h
    exact ⟨h.1, by
      have hs := Nat.sub_le_sub_right h.2 promulgationDay
      simpa [Nat.add_sub_cancel_left] using hs⟩

/-- Boundary: the promulgation day itself is within range (0-day delay). -/
theorem at_promulgation (p : Nat) : withinEnforcementRange p p := by
  unfold withinEnforcementRange maxDelayDays
  constructor
  · exact Nat.le_refl p
  · rw [Nat.sub_self]; decide

/-- Boundary: exactly 90 days after promulgation is within range. -/
theorem at_max_delay (p : Nat) : withinEnforcementRange p (p + 90) := by
  unfold withinEnforcementRange maxDelayDays
  constructor
  · exact Nat.le_add_right p 90
  · rw [Nat.add_sub_cancel_left]; decide

/-- Boundary: 91 days after promulgation is outside range. -/
theorem beyond_max_delay (p : Nat) : ¬ withinEnforcementRange p (p + 91) := by
  unfold withinEnforcementRange maxDelayDays
  omega

/-- Boundary: a date before promulgation is outside range. -/
theorem before_promulgation (p d : Nat) (h : d < p) :
    ¬ withinEnforcementRange p d := by
  unfold withinEnforcementRange
  omega

end JapanTaxLaw.LocalAllocationTaxEnforcementDate
