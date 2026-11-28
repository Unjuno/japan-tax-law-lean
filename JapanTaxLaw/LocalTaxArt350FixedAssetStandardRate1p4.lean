import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt350FixedAssetStandardRate1p4 — 地方税法 art.350 固定資産税 標準税率 百分の一・四 bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  SHA-256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Norm unit NORM|527e14a2adf493f075ab9d9790a1ab1517f633697dad5d7e5186b94b48442153
  Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:350/Article#350/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語: 「固定資産税の標準税率は、百分の一・四とする。」

Computation（原文逐語から導出、標準税率スライスのみ、単位: 円）:
  rateNumerator := 1 * 10 + 4（一・四 = 1.4）
  rateDenominator := 100 * 10（百分率を 10 倍して小数を除く）= 1000
  rateApplied base := base * 14 / 1000

Scope / NOT MODELLED:
  - 税率の決定・課税標準・評価額・端数処理・超過課税は NOT MODELLED。
  - 本モデルは当該条の標準税率のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt350FixedAssetStandardRate1p4

/-- 原文の「一・四」を整数で表した分子。 -/
def rateNumerator : Nat := 1 * 10 + 4

/-- 百分率を 10 倍した分母（1000）。 -/
def rateDenominator : Nat := 100 * 10

/-- 標準税率 1.4% を適用した金額。 -/
def rateApplied (base : Nat) : Nat :=
  base * rateNumerator / rateDenominator

example : rateNumerator = 14 := by decide
example : rateDenominator = 1000 := by decide
example : rateApplied 0 = 0 := by decide
example : rateApplied 1000 = 14 := by decide
example : rateApplied 500 = 7 := by decide
example : rateApplied 499 = 6 := by decide

end JapanTaxLaw.LocalTaxArt350FixedAssetStandardRate1p4
