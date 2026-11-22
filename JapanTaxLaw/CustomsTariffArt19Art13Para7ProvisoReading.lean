import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt19Art13Para7ProvisoReading — 関税定率法 第十九条(4)（準用）READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|662ecdbb3874ed176834a6def2924dbe0518892f9339905e6ab3b3e442775462
  Source path: LawBody[1]/MainProvision/MainProvision[32]/Article:19/Article#19/
               Paragraph#4/ParagraphSentence/Sentence#2
  Article caption: （輸出貨物の製造用原料品の減税、免税又は戻し税等）

原文逐語（pinned, 一字一句改変なし）:
  「この場合においては、第十三条第七項但書の規定を準用する。」

Norm kind: READING — a 準用 (mutatis-mutandis application). In the trigger case
この場合, the provisions of 第十三条第七項但書 (the 但書 of article 13 paragraph 7)
are read in. The computable slice models which source provision applies, the
source article number (13), paragraph number (7), proviso flag, and the trigger
case. The statutory sub-terms 第十三条第七項但書 and この場合 are extracted from the
queue needle, never hand-typed; the source's own 但書 spelling is preserved.

Variable contract (meaning / domain / type):
  Provision : Type — the single source provision read in (art13Para7Proviso).
  TriggerCase : Type — thisCase (この場合) or other.
  appliesViaReading : TriggerCase -> Provision -> Prop — true iff thisCase.
  sourceArticle : Nat — 13.
  sourceParagraph : Nat — 7.
  sourceIsProviso : Bool — true (但書).
  No numeric amount/unit/dimension applies (structural cross-reference).

Scope: only the cross-reference structure. The substantive content of
第十三条第七項但書, the establishment of この場合, other reading rules, and legal
correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt19Art13Para7ProvisoReading

/-- The source provision read in: 第十三条第七項但書の規定. -/
inductive Provision : Type
  | art13Para7Proviso : Provision

deriving instance DecidableEq for Provision

/-- The trigger case: この場合 versus any other case. -/
inductive TriggerCase : Type
  | thisCase : TriggerCase
  | other : TriggerCase

deriving instance DecidableEq for TriggerCase

/-- Source article number 13. -/
def sourceArticle : Nat := 13

/-- Source paragraph number 7. -/
def sourceParagraph : Nat := 7

/-- The source provision is a proviso (但書). -/
def sourceIsProviso : Bool := true

/-- 準用: the source provision applies iff the trigger is この場合. -/
def appliesViaReading (c : TriggerCase) (_p : Provision) : Prop :=
  c = TriggerCase.thisCase

/-- The source article is 13. -/
theorem source_article_is_13 : sourceArticle = 13 := rfl

/-- The source paragraph is 7. -/
theorem source_paragraph_is_7 : sourceParagraph = 7 := rfl

/-- The source provision is a proviso. -/
theorem source_is_proviso : sourceIsProviso = true := rfl

/-- The reading applies in この場合. -/
theorem applies_in_this_case :
    appliesViaReading TriggerCase.thisCase Provision.art13Para7Proviso := rfl

/-- The reading does not apply outside この場合. -/
theorem not_applies_in_other :
    ¬ appliesViaReading TriggerCase.other Provision.art13Para7Proviso := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt19Art13Para7ProvisoReading
