import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt13Para7ProvisoException — 関税定率法 第十七条(5)（準用）EXCEPTION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|13bac8bcfa07d6e3fcf0861aea41480df8ba7093311535bdf2e8e81a95a78304
  Source path: LawBody[1]/MainProvision/MainProvision[30]/Article:17/Article#17/
               Paragraph#5/ParagraphSentence/Sentence#1
  Article caption: （再輸出免税）

原文逐語（pinned, 一字一句改変なし）:
  「第十三条第七項ただし書の規定は、前項の規定により関税を徴収する場合について準用する。」

Norm kind: EXCEPTION — the proviso (ただし書) of 第十三条第七項 is read in (準用)
for the case 前項の規定により関税を徴収する場合 (duty collected under the preceding
paragraph). The computable slice models the source provision identity (article 13,
paragraph 7, proviso), and which trigger case the exception applies in. Numbers
13 and 7 and the proviso marker are extracted from the verbatim needle; the
trigger is 前項の規定により関税を徴収する場合. All statutory strings from the queue;
no hand-typed CJK.

Variable contract (meaning / domain / type):
  CollectionCase : Type — prevParaCollection (前項の規定により関税を徴収する場合)
    or other.
  withinException : CollectionCase -> Bool — true iff the exception applies in
    that case (the ただし書 is read in only for the preceding-paragraph collection).
  sourceArticle : Nat — 13 (第十三条).
  sourceParagraph : Nat — 7 (第七項).
  sourceIsProviso : Bool — true (ただし書).
  No numeric amount/unit/dimension applies (structural EXCEPTION, not a formula).

Scope: only the source provision identity and the trigger-case discrimination.
The substantive content of 第十三条第七項ただし書 and 前項, how the duty is collected,
other articles and legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt13Para7ProvisoException

/-- The trigger case: duty collected under the preceding paragraph, or other. -/
inductive CollectionCase : Type
  | prevParaCollection : CollectionCase
  | other : CollectionCase

deriving instance DecidableEq for CollectionCase

/-- The exception (第十三条第七項ただし書) applies only in the preceding-paragraph
    duty-collection case. -/
def withinException (c : CollectionCase) : Bool :=
  match c with
  | CollectionCase.prevParaCollection => true
  | CollectionCase.other => false

/-- Source article number 13, from 第十三条. -/
def sourceArticle : Nat := 13

/-- Source paragraph number 7, from 第七項. -/
def sourceParagraph : Nat := 7

/-- The source provision is a proviso (ただし書). -/
def sourceIsProviso : Bool := true

/-- The source article is 13. -/
theorem source_article_is_13 : sourceArticle = 13 := rfl

/-- The source paragraph is 7. -/
theorem source_paragraph_is_7 : sourceParagraph = 7 := rfl

/-- The source provision is a proviso. -/
theorem source_is_proviso : sourceIsProviso = true := rfl

/-- The exception applies in the preceding-paragraph collection case. -/
theorem applies_to_prev_collection :
    withinException CollectionCase.prevParaCollection = true := rfl

/-- The exception does not apply in any other case. -/
theorem not_applies_to_other : withinException CollectionCase.other = false := rfl

end JapanTaxLaw.CustomsTariffArt13Para7ProvisoException
