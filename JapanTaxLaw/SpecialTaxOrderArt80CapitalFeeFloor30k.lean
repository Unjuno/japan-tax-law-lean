import JapanTaxLaw.TaxFinance

/-!
# SpecialTaxOrderArt80CapitalFeeFloor30k — 租税特別措置法施行令 art.80(3) 合同会社 資本金×千分の三・五・3万円下限 bounded L4 モデル

Sources (pinned):
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json
  SHA-256: e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee
  Norm unit NORM|f68289a0ad457178ebc418c4595a43652a810f12665d1b5668da1646aad050d6
  Source path: LawBody[3]/MainProvision/MainProvision[5]/Article:80/Article#80/Paragraph#3/Item#2/ItemSentence/Column#2/Sentence#1

原文逐語:
  「当該合同会社の資本金の額に千分の三・五を乗じて計算した金額（当該金額が三万円に満たない場合には、申請件数一件につき三万円）」

Computation（原文逐語から導出、金額スライスのみ、単位: 円）:
  rateNumerator := 3 * 10 + 5（三・五 = 3.5）
  rateDenominator := 1000 * 10（千分率を 10 倍して小数を除く）
  computed := capital * rateNumerator / rateDenominator
  feePerApplication := if computed < 30000 then 30000 else computed

Scope / NOT MODELLED:
  - 本モデルは第2号（合同会社・下限三万円）のみ。第1号（株式会社・下限七万五千円）は
    別モデル（SpecialTaxOrderArt80CapitalFeeFloor75k）で扱う。
  - 合同会社の認定・申請件数の乗算・他号・免除・端数処理の法的確定は NOT MODELLED。
  - 本モデルは computable slice のみ。人間による法的レビューは未了。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor30k

/-- 原文の「三・五」（3.5）を整数で表した分子。 -/
def rateNumerator : Nat := 3 * 10 + 5

/-- 千分率を 10 倍した分母（10000）。 -/
def rateDenominator : Nat := 1000 * 10

/-- 原文の下限（三万円）。 -/
def feeFloor : Nat := 30000

/-- 資本金に 3.5/1000 を乗じた金額（下限適用前）。 -/
def computedFee (capital : Nat) : Nat :=
  capital * rateNumerator / rateDenominator

/-- 一申請件当たりの手数料（三万円未満なら三万円）。 -/
def feePerApplication (capital : Nat) : Nat :=
  let v := computedFee capital
  if v < feeFloor then feeFloor else v

example : feeFloor = 30000 := by decide
example : feePerApplication 0 = 30000 := by decide
example : computedFee 10_000_000 = 35000 := by decide
example : feePerApplication 10_000_000 = 35000 := by decide
example : computedFee 1_000_000 = 3500 := by decide
example : feePerApplication 1_000_000 = 30000 := by decide

end JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor30k
