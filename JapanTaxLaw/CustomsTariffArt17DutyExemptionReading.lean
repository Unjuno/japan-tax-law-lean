import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt17DutyExemptionReading — 関税定率法 第十七条(2) READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|760484ebb1fe349e9ed493fddb34acc8ef4aace8f5092589dfcf179c2f827d25
  Source path: LawBody[1]/MainProvision/MainProvision[30]/Article:17/Article#17/
               Paragraph#2/ParagraphSentence/Sentence#1
  Article caption: （再輸出免税）

原文逐語（pinned, 一字一句改変なし）:
  「第十三条第三項の規定は、前項の規定により関税を免除する場合について準用する。」

Norm kind: READING (準用) — the provisions of Article 13 paragraph 3 are read
into the case where customs duty is exempted under the preceding paragraph
(Paragraph 1 of this Article). The computable slice models the cross-reference:
which case triggers the reading and which source provision is read in. The
substantive content of Article 13(3), the exemption, and legal correctness are
NOT MODELLED. All statutory strings injected from the queue; no hand-typed CJK.

Variable contract (meaning / unit / domain / type):
  Case : Type — dutyExempted (the preceding-paragraph case) | other.
  ReadSource : Type — article13Para3 | other.
  appliesViaReading : Case -> Bool — true iff the case reads in the source.
  readSourceFor : Case -> ReadSource — the source read in for the case.
  No numeric amount/unit applies (structural READING, not a formula).

Scope: only the cross-reference structure. Article 13(3) substance, the
exemption, and legal correctness NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt17DutyExemptionReading

/-- Case under the preceding paragraph: duty exempted, or another. -/
inductive Case : Type
  | dutyExempted : Case
  | other : Case

/-- Source provision that can be read in. -/
inductive ReadSource : Type
  | article13Para3 : ReadSource
  | other : ReadSource

deriving instance DecidableEq for Case
deriving instance DecidableEq for ReadSource

/-- 準用: the exemption case reads in Article 13(3). -/
def appliesViaReading (c : Case) : Bool :=
  match c with
  | Case.dutyExempted => true
  | Case.other => false

/-- The source read in for each case. -/
def readSourceFor (c : Case) : ReadSource :=
  match c with
  | Case.dutyExempted => ReadSource.article13Para3
  | Case.other => ReadSource.other

/-- The exemption case triggers the reading. -/
theorem dutyExempted_applies : appliesViaReading Case.dutyExempted = true := rfl

/-- A non-triggering case does not. -/
theorem other_not_applies : appliesViaReading Case.other = false := rfl

/-- The exemption case reads in Article 13(3). -/
theorem dutyExempted_reads_article13 :
    readSourceFor Case.dutyExempted = ReadSource.article13Para3 := rfl

end JapanTaxLaw.CustomsTariffArt17DutyExemptionReading
