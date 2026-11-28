import JapanTaxLaw.TaxFinance

/-!
# IncomeTaxOrderArt2_3Amount3500000 — 所得税法施行令 art.2の3 金額読替 300万→350万円 bounded L4 モデル

Sources (pinned):
  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json
  SHA-256: d0ad21a838fd3d2a3b107a001b91a31ee00c267dc776bcd608b0ef018cf5494d
  Norm unit NORM|b8dd90ec45e20b83917c7e823aa0ba42b97b16e881cfbc57f52e05307b7f5e29
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:2_3/Article#2_3/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語:
  「これらの規定中「三百万円」とあるのは、「三百五十万円」とする。」

Computation（原文逐語から導出、金額読替スライスのみ、単位: 円）:
  originalAmount := 3000000（三百万円）
  substitutedAmount := 3500000（三百五十万円）
  appliedAmount base := base + (substitutedAmount - originalAmount) = base + 500000

Scope / NOT MODELLED:
  - 法第三条の四の適用判定・施行令第40条/41条の他の規定は NOT MODELLED。
  - 本モデルは当該号の金額読替のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.IncomeTaxOrderArt2_3Amount3500000

/-- 読替前の金額（三百万円）。 -/
def originalAmount : Nat := 3000000

/-- 読替後の金額（三百五十万円）。 -/
def substitutedAmount : Nat := 3500000

/-- 読替による加算額（五十万円）。 -/
def addedAmount : Nat := substitutedAmount - originalAmount

/-- 読替後の金額（base に加算）。 -/
def appliedAmount (base : Nat) : Nat := base + addedAmount

example : originalAmount = 3000000 := by decide
example : substitutedAmount = 3500000 := by decide
example : addedAmount = 500000 := by decide
example : appliedAmount 0 = 500000 := by decide
example : appliedAmount 1000000 = 1500000 := by decide

end JapanTaxLaw.IncomeTaxOrderArt2_3Amount3500000
