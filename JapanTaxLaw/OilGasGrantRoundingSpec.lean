import JapanTaxLaw.OilGasGrantRounding

/-!
# OilGasGrantRounding spec — 石油ガス譲与税法 art.4 の独立整数定式

Sources (pinned): law 340AC0000000157, revision 340AC0000000157_20090401_421AC0000000009.

Independent restatement (declares its OWN unit constant and subtracts the
remainder instead of multiplying the quotient):
  端数単位 = 1,000 円、控除後額 = x - (x % 1,000)。

The correspondence theorem quantifies over EVERY `Money`, so it is a kernel
proof, not a finite-domain check.
-/

namespace JapanTaxLaw.OilGasGrantRounding

open JapanTaxLaw.TaxFinance

/-- 独立仕様の端数単位（実装定数を参照しない）。 -/
def specUnit : Money := 1000

/-- 独立仕様: 千円未満の端数を減算する定式。 -/
def specFloor (x : Money) : Money := x - x % specUnit

/-- 実装との対応（有限列挙ではない）。 -/
theorem agreeRound (yen : Money) : specFloor yen = floorThousandYen yen := by
  unfold specFloor floorThousandYen specUnit roundingUnitYen
  apply (Nat.sub_eq_iff_eq_add (Nat.mod_le yen 1000)).mpr
  exact (Nat.div_add_mod yen 1000).symm

example : specFloor 0 = 0 := by decide
example : specFloor 999 = 0 := by decide
example : specFloor 1000 = 1000 := by decide
example : specFloor 1001 = 1000 := by decide

end JapanTaxLaw.OilGasGrantRounding
