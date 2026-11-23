import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt19_3ReexportSameStateCondition — 関税定率法 第十九条の三 CONDITION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|760c6bfcb0b3bc22f09624b5e53c32fb918c0b6587084cfe8b2fa44a7185b523
  Source path: LawBody[1]/MainProvision/MainProvision[34]/Article:19_3/Article#19_3/ArticleCaption
  Article caption: （輸入時と同一状態で再輸出される場合の戻し税等）

原文逐語（pinned, 一字一句改変なし）:
  「（輸入時と同一状態で再輸出される場合の戻し税等）」

Norm kind: CONDITION — this unit is the article caption (見出し) of 第十九条の三,
labeling the case CONDITION 「輸入時と同一状態で再輸出される場合」 and the relief 「戻し税等」.
The computable slice models the case discrimination and the listed relief kind.
Sub-terms are extracted structurally from the caption (not hand-typed). NOTE: a
caption is a heading, NOT the operative provisions; the substantive re-export
requirements, relief mechanics, 等 extensions and legal effect are NOT MODELLED.

Variable contract (meaning / domain / type):
  ExportCase : Type — reexportSameState (輸入時と同一状態で再輸出される場合) or other.
  Relief : Type — drawback (戻し税) or otherRelief.
  withinCondition : ExportCase -> Relief -> Bool — true iff the re-export case
    with the listed relief kind.
  No numeric amount/unit/dimension applies (structural CONDITION, not a formula).

Scope: only the caption's case/relief discrimination. Operative article text,
re-export mechanics, 等 ("etc.") extensions and legal correctness are NOT MODELLED.
Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt19_3ReexportSameStateCondition

/-- The case: goods re-exported in the same state as imported, or other. -/
inductive ExportCase : Type
  | reexportSameState : ExportCase
  | other : ExportCase

/-- The relief kind listed in the caption. -/
inductive Relief : Type
  | drawback : Relief
  | otherRelief : Relief

/-- The caption's case/relief combination: true for re-export with 戻し税. -/
def withinCondition (c : ExportCase) (r : Relief) : Bool :=
  match c with
  | ExportCase.reexportSameState =>
      match r with
      | Relief.drawback => true
      | Relief.otherRelief => false
  | ExportCase.other => false

/-- The re-export case is within the caption's condition for 戻し税. -/
theorem reexport_drawback_within :
    withinCondition ExportCase.reexportSameState Relief.drawback = true := rfl

/-- Other cases are outside. -/
theorem other_case_outside (r : Relief) :
    withinCondition ExportCase.other r = false := by
  cases r <;> rfl

/-- "等" extensions are outside the listed kind. -/
theorem other_relief_outside (c : ExportCase) :
    withinCondition c Relief.otherRelief = false := by
  cases c <;> rfl

end JapanTaxLaw.CustomsTariffArt19_3ReexportSameStateCondition
