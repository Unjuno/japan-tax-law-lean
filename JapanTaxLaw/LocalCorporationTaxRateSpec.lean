import JapanTaxLaw.LocalCorporationTaxRate

/-!
# LocalCorporationTaxRate spec — 地方法人税法 art. 10 の独立整数定式

Source (pinned; identical to LocalCorporationTaxRate.lean):
  Law id: 426AC0000000011
  Revision: 426AC0000000011_20260401_507AC0000000013

Independent restatement of 地方法人税法 art. 10 as plain `Nat` arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper:

  第1項 — 課税標準法人税額 × 103/1000      → (base * 103) / 1000
           （百分の十・三 = 10.3%；1030/1000 は 10 倍過大）
  第2項 — 基準法人税額 − 加算額（飽和減算） → adjustedBase - addition

The 課税標準法人税額 / 基準法人税額 / 加算額 are caller-established in both the
implementation and this spec; no eligibility Bool enters any formula.
Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw.LocalCorporationTaxRate

open JapanTaxLaw.TaxFinance

/-- Spec, 第1項: 課税標準法人税額 × 103/1000 (百分の十・三). -/
def specLocalCorpTax (base : Money) : Money := (base * 103) / 1000

/-- Spec, 第2項: 基準法人税額 − 加算額（飽和減算）. -/
def specLocalCorpTaxBase (adjustedBase addition : Money) : Money := adjustedBase - addition

-- ==== boundary points, all kernel-decided ====

example : specLocalCorpTax 0 = 0 := by decide
example : specLocalCorpTax 1 = 0 := by decide
example : specLocalCorpTax 999 = 102 := by decide
example : specLocalCorpTax 1000 = 103 := by decide
example : specLocalCorpTax 12345 = 1271 := by decide
example : specLocalCorpTax 100_000 = 10_300 := by decide

example : specLocalCorpTaxBase 0 0 = 0 := by decide
example : specLocalCorpTaxBase 1000 200 = 800 := by decide
example : specLocalCorpTaxBase 200 1000 = 0 := by decide

/-- Agreement of the implementation with the independent integer formulas at a
    spread of caller-established amounts (including floor boundaries and the
    saturating-subtraction boundary). Finite cross-check only: no universal
    theorem is claimed. -/
def agreeLocalCorpTaxRate : Bool :=
  localCorpTaxRate.numDen == (103, 1000) &&
  [0, 1, 999, 1000, 1001, 12345, 100_000, 1_000_000].all fun n =>
    specLocalCorpTax n == localCorpTax n

example : agreeLocalCorpTaxRate = true := by decide

/-- Agreement for the 第2項 base adjustment, including addition > base. -/
def agreeLocalCorpTaxBase : Bool :=
  [(0, 0), (1000, 200), (500, 500), (200, 1000), (12345, 678)].all fun p =>
    specLocalCorpTaxBase p.1 p.2 == localCorpTaxBase p.1 p.2

example : agreeLocalCorpTaxBase = true := by decide

end JapanTaxLaw.LocalCorporationTaxRate
