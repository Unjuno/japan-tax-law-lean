import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffUndertakingValidity5Years — 関税定率法 art.7(9)（約束の有効期間五年以内）bounded L4 モデル

Sources (pinned):
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  SHA-256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Norm unit NORM|13945f71facc715d46bd08d54afc28d82c0d96199e9bf377929c237f5fac4c68
  Source path: LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#9/ParagraphSentence/Sentence#1

原文逐語:
  「政府は、…その約束（有効期間が五年以内のものに限る。）を受諾することができる。」

Computation（原文逐語から導出、有効期間スライスののみ、単位: 年）:
  validityYears : Nat — 約束の有効期間（caller-established）
  maxValidityYears := 5（五年以内）
  undertakingAcceptable validityYears := validityYears <= 5

Scope / NOT MODELLED:
  - 「十分な証拠により…推定することができるとき」の認定、補助金・損害の
    事実認定、約束の内容・受諾手続は NOT MODELLED。
  - 本モデルは computable slice のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffUndertakingValidity5Years

/-- 約束の有効期間の上限（五年）。 -/
def maxValidityYears : Nat := 5

/-- 有効期間が五年以内なら受諾の期間要件を満たす。 -/
def undertakingAcceptable (validityYears : Nat) : Bool :=
  validityYears <= maxValidityYears

example : maxValidityYears = 5 := by decide
example : undertakingAcceptable 0 = true := by decide
example : undertakingAcceptable 4 = true := by decide
example : undertakingAcceptable 5 = true := by decide
example : undertakingAcceptable 6 = false := by decide

end JapanTaxLaw.CustomsTariffUndertakingValidity5Years
