import JapanTaxLaw.ResidentTaxTransitionalRates

/-!
# ResidentTaxTransitionalRates spec — 地方税法施行令 art. 12 の独立整数定式

Source (pinned; identical to ResidentTaxTransitionalRates.lean):
  Law id: 347CO0000000161
  Revision: 347CO0000000161_20010106_412CO0000000304

Independent restatement of the statutory rate formulas as plain Nat
arithmetic, **not** reusing the implementation's `TaxRate` / `TaxRate.applyFloor`
helper:

  一 イ 標準税率 (通常 / 五万未満) — 290 / 150（円、定数）
  一 ロ 制限税率 (通常 / 五万未満) — 430 / 230（円、定数）
  二 イ — tableRate * 80 / 100          （百分の八十, floor）
  二 ロ — (tableRate * 80 / 100) * 15 / 10（イの率 × 一・五, floor）
  三   — tableRate * 80 / 100          （百分の八十, floor）

The table rate, the population classification and applicability remain
caller-established in both the implementation and this spec; no eligibility
Bool enters any money formula. `specPopulationUnder50k` restates only the
statutory 50,000 boundary and is not used in any amount formula.

Scope boundaries identical to the implementation (第2項以降 NOT MODELLED).
-/

namespace JapanTaxLaw.ResidentTaxTransitionalRates

open JapanTaxLaw.TaxFinance

-- ==== independent integer constants（impl の定数を再利用しない） ====

/-- Spec, 一 イ 標準税率（通常）。 -/
def specStandardPerCapita : Money := 290

/-- Spec, 一 イ 標準税率（人口五万未満）。 -/
def specStandardPerCapitaSmall : Money := 150

/-- Spec, 一 ロ 制限税率（通常）。 -/
def specLimitPerCapita : Money := 430

/-- Spec, 一 ロ 制限税率（人口五万未満）。 -/
def specLimitPerCapitaSmall : Money := 230

/-- Spec, 原文「人口五万未満」の境界述語（金額式には使わない）。 -/
def specPopulationUnder50k (population : Nat) : Bool := population < 50_000

-- ==== independent integer formulas ====

/-- Spec, 二 イ: 表の率 × 80 / 100（floor）。 -/
def specIncomeTaxStandardRate (tableRate : Money) : Money := tableRate * 80 / 100

/-- Spec, 二 ロ: （表の率 × 80 / 100）× 15 / 10（floor, 150/10 ではない）。 -/
def specIncomeTaxLimitRate (tableRate : Money) : Money :=
  (tableRate * 80 / 100) * 15 / 10

/-- Spec, 三: 表の率 × 80 / 100（floor）。 -/
def specRetirementIncomeTaxStandardRate (tableRate : Money) : Money :=
  tableRate * 80 / 100

-- ==== points, all kernel-decided ====

example : specStandardPerCapita = 290 := by decide
example : specStandardPerCapitaSmall = 150 := by decide
example : specLimitPerCapita = 430 := by decide
example : specLimitPerCapitaSmall = 230 := by decide

example : specIncomeTaxStandardRate 0 = 0 := by decide
example : specIncomeTaxStandardRate 1 = 0 := by decide
example : specIncomeTaxStandardRate 2 = 1 := by decide
example : specIncomeTaxStandardRate 10 = 8 := by decide
example : specIncomeTaxStandardRate 1000 = 800 := by decide

example : specIncomeTaxLimitRate 0 = 0 := by decide
example : specIncomeTaxLimitRate 2 = 1 := by decide
example : specIncomeTaxLimitRate 10 = 12 := by decide
example : specIncomeTaxLimitRate 1000 = 1200 := by decide

example : specRetirementIncomeTaxStandardRate 1 = 0 := by decide
example : specRetirementIncomeTaxStandardRate 2 = 1 := by decide
example : specRetirementIncomeTaxStandardRate 1000 = 800 := by decide

/-- Agreement of the implementation with the independent integer formulas at a
    spread of caller-established table rates (including floor-boundary points),
    plus the four 均等割 constants and the 50,000 population boundary. -/
def agreeResidentTaxTransitionalRates : Bool :=
  standardPerCapita == specStandardPerCapita &&
  standardPerCapitaSmall == specStandardPerCapitaSmall &&
  limitPerCapita == specLimitPerCapita &&
  limitPerCapitaSmall == specLimitPerCapitaSmall &&
  ([0, 1, 49_999, 50_000, 50_001, 1_000_000].all fun p =>
    populationUnder50k p == specPopulationUnder50k p) &&
  ([0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 99, 100, 101, 999, 1000, 12345, 100_000, 907_123].all fun n =>
    incomeTaxStandardRate n == specIncomeTaxStandardRate n &&
    incomeTaxLimitRate n == specIncomeTaxLimitRate n &&
    retirementIncomeTaxStandardRate n == specRetirementIncomeTaxStandardRate n)

example : agreeResidentTaxTransitionalRates = true := by decide

end JapanTaxLaw.ResidentTaxTransitionalRates
