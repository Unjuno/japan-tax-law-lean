import JapanTaxLaw.AutoWeightGrantRounding

/-!
# AutoWeightGrantRounding spec — art.4 の独立整数定式

Independent restatement: own unit constant 1,000; spec subtracts the remainder
`x % specUnit`. The universal theorem quantifies over every Money.
-/

namespace JapanTaxLaw.AutoWeightGrantRounding

open JapanTaxLaw.TaxFinance

def specUnit : Money := 1000
def specFloor (x : Money) : Money := x - x % specUnit

theorem agreeRound (yen : Money) : specFloor yen = floorThousandYen yen := by
  unfold specFloor floorThousandYen specUnit roundingUnitYen
  apply (Nat.sub_eq_iff_eq_add (Nat.mod_le yen 1000)).mpr
  simpa [Nat.mul_comm] using (Nat.div_add_mod yen 1000).symm

example : specFloor 999 = 0 := by decide
example : specFloor 1000 = 1000 := by decide
example : specFloor 1001 = 1000 := by decide

end JapanTaxLaw.AutoWeightGrantRounding
