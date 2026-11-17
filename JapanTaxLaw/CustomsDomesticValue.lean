import JapanTaxLaw.TaxFinance

/-!
# CustomsDomesticValue — 関税定率法 art. 4の3（国内販売価格又は製造原価に基づく課税価格の決定）L4 モデル

Source (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json

Models the computable core of art. 4の3 — pinned bytes 逐語:

  1項: 「前二条の規定により輸入貨物の課税価格を計算することができない場合において、…
        国内販売価格があるときは、当該輸入貨物の課税価格は、…
        当該国内販売価格から次に掲げる手数料等の額を控除して得られる価格とする。
        イ 国内における販売に係る通常の手数料又は利潤及び一般経費
        ロ 輸入港到着後国内において販売するまでの運賃、保険料その他…費用
        ハ 本邦において課された関税その他の公課」
  1項二: 「…加工の上、国内において販売された…国内販売価格から当該加工により付加された
        価額及び前号イからハまでに掲げる手数料等の額を控除して得られる価格」
  2項: 「…当該輸入貨物の製造原価に…通常の利潤及び一般経費並びに…
        輸入港までの運賃等の額を加えた価格とする。」
  3項: 「…希望する旨を税関長に申し出たときは、第一項の規定に先立つて前項の規定により
        当該輸入貨物の課税価格を計算するものとする。」

Computation (Money = Nat):

  domesticDeductionsTotal d = 加工付加価額 + 手数料利潤経費 + 国内運賃 + 本邦公課
  domesticSalesValue price d = price - domesticDeductionsTotal d       -- saturating Nat subtraction
  computedValue cost profit freight = cost + profit + freight
  customsValueArt4_3 price d cost profit freight useCostFirst =
    if useCostFirst then computedValue cost profit freight
    else domesticSalesValue price d

Scope & honest boundaries:

* 国内販売価格・各控除額・製造原価・利潤一般経費・輸入港までの運賃等は
  caller-established Money（政令の算定細目は本モジュール外）。
* 第1項二の「加工により付加された価額」は `processingValue` として control に含める。
* 第3項の「希望する旨の申出」は caller-established Bool `useCostFirst`。
* 第1項ただし書（第2号を適用するには第1号が適用できず申出が必要）は
  caller-established — 本関数は提示された方法の計算のみを行い、適用判定はしない。
* Underflow: 控除額が国内販売価格を超える場合 0 を返す（saturating subtraction）。
  `domesticSalesValue_exact` は控除額 ≤ 価格のときだけ正確。0 が課税価格ゼロを
  主張するものではない（法令上想定されず caller が入力妥当性を担保）。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 4の3(1) の国内販売価格からの控除項目。 -/
structure DomesticDeductions where
  -- 1項二 加工により付加された価額（加工がない場合は 0）
  processingValue : Money
  -- 1項一イ 通常の手数料・利潤・一般経費
  commissionProfit : Money
  -- 1項一ロ 輸入港到着後国内販売までの運賃等
  inlandFreight : Money
  -- 1項一ハ 本邦で課された関税その他の公課
  domesticDuties : Money
  deriving DecidableEq, Repr

/-- art. 4の3(1) — 控除額の合計。 -/
def domesticDeductionsTotal (d : DomesticDeductions) : Money :=
  d.processingValue + d.commissionProfit + d.inlandFreight + d.domesticDuties

/-- art. 4の3(1) — 国内販売価格に基づく課税価格（saturating Nat 減算）。 -/
def domesticSalesValue (price : Money) (d : DomesticDeductions) : Money :=
  price - domesticDeductionsTotal d

/-- art. 4の3(2) — 製造原価に基づく課税価格。 -/
def computedValue (cost profit freight : Money) : Money := cost + profit + freight

/-- art. 4の3(1)(2)(3) — 申出があれば製造原価法を優先、なければ国内販売価格法。 -/
def customsValueArt4_3 (price : Money) (d : DomesticDeductions)
    (cost profit freight : Money) (useCostFirst : Bool) : Money :=
  if useCostFirst then computedValue cost profit freight
  else domesticSalesValue price d

-- ==== verified facts ====

theorem domesticDeductionsTotal_eq (d : DomesticDeductions) :
    domesticDeductionsTotal d =
      d.processingValue + d.commissionProfit + d.inlandFreight + d.domesticDuties := rfl

theorem computedValue_eq (cost profit freight : Money) :
    computedValue cost profit freight = cost + profit + freight := rfl

/-- 控除額が価格以下のとき、国内販売価格法は通常の減算と一致する。 -/
theorem domesticSalesValue_exact (price : Money) (d : DomesticDeductions)
    (_h : domesticDeductionsTotal d ≤ price) :
    domesticSalesValue price d = price - domesticDeductionsTotal d := rfl

/-- 控除額が価格以下のとき、結果は価格以下。 -/
theorem domesticSalesValue_le_price (price : Money) (d : DomesticDeductions)
    (h : domesticDeductionsTotal d ≤ price) :
    domesticSalesValue price d ≤ price := by
  rw [domesticSalesValue_exact _ _ h]
  exact Nat.sub_le _ _

/-- 申出があれば製造原価法が選ばれる。 -/
theorem art4_3_uses_cost_when_requested (price : Money) (d : DomesticDeductions)
    (cost profit freight : Money) :
    customsValueArt4_3 price d cost profit freight true = computedValue cost profit freight := rfl

/-- 申出がなければ国内販売価格法が選ばれる。 -/
theorem art4_3_uses_domestic_otherwise (price : Money) (d : DomesticDeductions)
    (cost profit freight : Money) :
    customsValueArt4_3 price d cost profit freight false = domesticSalesValue price d := rfl

-- ==== kernel-decided smoke checks ====

def sampleDeductions : DomesticDeductions := ⟨20_000, 30_000, 10_000, 40_000⟩
-- 控除合計 = 100,000
example : domesticDeductionsTotal sampleDeductions = 100_000 := by decide
-- 国内販売価格法: 1,000,000 - 100,000 = 900,000
example : domesticSalesValue 1_000_000 sampleDeductions = 900_000 := by decide
-- 製造原価法: 500,000 + 100,000 + 20,000 = 620,000
example : computedValue 500_000 100_000 20_000 = 620_000 := by decide
-- 申出あり → 製造原価法
example : customsValueArt4_3 1_000_000 sampleDeductions 500_000 100_000 20_000 true = 620_000 := by decide
-- 申出なし → 国内販売価格法
example : customsValueArt4_3 1_000_000 sampleDeductions 500_000 100_000 20_000 false = 900_000 := by decide
-- underflow
example : domesticSalesValue 50_000 sampleDeductions = 0 := by decide

end JapanTaxLaw
