import JapanTaxLaw.TaxFinance

/-!
# TariffLawSupplArt1Heisei13Enforcement — 関税定率法 附則 art.1（平成13年1月6日施行・2条3条除外）bounded L4 モデル

Sources (pinned):
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  SHA-256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Norm unit NORM|285a2327fbd95c1e372e85530384f5e7a1aff1e04c88dbee1fc1fa8ff92402be
  Source path: LawBody[66]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語:
  「この法律（第二条及び第三条を除く。）は、平成十三年一月六日から施行する。」

Computation（原文逐語から導出、施行日・除外スライスのみ）:
  enforcementDate := (平成13, 1, 6) — 元号は caller-established、
    数値は原文の 十三 / 一 / 六 をそのまま使用。
  appliesToArticle n := !(n = 2 || n = 3)（第二条・第三条は除く）

Scope / NOT MODELLED:
  - 他条の施行日、経過措置、改正の内容、元号から西暦への換算は NOT MODELLED。
  - 本モデルは computable slice のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TariffLawSupplArt1Heisei13Enforcement

/-- 原文の「十三 / 一 / 六」を元号内年月日として保持（西暦換算は NOT MODELLED）。 -/
def enforcementEraDate : Nat × Nat × Nat := (13, 1, 6)

/-- 原文の「第二条及び第三条を除く」に対応する除外条番号。 -/
def excludedArticleA : Nat := 2

def excludedArticleB : Nat := 3

/-- 付則 art.1 の施行規定が当該条に適用されるか。 -/
def appliesToArticle (n : Nat) : Bool :=
  ! (n == excludedArticleA || n == excludedArticleB)

example : enforcementEraDate = (13, 1, 6) := by decide
example : appliesToArticle 1 = true := by decide
example : appliesToArticle 2 = false := by decide
example : appliesToArticle 3 = false := by decide
example : appliesToArticle 4 = true := by decide

end JapanTaxLaw.TariffLawSupplArt1Heisei13Enforcement
