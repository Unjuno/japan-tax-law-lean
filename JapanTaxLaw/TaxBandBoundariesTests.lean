import JapanTaxLaw.TaxBandBoundaries
import JapanTaxLaw.TaxBandBoundariesSpec

/-!
# TaxBandBoundariesTests — kernel-decided boundary examples + spec agreement
-/
namespace JapanTaxLaw.TaxBandBoundariesTests

open JapanTaxLaw.TaxBandBoundaries
open JapanTaxLaw.TaxBandBoundariesSpec

theorem amount_agrees (x : Nat) :
    inAmountBand x = true ↔ amountBandSpec x := by
  unfold amountBandSpec
  exact inAmountBand_iff x

theorem period_agrees (y : Nat) :
    inPeriodBand y = true ↔ periodBandSpec y := by
  unfold periodBandSpec
  exact inPeriodBand_iff y

-- 原文A: 下限包含 / 上限排他
example : inAmountBand 1_999_999 = false := by decide
example : inAmountBand 2_000_000 = true := by decide
example : inAmountBand 4_999_999 = true := by decide
example : inAmountBand 5_000_000 = false := by decide

-- 原文B: 下限排他 / 上限包含
example : inPeriodBand 19 = false := by decide
example : inPeriodBand 20 = false := by decide
example : inPeriodBand 21 = true := by decide
example : inPeriodBand 25 = true := by decide
example : inPeriodBand 26 = false := by decide

end JapanTaxLaw.TaxBandBoundariesTests
