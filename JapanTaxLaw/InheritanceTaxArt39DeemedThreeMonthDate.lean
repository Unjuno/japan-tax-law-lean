import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt39DeemedThreeMonthDate — 相続税法 art.39(6) 提出日未記載時 3か月後とみなす bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  SHA-256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Norm unit NORM|5336c555bfcfbde8a24af7cb064a7e8373d3ad4e30ec52c611b0be01eb9686ad
  Source path: LawBody[3]/MainProvision/MainProvision[5]/Article:39/Article#39/Paragraph#6/ParagraphSentence/Sentence#2

原文逐語:
  「当該提出する日が記載されていないときは、当該提出期限の翌日から起算して三月を経過する日が記載されているものとみなす。」

Computation（原文逐語から導出、みなし期間スライスのみ、単位: 月）:
  defaultMonths := 3（三月）
  deemedMonth startingMonth := startingMonth + 3

Scope / NOT MODELLED:
  - 暦上の月加算（日数・閏年・月末）の具体計算は NOT MODELLED。
  - 提出期限の認定・他の号のみなし規定は NOT MODELLED。
  - 本モデルは当該号の「3か月」というみなし期間のみ。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt39DeemedThreeMonthDate

/-- 原文のみなし期間（三月）。 -/
def defaultMonths : Nat := 3

/-- 提出期限内に記載がない場合のみなし月（起算月 + 3）。 -/
def deemedMonth (startingMonth : Nat) : Nat :=
  startingMonth + defaultMonths

example : defaultMonths = 3 := by decide
example : deemedMonth 0 = 3 := by decide
example : deemedMonth 1 = 4 := by decide
example : deemedMonth 12 = 15 := by decide

end JapanTaxLaw.InheritanceTaxArt39DeemedThreeMonthDate
