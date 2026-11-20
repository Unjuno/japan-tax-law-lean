/-!
# DeductionCapsAndMonthFloors — 325AC0000000226（控除上限・月数下限）

Pinned source: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Eight units, two repeated norm texts at distinct source coordinates:

* 月数下限 (art.72_21, six paragraphs):
  「この場合における月数は、暦に従い計算し、一月に満たないときは一月とし、
   一月に満たない端数を生じたときは切り捨てる。」
  → effective month count is 1 when m = 0, else m. Fractional truncation is
    caller-supplied as the Nat `m` (the truncation rule itself is NOT MODELLED).
* 控除上限 (art.37の2 and art.314の7):
  「この場合において、当該控除額が当該所得割の額を超えるときは、当該控除額は、
   当該所得割の額に相当する金額とする。」
  → allowable deduction is liability when liability <= deduction, else deduction.

Bounds, monotonicity, idempotence and commutation (when liability >= 1) are
proved. Callers supply Nat values; no legal adequacy or full computation claimed.
-/
namespace JapanTaxLaw.DeductionCapsAndMonthFloors

def effectiveMonths (m : Nat) : Nat := if m = 0 then 1 else m

def cappedDeduction (deduction liability : Nat) : Nat :=
  if liability <= deduction then liability else deduction

theorem months_at_least_one (m : Nat) : 1 <= effectiveMonths m := by
  by_cases h : m = 0 <;> simp [effectiveMonths, h] <;> omega

theorem months_id_of_ge_one (m : Nat) (h : 1 <= m) : effectiveMonths m = m := by
  have hn : m ≠ 0 := by omega
  simp [effectiveMonths, hn]

theorem months_mono (a b : Nat) (h : a <= b) : effectiveMonths a <= effectiveMonths b := by
  by_cases ha : a = 0
  · subst a
    by_cases hb : b = 0
    · simp [hb, effectiveMonths]
    · have hge : 1 <= b := by omega
      rw [months_id_of_ge_one b hge]
      simp [effectiveMonths]
      omega
  · have hb_or : b = 0 ∨ 1 <= b := by omega
    rcases hb_or with hb | hb
    · subst b
      omega
    · have hne : b ≠ 0 := by omega
      simp [effectiveMonths, ha, hne, h]

theorem months_idempotent (m : Nat) : effectiveMonths (effectiveMonths m) = effectiveMonths m := by
  by_cases h : m = 0
  · simp [h, effectiveMonths]
  · have hm : effectiveMonths m = m := months_id_of_ge_one m (by omega)
    rw [hm]
    exact hm

theorem capped_le_liability (deduction liability : Nat) :
    cappedDeduction deduction liability <= liability := by
  by_cases h : liability <= deduction <;> simp [cappedDeduction, h] <;> omega

theorem capped_le_deduction (deduction liability : Nat) :
    cappedDeduction deduction liability <= deduction := by
  by_cases h : liability <= deduction <;> simp [cappedDeduction, h] <;> omega

theorem capped_mono_deduction (a b liability : Nat) (h : a <= b) :
    cappedDeduction a liability <= cappedDeduction b liability := by
  by_cases ha : liability <= a
  · have hb : liability <= b := by omega
    simp [cappedDeduction, ha, hb] <;> omega
  · by_cases hb : liability <= b
    · simp [cappedDeduction, ha, hb] <;> omega
    · simp [cappedDeduction, ha, hb, h] <;> omega

theorem capped_eq_of_le (deduction liability : Nat) (h : deduction <= liability) :
    cappedDeduction deduction liability = deduction := by
  by_cases hl : liability <= deduction
  · have eq : liability = deduction := by omega
    simp [cappedDeduction, hl, eq]
  · simp [cappedDeduction, hl]

theorem capped_eq_of_gt (deduction liability : Nat) (h : liability < deduction) :
    cappedDeduction deduction liability = liability := by
  have hpos : liability <= deduction := by omega
  simp [cappedDeduction, hpos]

theorem cap_and_floor_commute (deduction liability : Nat) (hl : 1 <= liability) :
    effectiveMonths (cappedDeduction deduction liability) =
      cappedDeduction (effectiveMonths deduction) liability := by
  by_cases hle : deduction <= liability
  · rw [capped_eq_of_le deduction liability hle]
    by_cases h0 : deduction = 0
    · subst deduction
      rw [effectiveMonths]  -- RHS becomes cappedDeduction 1 liability
      simp only
      by_cases hl1 : liability <= 1
      · have eq : liability = 1 := by omega
        simp [cappedDeduction, hl1, eq, effectiveMonths]
      · have hgt : 1 < liability := by omega
        simp [cappedDeduction, hl1, effectiveMonths]
    · have hge : 1 <= deduction := by omega
      rw [months_id_of_ge_one deduction hge]
      exact (capped_eq_of_le deduction liability hle).symm
  · have hgt : liability < deduction := by omega
    rw [capped_eq_of_gt deduction liability hgt]
    rw [months_id_of_ge_one liability hl]
    have hge : 1 <= deduction := by omega
    rw [months_id_of_ge_one deduction hge]
    exact (capped_eq_of_gt deduction liability hgt).symm

end JapanTaxLaw.DeductionCapsAndMonthFloors
