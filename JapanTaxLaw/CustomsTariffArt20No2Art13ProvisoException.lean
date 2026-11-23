import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt20No2Art13ProvisoException — 関税定率法 第二十条の二(3)（準用）EXCEPTION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|04057a73ecf3e5e7f56460b7b280eee517956be5c9b69d8d845cfed58189c76f
  Source path: LawBody[1]/MainProvision/MainProvision[36]/Article:20_2/Article#20_2/
               Paragraph#3/ParagraphSentence/Sentence#2
  Article caption: （軽減税率適用貨物の用途外使用の制限等）

原文逐語（pinned, 一字一句改変なし）:
  「この場合においては、第十三条第七項ただし書の規定を準用する。」

Norm kind: EXCEPTION — the proviso (ただし書) of 第十三条第七項 is read in (準用)
for the trigger case この場合, here in article 第二十条の二(3). The computable
slice models the source provision identity (article 13, paragraph 7, proviso)
and the trigger-case discrimination. Sub-terms 第十三条第七項ただし書 and この場合 are
extracted from the queue needle, never hand-typed. This is a distinct norm unit
from the 第十七条(5) application of the same proviso (different article/path/id).

Variable contract (meaning / domain / type):
  Trigger : Type — thisCase (この場合) or other.
  withinException : Trigger -> Bool — true iff the exception applies in that case.
  sourceArticle : Nat — 13; sourceParagraph : Nat — 7; sourceIsProviso : Bool — true.
  No numeric amount/unit/dimension applies (structural EXCEPTION, not a formula).

Scope: only source provision identity and trigger-case discrimination. Substantive
content of 第十三条第七項ただし書 and この場合, how the underlying duty case arises,
other articles and legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt20No2Art13ProvisoException

/-- The trigger case: この場合 versus any other case. -/
inductive Trigger : Type
  | thisCase : Trigger
  | other : Trigger

deriving instance DecidableEq for Trigger

/-- The exception (第十三条第七項ただし書) applies only in the この場合 case. -/
def withinException (tr : Trigger) : Bool :=
  match tr with
  | Trigger.thisCase => true
  | Trigger.other => false

/-- Source article number 13. -/
def sourceArticle : Nat := 13

/-- Source paragraph number 7. -/
def sourceParagraph : Nat := 7

/-- The source provision is a proviso (ただし書). -/
def sourceIsProviso : Bool := true

/-- The source article is 13. -/
theorem source_article_is_13 : sourceArticle = 13 := rfl

/-- The source paragraph is 7. -/
theorem source_paragraph_is_7 : sourceParagraph = 7 := rfl

/-- The source provision is a proviso. -/
theorem source_is_proviso : sourceIsProviso = true := rfl

/-- The exception applies in この場合. -/
theorem applies_in_this_case : withinException Trigger.thisCase = true := rfl

/-- The exception does not apply outside この場合. -/
theorem not_applies_in_other : withinException Trigger.other = false := rfl

end JapanTaxLaw.CustomsTariffArt20No2Art13ProvisoException
