import JapanTaxLaw.TaxFinance

/-
# AtaCarnetReportPenaltyCeiling50k — ＡＴＡ条約実施関税法特例法 第九条（五万円以下の罰金）

Pinned source:
  Law id: 348AC0000000070
  Official title: 物品の一時輸入のための通関手帳に関する通関条約（ＡＴＡ条約）の実施に伴う関税法等の特例に関する法律
  Law type: Act (法律)
  Revision: 348AC0000000070_20060301_417AC0000000022
  Raw snapshot: data/raw/348AC0000000070_20060301_417AC0000000022.law.json
  sha256: c4404e5fcc5420a1f79ab8e8975fbabfe2d4a781cf754990381a2f5c1da887cb
  Statutory article: 第九条 (art. 9), 第一項 (1)
  Source path: LawBody[1]/MainProvision/MainProvision[8]/Article:9/Article#9/
               Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit id: NORM|2a6d4f53c8db4d374ec47bd6eb2f3097ac890e459a92493f22f6ea01ab0f59c6

原文逐語（pinned, 一字一句改変なし, REFERENCE, verbatim-unique in whole law）:
  「第七条第一項の規定による報告をせず、若しくは虚偽の報告をし、又は同項の規定による検査を拒み、妨げ、若しくは忌避した者は、五万円以下の罰金に処する。」

Variable contract:
  `fineYenCap : Nat := 50000` = 五万円以下 (inclusive upper bound: 以下).
  `withinFineCeiling (yen : Nat) : Bool := decide (yen <= fineYenCap)`.
  Unit 円 (yen); domain Nat.

Scope: ONLY the numeric fine ceiling is modelled. 第七条第一項's reporting duty,
the offence elements, alternative sanctions, other paragraphs and enforcement
rules are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.AtaCarnetReportPenaltyCeiling50k

/-- 五万円以下 — inclusive fine ceiling. Unit 円; domain Nat. -/
def fineYenCap : Nat := 50000

/-- 「五万円以下の罰金に処する」: the fine is at most 50,000 yen. -/
def withinFineCeiling (yen : Nat) : Bool :=
  decide (yen <= fineYenCap)

/-- 以下 is inclusive: exactly 50,000 yen qualifies. -/
theorem fifty_thousand_inclusive : withinFineCeiling 50000 = true := by
  unfold withinFineCeiling fineYenCap
  decide

/-- 50,001 yen exceeds the ceiling. -/
theorem over_fine_false : withinFineCeiling 50001 = false := by
  unfold withinFineCeiling fineYenCap
  decide

/-- One yen qualifies. -/
theorem one_yen_true : withinFineCeiling 1 = true := by
  unfold withinFineCeiling fineYenCap
  decide

end JapanTaxLaw.AtaCarnetReportPenaltyCeiling50k
