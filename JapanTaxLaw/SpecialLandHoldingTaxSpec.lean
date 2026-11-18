import JapanTaxLaw.SpecialLandHoldingTax

/-!
# SpecialLandHoldingTax spec — 独立整数定式 (地方税法 art. 596)

Source (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002

Independent restatement of art. 596 with literal Nat operations, deliberately
NOT reusing `TaxRate.applyFloor`:

  tax       = (base * taxRate.num) / taxRate.den
  deduction = min tax ((deductionBase * deductionRate.num) / deductionRate.den)
  result    = tax − deduction

The `agree*` checks below cross-check the implementation against this separately
written formula over a finite sample. This is a finite cross-check only; no
universal equivalence theorem is claimed.
-/


namespace JapanTaxLaw.SpecialLandHoldingTax

open JapanTaxLaw.TaxFinance

/-- 独立定式: art. 596 の共通構造を `applyFloor` を使わず Nat 演算で書き直す。 -/
def specLandHoldingTax (taxRate : TaxRate) (base : Money)
    (deductionRate : TaxRate) (deductionBase : Money) : Money :=
  let tax := base * taxRate.num / taxRate.den
  let deduction := min tax (deductionBase * deductionRate.num / deductionRate.den)
  tax - deduction

/-- 独立定式 (一号): 控除率 14/1000 を固定。 -/
def specLandHoldingTaxI (taxRate : TaxRate) (taxableBase fixedAssetBase : Money) : Money :=
  specLandHoldingTax taxRate taxableBase fixedAssetDeductionRate fixedAssetBase

/-- 独立定式 (二号): 控除率 4/100 を固定。 -/
def specLandHoldingTaxII (taxRate : TaxRate) (taxableBase realEstateBase : Money) : Money :=
  specLandHoldingTax taxRate taxableBase realEstateDeductionRate realEstateBase

/-- 独立定式 (三号): 二号と同じ控除率 4/100。 -/
def specLandHoldingTaxIII (taxRate : TaxRate) (taxableBase realEstateBase : Money) : Money :=
  specLandHoldingTax taxRate taxableBase realEstateDeductionRate realEstateBase

-- ==== positivity / smoke (kernel-decided boundary points) ====

example : specLandHoldingTax ⟨14, 1000, by decide⟩ 1000 fixedAssetDeductionRate 0 = 14 := by decide
example : specLandHoldingTax ⟨4, 100, by decide⟩ 1000 realEstateDeductionRate 0 = 40 := by decide
example : specLandHoldingTax ⟨14, 1000, by decide⟩ 10 fixedAssetDeductionRate 10_000 = 0 := by decide
example : specLandHoldingTax ⟨1, 100, by decide⟩ 0 fixedAssetDeductionRate 500 = 0 := by decide

set_option maxRecDepth 2048

/-- 有限グリッド: 3 税率 × 9 課税標準額 × 7 控除基準額 × 2 控除率 = 378 点を
    spec と impl の両方で評価し一致を確認する（有限サンプルのみ）。 -/
def slhCheckGrid : Bool :=
  let rates : List TaxRate :=
    [⟨14, 1000, by decide⟩, ⟨4, 100, by decide⟩, ⟨1, 100, by decide⟩]
  let bases : List Money := [0, 1, 14, 99, 100, 333, 1000, 9999, 100_000]
  let dbases : List Money := [0, 1, 100, 250, 1000, 7000, 100_000]
  rates.all fun r =>
    bases.all fun b =>
      dbases.all fun db =>
        (specLandHoldingTax r b fixedAssetDeductionRate db ==
            landHoldingTax r b fixedAssetDeductionRate db) &&
        (specLandHoldingTax r b realEstateDeductionRate db ==
            landHoldingTax r b realEstateDeductionRate db)

example : slhCheckGrid = true := by decide

/-- 一号/二号/三号の各 def に対する有限一致チェック。 -/
def slhCaseCheckGrid : Bool :=
  let rates : List TaxRate :=
    [⟨14, 1000, by decide⟩, ⟨4, 100, by decide⟩, ⟨1, 100, by decide⟩]
  let bases : List Money := [0, 14, 100, 1000, 9999, 100_000]
  let dbases : List Money := [0, 100, 1000, 7000, 100_000]
  rates.all fun r =>
    bases.all fun b =>
      dbases.all fun db =>
        (specLandHoldingTaxI r b db == landHoldingTaxI r b db) &&
        (specLandHoldingTaxII r b db == landHoldingTaxII r b db) &&
        (specLandHoldingTaxIII r b db == landHoldingTaxIII r b db)

example : slhCaseCheckGrid = true := by decide

/-- 実装と独立 spec の有限一致（税率 binding + 2 グリッド + 境界/端数点）。
    有限サンプルのみで普遍定理は主張しない。 -/
def agreeSpecialLandHoldingTax : Bool :=
  fixedAssetDeductionRate.numDen == (14, 1000) &&
  realEstateDeductionRate.numDen == (4, 100) &&
  slhCheckGrid &&
  slhCaseCheckGrid &&
  [ ((⟨14, 1000, by decide⟩ : TaxRate), 1_000, 0)
  , ((⟨4, 100, by decide⟩ : TaxRate), 1_000, 0)
  , ((⟨1, 100, by decide⟩ : TaxRate), 10_000, 999_999)
  , ((⟨103, 1000, by decide⟩ : TaxRate), 3_000, 500)
  ].all fun p =>
    specLandHoldingTax p.1 p.2.1 fixedAssetDeductionRate p.2.2 ==
      landHoldingTax p.1 p.2.1 fixedAssetDeductionRate p.2.2

example : agreeSpecialLandHoldingTax = true := by decide

end JapanTaxLaw.SpecialLandHoldingTax
