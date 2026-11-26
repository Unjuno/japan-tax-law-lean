import JapanTaxLaw.SenSpecificDuty

/-! Independent spec: split the area into hundreds and a remainder. -/

namespace JapanTaxLaw.SenSpecificDuty

theorem aux (q r senRate : Nat) :
    (100 * q + r) * senRate / 100 = q * senRate + r * senRate / 100 := by
  rw [Nat.add_mul, Nat.mul_assoc, Nat.mul_add_div (by decide : 0 < 100)]

theorem senDuty_agrees (area senRate : Nat) :
    senDuty area senRate = area / 100 * senRate + area % 100 * senRate / 100 := by
  unfold senDuty
  have hdec := Nat.div_add_mod area 100
  have haux := aux (area / 100) (area % 100) senRate
  rw [hdec] at haux
  exact haux

def specSenDuty (area senRate : Nat) := area / 100 * senRate + area % 100 * senRate / 100

theorem agrees (area senRate : Nat) : senDuty area senRate = specSenDuty area senRate :=
  senDuty_agrees area senRate

end JapanTaxLaw.SenSpecificDuty
