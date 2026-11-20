/-!
# TaxBandBoundaries — two boundary-distinct range conditions

Pinned sources:
- 347CO0000000151 art.19 (金額): 「二百万円以上五百万円未満の金額」 (下限包含 / 上限排他)
- 325AC0000000073 art.23 (残存期間): 「残存期間が二十年を超え二十五年以下のもの」 (下限排他 / 上限包含)

Both are caller-established numeric values (Nat): amount in 円, years in 年.
The two boundary conventions are modelled independently and proved separately.
-/
namespace JapanTaxLaw.TaxBandBoundaries

/-- 原文A 「二百万円」: 下限（包含）。 -/
def lowerA : Nat := 2_000_000
/-- 原文A 「五百万円」: 上限（排他）。 -/
def upperA : Nat := 5_000_000
/-- 原文A の金額帯。 -/
def inAmountBand (amount : Nat) : Bool :=
  decide (lowerA <= amount && amount < upperA)

/-- 原文B 「二十年」: 下限（排他）。 -/
def lowerB : Nat := 20
/-- 原文B 「二十五年」: 上限（包含）。 -/
def upperB : Nat := 25
/-- 原文B の残存期間帯。 -/
def inPeriodBand (years : Nat) : Bool :=
  decide (lowerB < years && years <= upperB)

theorem a_at_lower : inAmountBand 2_000_000 = true := by decide
theorem a_below_lower : inAmountBand 1_999_999 = false := by decide
theorem a_at_upper : inAmountBand 5_000_000 = false := by decide
theorem a_inside : inAmountBand 4_999_999 = true := by decide

theorem b_at_lower : inPeriodBand 20 = false := by decide
theorem b_above_lower : inPeriodBand 21 = true := by decide
theorem b_at_upper : inPeriodBand 25 = true := by decide
theorem b_above_upper : inPeriodBand 26 = false := by decide

theorem inAmountBand_iff (x : Nat) :
    inAmountBand x = true ↔ lowerA <= x ∧ x < upperA := by
  by_cases h1 : lowerA <= x <;> by_cases h2 : x < upperA <;>
    simp [inAmountBand, h1, h2]

theorem inPeriodBand_iff (y : Nat) :
    inPeriodBand y = true ↔ lowerB < y ∧ y <= upperB := by
  by_cases h1 : lowerB < y <;> by_cases h2 : y <= upperB <;>
    simp [inPeriodBand, h1, h2]

end JapanTaxLaw.TaxBandBoundaries
