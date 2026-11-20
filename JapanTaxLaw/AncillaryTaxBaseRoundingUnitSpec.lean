import JapanTaxLaw.AncillaryTaxBaseRoundingUnit
import JapanTaxLaw.RefundRounding
import JapanTaxLaw.TaxRounding

/-!
# AncillaryTaxBaseRoundingUnitSpec — independent spec for 国税通則法 art. 118(3)

The implementation expresses the rule as `tax / 10000 * 10000`. The independent
spec expresses it as `tax − tax % 10000` (discard the remainder). These are
different formulations; the kernel proves their agreement for **all** natural
numbers (not a finite enumeration).

Variable contract: `tax : Money` = 附帯税の額の計算の基礎となる税額,
unit yen, domain Nat (non-negative integers).
-/


namespace JapanTaxLaw.AncillaryTaxBaseRoundingUnit

open JapanTaxLaw.TaxFinance

/-- 切り捨てられる端数 = 税額 mod 一万円. -/
def specFraction (tax : Money) : Money :=
  tax % roundingUnit

/-- 独立仕様: 計算基礎額 = 税額 − 端数. -/
def specBase (tax : Money) : Money :=
  tax - specFraction tax

/-- Soundness / correspondence: implementation agrees with the independent
    spec for every tax amount. Universal and kernel-checked. -/
theorem agree_ancillary_base_rounding (tax : Money) :
    baseAmount tax = specBase tax := by
  unfold baseAmount specBase specFraction roundingUnit
  calc
    tax / 10000 * 10000
        = (tax / 10000 * 10000 + tax % 10000) - tax % 10000 := by
            rw [Nat.add_sub_cancel]
    _ = (10000 * (tax / 10000) + tax % 10000) - tax % 10000 := by
            rw [Nat.mul_comm (tax / 10000) 10000]
    _ = tax - tax % 10000 := by rw [Nat.div_add_mod]

/-- The truncation never increases the base. -/
theorem specBase_le_tax (tax : Money) : specBase tax ≤ tax := by
  unfold specBase specFraction
  exact Nat.sub_le tax (tax % roundingUnit)

/-- Boundary: just below the unit, everything is discarded. -/
theorem specBase_eq_zero_of_lt (tax : Money) (h : tax < roundingUnit) :
    specBase tax = 0 := by
  unfold specBase specFraction roundingUnit
  have h' : tax < 10000 := by simpa [roundingUnit] using h
  rw [Nat.mod_eq_of_lt h']
  exact Nat.sub_self tax

/-- Cross-law consistency: art. 118(3) and art. 120(4) use the same
    10,000-yen truncation primitive (`RefundRounding.baseForAddition`). -/
theorem cross_law_refund_base (tax : Money) :
    baseAmount tax = JapanTaxLaw.RefundRounding.baseForAddition tax := by
  unfold JapanTaxLaw.RefundRounding.baseForAddition
  by_cases h : tax < roundingUnit
  · have h' : tax < 10000 := by simpa [roundingUnit] using h
    rw [if_pos h']
    unfold baseAmount roundingUnit
    rw [Nat.div_eq_of_lt h']
  · have h' : ¬ tax < 10000 := by simpa [roundingUnit] using h
    simp [h']
    simpa [specBase, specFraction, roundingUnit] using agree_ancillary_base_rounding tax

/-- The art. 118(3) unit is NOT the art. 118(1) primitive: at ¥15,000 the
    former yields ¥10,000 while the latter (千円未満) yields ¥15,000. -/
theorem distinct_from_art118_1 :
    baseAmount 15000 = 10000 ∧ JapanTaxLaw.thousandYenFloor 15000 = 15000 := by
  constructor <;> decide

/-- Finite smoke check only; the universal theorem above is the proof. -/
def agreeAncillaryBase : Bool :=
  [0, 1, 9999, 10000, 10001, 19999, 20000, 123456789].all fun tax =>
    baseAmount tax == specBase tax

example : agreeAncillaryBase = true := by decide

end JapanTaxLaw.AncillaryTaxBaseRoundingUnit
