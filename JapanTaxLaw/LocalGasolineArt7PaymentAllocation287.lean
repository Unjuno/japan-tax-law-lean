import JapanTaxLaw.TaxFinance

/-!
# LocalGasolineArt7PaymentAllocation287 — 地方揮発油税法 art.7(2) 納付額の44/287・243/287 配分 bounded L4 モデル

Sources (pinned):
  Law id: 330AC0000000104
  Revision: 330AC0000000104_20260401_508AC0000000012
  Raw snapshot: data/raw/330AC0000000104_20260401_508AC0000000012.law.json
  SHA-256: c37f8a705911e90745b865522b1040e3ede192c0a3fee7bbb95727320bc9900a
  Norm unit NORM|065835c8b2504ddacb65ce19d0dd45461f283d437bd1dc26f9785923b44cee6c
  Source path: LawBody[1]/MainProvision/MainProvision[6]/Article:7/Article#7/Paragraph#2/ParagraphSentence/Sentence#1

原文逐語:
  「…その納付に係る金額の二百八十七分の四十四に相当する税額の地方揮発油税及び
   二百八十七分の二百四十三に相当する税額の揮発油税の納付があつたものとする。」

Computation（原文逐語から導出、配分スライスのみ、単位: 円）:
  localShare amount := amount * 44 / 287（二百八十七分の四十四）
  nationalShare amount := amount * 243 / 287（二百八十七分の二百四十三）
  44 + 243 = 287（配分比の合計は 1）

Scope / NOT MODELLED:
  - 免除の要件・国税徴収の手続・端数処理の法的確定は NOT MODELLED。
  - 本モデルは当該号の配分計算のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalGasolineArt7PaymentAllocation287

open JapanTaxLaw.TaxFinance

/-- 配分の分母（二百八十七）。 -/
def allocationDenominator : Nat := 287

/-- 地方揮発油税の分子（四十四）。 -/
def localNumerator : Nat := 44

/-- 揮発油税の分子（二百四十三）。 -/
def nationalNumerator : Nat := 243

/-- 地方揮発油税分。 -/
def localShare (amount : Money) : Money :=
  amount * localNumerator / allocationDenominator

/-- 揮発油税分。 -/
def nationalShare (amount : Money) : Money :=
  amount * nationalNumerator / allocationDenominator

example : localNumerator + nationalNumerator = allocationDenominator := by decide
example : localShare 0 = 0 := by decide
example : localShare 287 = 44 := by decide
example : nationalShare 287 = 243 := by decide
example : localShare 574 = 88 := by decide
example : nationalShare 574 = 486 := by decide

end JapanTaxLaw.LocalGasolineArt7PaymentAllocation287
