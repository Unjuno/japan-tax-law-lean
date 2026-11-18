import JapanTaxLaw.LandValueTaxRate

/-!
# LandValueTaxRate spec — independent integer statement of 地価税法 art. 22

Source (pinned):
  Law id: 403AC0000000069
  Revision: 403AC0000000069_20250601_504AC0000000068

Independent restatement of 地価税法 art. 22 (税率):

  tax = ((課税価格 − 基礎控除) × 3) / 1000   (saturating subtraction; truncation)

The spec deliberately re-derives the arithmetic with literal Nat operations rather
than reusing `TaxRate.applyFloor`, so the `agree*` check below is a genuine
cross-check of the implementation against an separately written formula.
This is a finite sample cross-check only; no universal claim is made.
-/

namespace JapanTaxLaw.LandValueTaxRate

open JapanTaxLaw.TaxFinance

/-- Independent form of art. 22 (saturating subtraction, integer floor by division). -/
def specLandValueTax (taxableBase : Money) (basicDeduction : Money) : Money :=
  (taxableBase - basicDeduction) * 3 / 1000

-- ==== positivity / smoke (kernel-decided boundary points) ====

example : specLandValueTax 1_000 0 = 3 := by decide
example : specLandValueTax 100 0 = 0 := by decide       -- 300/1000 truncated to 0
example : specLandValueTax 334 0 = 1 := by decide       -- 1002/1000 truncated to 1
example : specLandValueTax 0 500 = 0 := by decide       -- saturating
example : specLandValueTax 500 500 = 0 := by decide
example : specLandValueTax 499 500 = 0 := by decide

set_option maxRecDepth 2048

/-- Finite grid: both orderings of (base, deduction) at a spread of points. -/
def lvtCheckGrid : Bool :=
  let rec go (k : Nat) : Bool :=
    match k with
    | 0 => specLandValueTax 0 0 == landValueTax 0 0
    | k + 1 =>
        let b := (k + 1) * 1_000
        let d := k * 500
        go k && (specLandValueTax b d == landValueTax b d &&
                 specLandValueTax d b == landValueTax d b)
  go 40

example : lvtCheckGrid = true := by decide

/-- Agreement of implementation with the independent spec over a finite set of
    sample points (rate binding, grid, and named boundary/fraction cases).
    A finite cross-check only — no universal theorem is claimed. -/
def agreeLandValueTaxRate : Bool :=
  landValueTaxRate.numDen == (3, 1000) &&
  lvtCheckGrid &&
  [ (0, 0), (0, 500), (500, 500), (499, 500), (100, 0), (334, 0),
    (1_000, 0), (1_000_000, 999_000), (3_000, 1_000), (2_999, 1_000),
    (37_500, 12_000), (999_999, 1)
  ].all fun p => specLandValueTax p.1 p.2 == landValueTax p.1 p.2

example : agreeLandValueTaxRate = true := by decide

end JapanTaxLaw.LandValueTaxRate
