import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt8DecisionWithin60Days — 地方税法 art.8(2) 申出から60日以内の決定 bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  SHA-256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Norm unit NORM|8c22b360d1401604dcf17859a3d1b5c7f920fd4b1b7d9985cf7bba52bc338b8f
  Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:8/Article#8/Paragraph#2/ParagraphSentence/Sentence#1

原文逐語（当該スライス）:
  「その申出を受けた日から六十日以内に決定をし」

Computation（原文逐語から導出、期間スライスのみ、単位: 日）:
  limitDays := 60（六十日以内、当日を含む）
  withinLimit elapsedDays := elapsedDays <= 60

Scope / NOT MODELLED:
  - 決定の内容・遅滞なき通知義務・申出の認定・他項は NOT MODELLED。
  - 本モデルは当該項の60日以内という期間判定のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt8DecisionWithin60Days

/-- 原文の上限（六十日、含む）。 -/
def limitDays : Nat := 60

/-- 申出を受けた日からの経過日数が60日以内か。 -/
def withinLimit (elapsedDays : Nat) : Bool :=
  elapsedDays <= limitDays

example : withinLimit 0 = true := by decide
example : withinLimit 59 = true := by decide
example : withinLimit 60 = true := by decide
example : withinLimit 61 = false := by decide

end JapanTaxLaw.LocalTaxArt8DecisionWithin60Days
