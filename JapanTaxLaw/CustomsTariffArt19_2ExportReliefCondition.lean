import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt19_2ExportReliefCondition — 関税定率法 第十九条の二 CONDITION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|94f8ac863c981996cb5c2c94d16ae32907d432241027cf14c7a43894887c873a
  Source path: LawBody[1]/MainProvision/MainProvision[33]/Article:19_2/Article#19_2/ArticleCaption
  Article caption: （課税原料品等による製品を輸出した場合の免税又は戻し税等）

原文逐語（pinned, 一字一句改変なし）:
  「（課税原料品等による製品を輸出した場合の免税又は戻し税等）」

Norm kind: CONDITION — this unit is the article caption (見出し) of 第十九条の二,
which labels the case CONDITION 「課税原料品等による製品を輸出した場合」 and the relief kinds 免税 or
戻し税 (等). The computable slice models the case discrimination and the two
enumerated relief kinds. The sub-terms are extracted structurally from the
caption (not hand-typed). NOTE: a caption is a heading, NOT the operative
provisions of the article; the substantive relief mechanics and legal effect
are NOT MODELLED.

Variable contract (meaning / domain / type):
  ProductCase : Type — exportCase (課税原料品等による製品を輸出した場合) or other.
  Relief : Type — exemption (免税), drawback (戻し税), or otherRelief.
  withinCondition : ProductCase -> Relief -> Bool — true iff the export case
    and one of the two listed relief kinds.
  No numeric amount/unit/dimension applies (structural CONDITION, not a formula).

Scope: only the caption's case/relief discrimination. The operative article text,
substantive relief mechanics, 等 ("etc.") extensions and legal correctness are
NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt19_2ExportReliefCondition

/-- The case: products exported as described in the caption, or other. -/
inductive ProductCase : Type
  | exportCase : ProductCase
  | other : ProductCase

/-- The relief kinds listed in the caption. -/
inductive Relief : Type
  | exemption : Relief
  | drawback : Relief
  | otherRelief : Relief

/-- The caption's case/relief combination: true for exportCase with 免税 or 戻し税. -/
def withinCondition (c : ProductCase) (r : Relief) : Bool :=
  match c with
  | ProductCase.exportCase =>
      match r with
      | Relief.exemption => true
      | Relief.drawback => true
      | Relief.otherRelief => false
  | ProductCase.other => false

/-- The export case is within the caption's condition for 免税. -/
theorem export_exemption_within :
    withinCondition ProductCase.exportCase Relief.exemption = true := rfl

/-- The export case is within the caption's condition for 戻し税. -/
theorem export_drawback_within :
    withinCondition ProductCase.exportCase Relief.drawback = true := rfl

/-- Other cases are outside. -/
theorem other_case_outside (r : Relief) :
    withinCondition ProductCase.other r = false := by
  cases r <;> rfl

/-- "等" extensions are outside the two enumerated kinds. -/
theorem other_relief_outside (c : ProductCase) :
    withinCondition c Relief.otherRelief = false := by
  cases c <;> rfl

end JapanTaxLaw.CustomsTariffArt19_2ExportReliefCondition
