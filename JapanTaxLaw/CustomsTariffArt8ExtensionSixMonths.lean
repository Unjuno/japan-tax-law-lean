import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt8ExtensionSixMonths — 関税定率法 art.8(6)（六月以内の延長）bounded L4 モデル

Sources (pinned):
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  SHA-256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Norm unit NORM|be1c578ad7cfe765b82138b1177a0b7e0e10d864acd23722001e4e78dec592ad
  Source path: LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#6/ParagraphSentence/Sentence#2

原文逐語:
  「ただし、特別の理由により必要があると認められる場合には、その期間を六月以内に限り延長することができる。」

Computation（原文逐語から導出、期間上限スライスのみ、単位: 月）:
  extensionMonths : Nat — 延長しようとする期間（caller-established）
  limitMonths := 6（六月以内）
  extensionAllowed extensionMonths := extensionMonths <= 6

Scope / NOT MODELLED:
  - 「特別の理由により必要があると認められる場合」の認定は NOT MODELLED。
  - 他項の延長期間、延長の手続・効果は NOT MODELLED。
  - 本モデルは computable slice のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt8ExtensionSixMonths

/-- 六月（延長期間の上限）。 -/
def limitMonths : Nat := 6

/-- 六月以内の延長が可能か。 -/
def extensionAllowed (extensionMonths : Nat) : Bool :=
  extensionMonths <= limitMonths

example : limitMonths = 6 := by decide
example : extensionAllowed 0 = true := by decide
example : extensionAllowed 5 = true := by decide
example : extensionAllowed 6 = true := by decide
example : extensionAllowed 7 = false := by decide
example : extensionAllowed 12 = false := by decide

end JapanTaxLaw.CustomsTariffArt8ExtensionSixMonths
