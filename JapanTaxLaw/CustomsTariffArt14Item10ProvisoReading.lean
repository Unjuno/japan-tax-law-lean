import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt14Item10ProvisoReading — 関税定率法 第十四条(1) READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|490be20c34299cb9ee5c87382e21241fd3926621fe4583fabc1dd631efcecddb
  Source path: LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/
               Paragraph#1/Item#14/ItemSentence/Sentence#2
  Article caption: （無条件免税）

原文逐語（pinned, 一字一句改変なし）:
  「この場合においては、第十号ただし書の規定を準用する。」

Norm kind: READING (準用) — the proviso (ただし書) of Item 10 is read into the
case of Item 14. The computable slice models the cross-reference: which case
triggers the reading and which source provision is read in. The substantive
contents of Item 14 and of the Item 10 proviso, and legal correctness, are
NOT MODELLED. All statutory strings injected from the queue; no hand-typed CJK.

Variable contract (meaning / unit / domain / type):
  Case : Type — item14 (the triggering case) | other.
  ReadSource : Type — item10Proviso | other.
  appliesViaReading : Case -> Bool — true iff the case reads in the proviso.
  readSourceFor : Case -> ReadSource — the source read in for the case.
  No numeric amount/unit applies (structural READING, not a formula).

Scope: only the cross-reference structure. Item substance and legal
correctness NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt14Item10ProvisoReading

/-- Case under Item 14: the triggering case, or another. -/
inductive Case : Type
  | item14 : Case
  | other : Case

/-- Source provision that can be read in. -/
inductive ReadSource : Type
  | item10Proviso : ReadSource
  | other : ReadSource

deriving instance DecidableEq for Case
deriving instance DecidableEq for ReadSource

/-- 第十号ただし書の規定を準用する: Item 14 reads in Item 10's proviso. -/
def appliesViaReading (c : Case) : Bool :=
  match c with
  | Case.item14 => true
  | Case.other => false

/-- The source read in for each case. -/
def readSourceFor (c : Case) : ReadSource :=
  match c with
  | Case.item14 => ReadSource.item10Proviso
  | Case.other => ReadSource.other

/-- Item 14 triggers the reading. -/
theorem item14_applies : appliesViaReading Case.item14 = true := rfl

/-- A non-triggering case does not. -/
theorem other_not_applies : appliesViaReading Case.other = false := rfl

/-- Item 14 reads in Item 10's proviso. -/
theorem item14_reads_item10_proviso :
    readSourceFor Case.item14 = ReadSource.item10Proviso := rfl

end JapanTaxLaw.CustomsTariffArt14Item10ProvisoReading
