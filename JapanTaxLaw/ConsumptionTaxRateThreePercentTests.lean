import JapanTaxLaw.ConsumptionTaxRateThreePercent
import JapanTaxLaw.ConsumptionTaxRateThreePercentSpec

/-
# ConsumptionTaxRateThreePercentTests — kernel-decided checks for 税制改革法 第十条

Pinned source: law 363AC0000000107, revision 363AC0000000107_19881230_000000000000000,
  data/raw/363AC0000000107_19881230_000000000000000.law.json,
  sha256 65abd2145fc6c71615ba5752d906f16e4efd54b47381675bff9e50f274c6a9df.
Every closed check below is a Nat/Bool expression discharged by `by decide`.
Coverage: zero base/tax, bases 100/1000/1, correct tax 3/30/0, wrong tax 4/29,
and impl/spec agreement (concrete points plus the universal omega bridge).
-/

namespace JapanTaxLaw.ConsumptionTaxRateThreePercent

-- (a) zero base / zero tax.
example : taxEquals 0 0 = true := by decide
example : specTaxEquals 0 0 = true := by decide
example : 0 + 0 = 0 := by decide

-- (b) correct tax at 百分の三 = 3/100: 100 -> 3, 1000 -> 30, 0 -> 0.
example : taxEquals 100 3 = true := by decide
example : taxEquals 1000 30 = true := by decide
example : taxEquals 0 0 = true := by decide

-- (c) base 1 has no exact integer tax at 3/100 (no rounding).
example : taxEquals 1 0 = false := by decide
example : taxEquals 1 3 = false := by decide

-- (d) wrong tax rejected: 4 on 100, 29 on 1000.
example : taxEquals 100 4 = false := by decide
example : taxEquals 1000 29 = false := by decide

-- (e) exact rational sanity: 3/100 = 3%.
example : rateIsThreePercent = true := by decide
example : rateNumerator = 3 := by decide
example : rateDenominator = 100 := by decide

-- (f) Nat cross-multiplication identity and saturation boundaries.
example : 100 * 3 = 3 * 100 := by decide
example : 100 * 3 - 3 * 100 = 0 := by decide
example : 1000 * 3 - 30 * 100 = 0 := by decide

-- (g) impl/spec agreement at concrete points (kernel-decided).
example : taxEquals 100 3 = specTaxEquals 100 3 := by decide
example : taxEquals 1000 30 = specTaxEquals 1000 30 := by decide
example : taxEquals 100 4 = specTaxEquals 100 4 := by decide
example : taxEquals 0 0 = specTaxEquals 0 0 := by decide

-- (h) impl/spec agreement for every Nat input (universal omega bridge).
example (base tax : Nat) : taxEquals base tax = specTaxEquals base tax := by
  exact agreeTaxEquals base tax

end JapanTaxLaw.ConsumptionTaxRateThreePercent
