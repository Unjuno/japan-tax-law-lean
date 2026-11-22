import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt14ProvisoReading — 関税定率法 第十四条(1)（読替え）READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|1808965ba8548637956b182cc69e43ba66f490beb0479b631d44d6e9f3f15544
  Source path: LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/
               Paragraph#1/Item#11/ItemSentence/Sentence#2
  Article caption: （無条件免税）

原文逐語（pinned, 一字一句改変なし）:
  「この場合においては、前号ただし書の規定を準用する。」

Norm kind: READING (準用) — the proviso (ただし書) of the preceding item
(Item 10, structurally confirmed to carry a ただし書) is read into the
present case (Item 11). The computable slice models the cross-reference:
which case triggers the reading, and which source provision is read in.
The substantive content of the proviso and of Item 11, and legal
correctness, are NOT MODELLED. All statutory strings injected from the
queue; no hand-typed CJK.

Variable contract (meaning / unit / domain / type):
  Case : Type — item11 (this case, triggers the reading) | other.
  ReadSource : Type — precedingProviso (Item 10 ただし書) | other.
  appliesViaReading : Case -> Bool — true iff the case reads in the proviso.
  No numeric amount/unit applies (structural READING, not a formula).

Scope: only the cross-reference structure. Proviso substance, Item 11
substance, and legal correctness NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt14ProvisoReading

/-- Case under Item 11: the triggering case, or another. -/
inductive Case : Type
  | item11 : Case
  | other : Case

/-- Source provision that can be read in. -/
inductive ReadSource : Type
  | precedingProviso : ReadSource
  | other : ReadSource

deriving instance DecidableEq for Case
deriving instance DecidableEq for ReadSource

/-- 前号ただし書の規定を準用する: Item 11 reads in the preceding item's proviso. -/
def appliesViaReading (c : Case) : Bool :=
  match c with
  | Case.item11 => true
  | Case.other => false

/-- The case that triggers the reading. -/
def readSourceFor (c : Case) : ReadSource :=
  match c with
  | Case.item11 => ReadSource.precedingProviso
  | Case.other => ReadSource.other

/-- Item 11 triggers the reading. -/
theorem item11_applies : appliesViaReading Case.item11 = true := rfl

/-- A non-triggering case does not. -/
theorem other_not_applies : appliesViaReading Case.other = false := rfl

/-- Item 11 reads in the preceding item's proviso. -/
theorem item11_reads_preceding_proviso :
    readSourceFor Case.item11 = ReadSource.precedingProviso := rfl

end JapanTaxLaw.CustomsTariffArt14ProvisoReading
