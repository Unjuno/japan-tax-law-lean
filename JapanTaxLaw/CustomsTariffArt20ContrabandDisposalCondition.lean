import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt20ContrabandDisposalCondition — 関税定率法 第二十条 CONDITION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|6c30cf8dbebe8cce20c0fcc0c11f69394a2c8dab5b47cd3d1c36c2b6fa7d4e1b
  Source path: LawBody[1]/MainProvision/MainProvision[35]/Article:20/Article#20/ArticleCaption
  Article caption: （違約品等の再輸出又は廃棄の場合の戻し税等）

原文逐語（pinned, 一字一句改変なし）:
  「（違約品等の再輸出又は廃棄の場合の戻し税等）」

Norm kind: CONDITION — this unit is the article caption (見出し) of 第二十条,
labeling a disjunctive case (再輸出 又は 廃棄) for goods 違約品等,
with the listed relief 戻し税等. The computable slice models the two-case
disjunction and the listed relief kind. Sub-terms are extracted structurally
from the caption (not hand-typed). NOTE: a caption is a heading, NOT the operative
provisions; substantive drawback mechanics, the definition of 違約品等 and legal
effect are NOT MODELLED.

Variable contract (meaning / domain / type):
  GoodsCase : Type — reexport (再輸出), disposal (廃棄), or other.
  withinCondition : GoodsCase -> Bool — true for either listed case (the 又は
    disjunction), false otherwise.
  No numeric amount/unit/dimension applies (structural CONDITION, not a formula).

Scope: only the caption's disjunctive-case discrimination. Operative article text,
drawback mechanics, 等 ("etc.") extensions and legal correctness are NOT MODELLED.
Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt20ContrabandDisposalCondition

/-- The disjunctive case from the caption. -/
inductive GoodsCase : Type
  | reexport : GoodsCase
  | disposal : GoodsCase
  | other : GoodsCase

/-- The caption's disjunctive condition: true for 再輸出 or 廃棄. -/
def withinCondition (c : GoodsCase) : Bool :=
  match c with
  | GoodsCase.reexport => true
  | GoodsCase.disposal => true
  | GoodsCase.other => false

/-- 再輸出 is within the caption's condition. -/
theorem reexport_within : withinCondition GoodsCase.reexport = true := rfl

/-- 廃棄 is within the caption's condition. -/
theorem disposal_within : withinCondition GoodsCase.disposal = true := rfl

/-- Other cases are outside. -/
theorem other_outside : withinCondition GoodsCase.other = false := rfl

end JapanTaxLaw.CustomsTariffArt20ContrabandDisposalCondition
