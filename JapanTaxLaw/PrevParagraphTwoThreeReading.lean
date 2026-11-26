import JapanTaxLaw.TaxFinance

/-
# PrevParagraphTwoThreeReading — 米軍地位協定臨時特例法施行令 第三条の二第二項（前条二・三項準用）

Pinned source:
  Law id: 327CO0000000124
  Law title: 日本国とアメリカ合衆国との間の相互協力及び安全保障条約第六条に基づく施設及び区域並びに日本国における合衆国軍隊の地位に関する協定の実施に伴う所得税法等の臨時特例に関する法律施行令
  Revision: 327CO0000000124_20220401_502CO0000000207
  Snapshot: data/raw/327CO0000000124_20220401_502CO0000000207.law.json
  Article: 第三条の二 (art. 3_2), 第二項, 第一文
  Source path: LawBody[2]/MainProvision/MainProvision[4]/Article:3_2/Article#3_2/Paragraph#2/ParagraphSentence/Sentence#1
  Normative unit id: NORM|f5c77990c05347b811f25f06e69bdcd06f55b998c0de9751f675c666e042ab9d

原文逐語（pinned, verbatim, READING）:
  「前条第二項及び第三項の規定は、前項の課税石油ガスについて準用する。」

Variable contract:
  `paragraph : Nat` is a 条項 number in the preceding article (前条). Unit: a
  paragraph index; domain: Nat. `appliesTo paragraph` is true exactly for the
  two cited paragraphs 第二項 (2) and 第三項 (3). The numerals are paragraph
  labels, NOT statutory amounts (the clause has no amount).

Scope: ONLY the selection of the preceding article's paragraphs 2 and 3 for
mutatis-mutandis application (準用) is modelled. The content of those paragraphs,
the identity of 課税石油ガス, and the consequent tax computation are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.PrevParagraphTwoThreeReading

/-- 「前条第二項及び第三項」: the two cited paragraph labels. -/
def appliesTo (paragraph : Nat) : Bool :=
  decide (paragraph = 2 ∨ paragraph = 3)

theorem second_applies : appliesTo 2 = true := by decide

theorem third_applies : appliesTo 3 = true := by decide

theorem first_not_applies : appliesTo 1 = false := by decide

theorem fourth_not_applies : appliesTo 4 = false := by decide

end JapanTaxLaw.PrevParagraphTwoThreeReading
