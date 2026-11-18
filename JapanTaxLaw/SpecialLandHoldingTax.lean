import JapanTaxLaw.TaxFinance

/-!
# SpecialLandHoldingTax — 地方税法 art. 596（特別土地保有税の税額）bounded L4 モデル

Source (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  （地方税法, enforcement 2026-11-01）

Models the computable core of 地方税法 art. 596 — pinned bytes 逐語:

  （特別土地保有税の税額）第五百九十六条特別土地保有税の税額は、次の各号に掲げる
  区分に応じ、当該各号に定める額とする。
  一 …同条第二項第一号の課税標準額に第五百九十四条の税率を乗じて得た額から、
    当該額を限度として、…固定資産税の課税標準となるべき価格に百分の一・四を
    乗じて得た額の合計額を控除した額
  二 …同条第二項第二号又は第三号の課税標準額に第五百九十四条の税率を乗じて
    得た額から、当該額を限度として、…不動産取得税の課税標準となるべき価格
    （…政令で定める額）に百分の四を乗じて得た額の合計額を控除した額

Computation (Money = Nat):

  tax      = taxRate.applyFloor base                       -- art. 594 税率 × 課税標準額
  deduction= min tax (deductionRate.applyFloor deductionBase)  -- 「当該額を限度として」
  result   = tax − deduction                               -- saturating (deduction ≤ tax)

Scope and honesty notes:

* **art. 594 の税率は別条文（税率表）** なので、本モジュールは税率を固定せず
  `taxRate : TaxRate` として **caller-established** に受け取る（税率表は担当範囲外）。
* 控除率は本条に明記された数値のみを転記する:
  - 一号「百分の一・四」= 1.4% = **14/1000**（10 倍過大な 14/100 = 140% ではない）。
  - 二号/三号「百分の四」= 4% = **4/100**（10 倍過小な 4/1000 ではない）。
  smoke で `fixedAssetDeductionRate.applyFloor 1000 = 14` を確認する。
* 固定資産税の課税標準となるべき価格 (`fixedAssetBase`)、不動産取得税の課税標準
  となるべき価格／政令で定める額 (`realEstateBase`)、および一号/二号/三号の
  **該当区分** はすべて caller-established な `Money` / def 選択であり、
  `Bool` は金額の算術に入れていない。「政令で定める額」を適用するかどうかも
  caller-established（`realEstateBase` に確定額／政令額のどちらを入れるかは呼び出し側）。
* 原文の「合計額」は複数の土地に対する (価格 × 控除率) の和だが、本モデルは
  caller が集約した課税標準価格 1 件に控除率を一度適用する（端数は各土地ごとではなく
  集約後に切り捨てる modeling choice）。個別土地の内訳は caller-established。
* 丸めは `TaxRate.applyFloor`（切り捨て）を全ての乗算に用いる（明示的な modeling choice）。
* 控除は「当該額（税額）を限度」なので `min` を取り、結果は `tax − deduction`。
  `deduction ≤ tax` が成り立つため `Nat` の飽和減算でも常に正確（アンダーフローしない）。
* 転記監査は fidelity-only であり法的正しさを保証しない。完成・網羅を主張しない。
-/

namespace JapanTaxLaw.SpecialLandHoldingTax

open JapanTaxLaw.TaxFinance

/-- 一号の控除率「百分の一・四」= 1.4% = 14/1000。 -/
def fixedAssetDeductionRate : TaxRate := ⟨14, 1000, by decide⟩

/-- 二号/三号の控除率「百分の四」= 4% = 4/100。 -/
def realEstateDeductionRate : TaxRate := ⟨4, 100, by decide⟩

/-- art. 596 の共通構造。
    `tax = taxRate.applyFloor base`（art. 594 税率 × 課税標準額）、
    `deduction = min tax (deductionRate.applyFloor deductionBase)`（「当該額を限度として」）、
    結果 = `tax − deduction`。 -/
def landHoldingTax (taxRate : TaxRate) (base : Money)
    (deductionRate : TaxRate) (deductionBase : Money) : Money :=
  taxRate.applyFloor base -
    min (taxRate.applyFloor base) (deductionRate.applyFloor deductionBase)

/-- art. 596 一号: 特別土地保有税（第五百九十九条第一項第一号）の税額。
    控除は固定資産税の課税標準価格 × 14/1000、税額を限度とする。 -/
def landHoldingTaxI (taxRate : TaxRate) (taxableBase fixedAssetBase : Money) : Money :=
  landHoldingTax taxRate taxableBase fixedAssetDeductionRate fixedAssetBase

/-- art. 596 二号: 特別土地保有税（第五百九十九条第一項第二号）の税額。
    控除は不動産取得税の課税標準価格（政令額の場合あり）× 4/100、税額を限度とする。 -/
def landHoldingTaxII (taxRate : TaxRate) (taxableBase realEstateBase : Money) : Money :=
  landHoldingTax taxRate taxableBase realEstateDeductionRate realEstateBase

/-- art. 596 三号: 特別土地保有税（第五百九十九条第一項第三号）の税額。
    控除率・構造は二号と同じ（区分の選択は caller-established）。 -/
def landHoldingTaxIII (taxRate : TaxRate) (taxableBase realEstateBase : Money) : Money :=
  landHoldingTax taxRate taxableBase realEstateDeductionRate realEstateBase

-- ==== positivity / smoke ====

/-- 一号控除率は 14/1000（10 倍過大な 14/100 ではない）。 -/
example : fixedAssetDeductionRate.numDen = (14, 1000) := by rfl

/-- 二号/三号控除率は 4/100（10 倍過小な 4/1000 ではない）。 -/
example : realEstateDeductionRate.numDen = (4, 100) := by rfl

example : 0 < fixedAssetDeductionRate.den := fixedAssetDeductionRate.den_pos
example : 0 < realEstateDeductionRate.den := realEstateDeductionRate.den_pos

/-- 一号: 課税標準価格 1000 → 控除 14（百分の一・四 = 1.4%）。 -/
example : fixedAssetDeductionRate.applyFloor 1000 = 14 := by decide

/-- 二号/三号: 課税標準価格 1000 → 控除 40（百分の四 = 4%）。 -/
example : realEstateDeductionRate.applyFloor 1000 = 40 := by decide

-- ==== verified facts（モデル整合性のみ） ====

/-- 控除額は常に税額以下（「当該額を限度として」）。 -/
theorem landHoldingTax_deduction_le_tax (taxRate : TaxRate) (base : Money)
    (deductionRate : TaxRate) (deductionBase : Money) :
    min (taxRate.applyFloor base) (deductionRate.applyFloor deductionBase)
      ≤ taxRate.applyFloor base := by
  exact Nat.min_le_left _ _

/-- 税額から控除するので結果は元の税額以下。 -/
theorem landHoldingTax_le_tax (taxRate : TaxRate) (base : Money)
    (deductionRate : TaxRate) (deductionBase : Money) :
    landHoldingTax taxRate base deductionRate deductionBase ≤ taxRate.applyFloor base := by
  unfold landHoldingTax
  exact Nat.sub_le _ _

/-- 控除額が 0 なら結果は税額そのもの（控除 0 境界）。 -/
theorem landHoldingTax_zero_deduction (taxRate : TaxRate) (base : Money)
    (deductionRate : TaxRate) :
    landHoldingTax taxRate base deductionRate 0 = taxRate.applyFloor base := by
  unfold landHoldingTax
  simp [JapanTaxLaw.TaxFinance.TaxRate.applyFloor]

/-- 控除額が税額以上なら税額を限度に控除され結果 0（控除 ≥ 税額で 0 境界）。 -/
theorem landHoldingTax_eq_zero_of_deduction_ge_tax (taxRate : TaxRate) (base : Money)
    (deductionRate : TaxRate) (deductionBase : Money)
    (h : taxRate.applyFloor base ≤ deductionRate.applyFloor deductionBase) :
    landHoldingTax taxRate base deductionRate deductionBase = 0 := by
  unfold landHoldingTax
  rw [Nat.min_eq_left h]
  exact Nat.sub_self _

/-- 控除額が 0 に満たない（正の）場合、結果 = tax − (税額未満の控除) の通常減算。
    `deduction ≤ tax` なので飽和減算は正確。 -/
theorem landHoldingTax_exact_sub (taxRate : TaxRate) (base : Money)
    (deductionRate : TaxRate) (deductionBase : Money) :
    landHoldingTax taxRate base deductionRate deductionBase =
      taxRate.applyFloor base -
        min (taxRate.applyFloor base) (deductionRate.applyFloor deductionBase) := rfl

end JapanTaxLaw.SpecialLandHoldingTax
