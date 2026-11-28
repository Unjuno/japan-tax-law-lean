import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt71_28DividendTaxRate5Percent — 地方税法 art.71の28 配当割税率 百分の五 bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  SHA-256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Norm unit NORM|3449d8491f297f99802b2d1c6b17cb08f00c88da84771414f1fda5d9b12467f7
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:71_28/Article#71_28/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語: 「配当割の税率は、百分の五とする。」

Computation（原文逐語から導出、税率スライスのみ、単位: 円）:
  numerator := 5（五）
  denominator := 100（百分の）
  statutory rate = 5 / 100 = 1 / 20
  dividendTax base := base * numerator / denominator

Scope / NOT MODELLED:
  - 配当割の課税標準の算定・他条項の税率・軽減措置は NOT MODELLED。
  - 本モデルは当該項の税率のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt71_28DividendTaxRate5Percent

/-- 分子（五）。 -/
def numerator : Nat := 5

/-- 分母（百分の）。 -/
def denominator : Nat := 100

/-- 税率 5/100 を base に適用（先乗り後割り、整数端数は切り捨て）。 -/
def dividendTax (base : Nat) : Nat := base * numerator / denominator

example : dividendTax 0 = 0 := by decide
example : dividendTax 100 = 5 := by decide
example : dividendTax 1000 = 50 := by decide
example : dividendTax 101 = 5 := by decide

end JapanTaxLaw.LocalTaxArt71_28DividendTaxRate5Percent
