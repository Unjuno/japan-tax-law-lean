import JapanTaxLaw.TaxFinance

/-!
# SpecialTaxOrderArt80CapitalFeeFloor75k — 租税特別措置法施行令 art.80(3) 資本金×千分の三・五・7.5万円下限 bounded L4 モデル

Sources (pinned):
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json
  SHA-256: e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee
  Norm unit NORM|3c749ae7d86602ba664b1056ee0a012cc4d15b9798764d6035be801b0ab5c041
  Source path: LawBody[3]/MainProvision/MainProvision[5]/Article:80/Article#80/Paragraph#3/Item#1/ItemSentence/Column#2/Sentence#1

原文逐語:
  「当該株式会社の資本金の額に千分の三・五を乗じて計算した金額（当該金額が七万五千円に満たない場合には、申請件数一件につき七万五千円）」

Computation（原文逐語から導出、金額スライスのみ、単位: 円）:
  rateNumerator := 3 * 10 + 5（三・五 = 3.5）
  rateDenominator := 1000 * 10（千分率を 10 倍して小数を除く）
  computed := capital * rateNumerator / rateDenominator
  feePerApplication := if computed < 75000 then 75000 else computed

Scope / NOT MODELLED:
  - 株式会社の認定・申請件数の乗算・他の号・免除規定は NOT MODELLED。
  - 端数処理の法的確定は NOT MODELLED（自然数除算を仮定）。
  - 本モデルは computable slice のみ。人間による法的レビューは未了。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor75k

/-- 原文の「三・五」（3.5）を整数で表した分子。 -/
def rateNumerator : Nat := 3 * 10 + 5

/-- 千分率を 10 倍した分母（10000）。 -/
def rateDenominator : Nat := 1000 * 10

/-- 原文の下限（七万五千円）。 -/
def feeFloor : Nat := 75000

/-- 資本金に 3.5/1000 を乗じた金額（下限適用前）。 -/
def computedFee (capital : Nat) : Nat :=
  capital * rateNumerator / rateDenominator

/-- 一申請件当たりの手数料（七万五千円未満なら七万五千円）。 -/
def feePerApplication (capital : Nat) : Nat :=
  let v := computedFee capital
  if v < feeFloor then feeFloor else v

example : rateNumerator = 35 := by decide
example : feeFloor = 75000 := by decide
example : feePerApplication 0 = 75000 := by decide
example : computedFee 20_000_000 = 70000 := by decide
example : feePerApplication 20_000_000 = 75000 := by decide
example : computedFee 30_000_000 = 105000 := by decide
example : feePerApplication 30_000_000 = 105000 := by decide

end JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor75k
