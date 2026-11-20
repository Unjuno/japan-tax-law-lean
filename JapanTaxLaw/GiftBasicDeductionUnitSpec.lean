import JapanTaxLaw.GiftBasicDeductionUnit
import JapanTaxLaw.GiftTax

/-!
# GiftBasicDeductionUnitSpec — independent specification for art. 21-5

The spec is deliberately written in a different form from the implementation:
the implementation branches on an inequality, while the spec expresses the
deducted amount as `min` and subtracts it. The kernel proves their agreement
for ALL natural-number inputs (not a finite sample).

Variable contract: `taxableBase : Money` = 課税価格, unit yen, domain Nat.
-/

namespace JapanTaxLaw.GiftBasicDeductionUnit

open JapanTaxLaw.TaxFinance

/-- 控除額 = min(課税価格, 600,000円). -/
def specDeducted (taxableBase : Money) : Money :=
  min taxableBase basicDeduction

/-- 控除後の課税価格 = 課税価格 − 控除額. -/
def specResult (taxableBase : Money) : Money :=
  taxableBase - specDeducted taxableBase

/-- Soundness/correspondence: implementation agrees with the independent spec
    for every taxable base. Universal, kernel-checked; no `sorry`/`admit`. -/
theorem agree_gift_basic_deduction (taxableBase : Money) :
    taxableBaseAfterDeduction taxableBase = specResult taxableBase := by
  unfold taxableBaseAfterDeduction specResult specDeducted basicDeduction
  by_cases h : taxableBase ≤ 600000
  · rw [Nat.min_eq_left h]
    simp [h]
  · have hlt : 600000 < taxableBase := lt_of_not_ge h
    have hle : 600000 ≤ taxableBase := le_of_lt hlt
    rw [Nat.min_eq_right hle]
    simp [h]

/-- Boundary: a base not exceeding the deduction yields zero. -/
theorem specResult_eq_zero_of_le (b : Money) (h : b ≤ basicDeduction) :
    specResult b = 0 := by
  unfold specResult specDeducted
  rw [Nat.min_eq_left h]
  exact Nat.sub_self b

/-- Boundary: just above the deduction, exactly one yen remains. -/
example : specResult 600001 = 1 := by decide

/-- Boundary: at the deduction, zero remains. -/
example : specResult 600000 = 0 := by decide

/-- The deduction never increases the tax base. -/
theorem specResult_le_base (b : Money) : specResult b ≤ b := by
  unfold specResult
  exact Nat.sub_le b (specDeducted b)

/-- Cross-law consistency: the same ¥600,000 constant is used by the existing
    art. 21-7 gift-tax model (`JapanTaxLaw.giftBasicDeduction`). -/
theorem cross_law_constant : basicDeduction = JapanTaxLaw.giftBasicDeduction := by
  decide

/-- Finite smoke check only; the universal theorem above is the proof. -/
def agreeGiftBasicDeduction : Bool :=
  [0, 1, 599999, 600000, 600001, 1200000].all fun b =>
    taxableBaseAfterDeduction b == specResult b

example : agreeGiftBasicDeduction = true := by decide

end JapanTaxLaw.GiftBasicDeductionUnit
