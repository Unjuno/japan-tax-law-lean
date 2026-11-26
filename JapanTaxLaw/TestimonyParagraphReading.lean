import JapanTaxLaw.TaxFinance

/-
# TestimonyParagraphReading — 緊急関税等政令 第四条第九項（証言への準用範囲）

Pinned source:
  Law id: 406CO0000000417 (緊急関税等に関する政令)
  Revision: 406CO0000000417_20090401_421CO0000000110
  Raw snapshot: data/raw/406CO0000000417_20090401_421CO0000000110.law.json
  Article: 第四条 (art. 4), 第九項
  Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#9/ParagraphSentence/Sentence
  Normative unit id: NORM|4c66461b6da05db32699c67a5c83ace8dccab229a4875abc3563bcd8458ee246

原文逐語（pinned, verbatim, READING）:
  「第四項から前項までの規定は、第一項前段又は第二項前段の規定によりされた証言について準用する。」

Variable contract:
  `paragraph : Nat` is a paragraph number in the same article. Unit: a
  paragraph index; domain: Nat. `appliesToTestimony` is true exactly for the
  two cited paragraphs 第一項前段 (1) and 第二項前段 (2); every other paragraph
  is false. The numerals are paragraph labels, not amounts.

Scope: ONLY the selection of the two testimony paragraphs for the
mutatis-mutandis application of 第四項から前項まで is modelled. The content of
those provisions, the testimony itself and all other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.TestimonyParagraphReading

/-- 「第一項前段又は第二項前段の規定によりされた証言」: the two cited paragraphs. -/
def appliesToTestimony : Nat → Bool
  | 0 => false
  | 1 => true
  | 2 => true
  | Nat.succ (Nat.succ (Nat.succ _)) => false

theorem first_applies : appliesToTestimony 1 = true := rfl

theorem second_applies : appliesToTestimony 2 = true := rfl

theorem third_not_applies : appliesToTestimony 3 = false := rfl

end JapanTaxLaw.TestimonyParagraphReading
