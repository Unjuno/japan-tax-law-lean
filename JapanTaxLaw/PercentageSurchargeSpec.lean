import JapanTaxLaw.PercentageSurcharge

/-!
# PercentageSurchargeSpec — 独立分数定式と全称対応証明

The spec restates 15% as 3/20 and 35% as 7/20 — different numerals, same
rational value. Universal theorems prove the implementation's percent formula
equals the reduced-fraction formula for ALL Nat.
-/

namespace JapanTaxLaw.PercentageSurcharge

def specSurcharge15 (tax : Nat) : Nat := tax * 3 / 20
def specAddition35 (s : Nat) : Nat := s * 7 / 20
def specRate20 (a : Nat) : Nat := a / 5

/-- 15%: tax*15/100 = tax*3/20 (全称). -/
theorem agree15 (tax : Nat) : surcharge15 tax = specSurcharge15 tax := by
  unfold surcharge15 specSurcharge15
  rw [show tax * 15 = (tax * 3) * 5 by omega]
  rw [show 100 = 20 * 5 by decide]
  exact Nat.mul_div_mul_right (tax * 3) 20 (by decide)

/-- 35%: s*35/100 = s*7/20 (全称). -/
theorem agree35 (s : Nat) : addition35 s = specAddition35 s := by
  unfold addition35 specAddition35
  rw [show s * 35 = (s * 7) * 5 by omega]
  rw [show 100 = 20 * 5 by decide]
  exact Nat.mul_div_mul_right (s * 7) 20 (by decide)

/-- 20%: a*20/100 = a/5 (全称). -/
theorem agree20 (a : Nat) : rate20 a = specRate20 a := by
  unfold rate20 specRate20
  rw [show a * 20 = (a * 5) * 4 by omega]
  rw [show 100 = 25 * 4 by decide]
  rw [Nat.mul_div_mul_right (a * 5) 25 (by decide)]
  rw [show a * 5 = a * 5 by rfl]
  exact Nat.mul_div_mul_right a 5 (by decide)

end JapanTaxLaw.PercentageSurcharge
