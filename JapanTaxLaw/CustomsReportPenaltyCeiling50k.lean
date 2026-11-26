import JapanTaxLaw.TaxFinance

/-
# CustomsReportPenaltyCeiling50k — 自家用自動車の一時輸入通関条約特例法 第十二条（五万円以下の罰金）

Pinned source:
  Law id: 339AC0000000101
  Official title: 自家用自動車の一時輸入に関する通関条約の実施に伴う関税法等の特例に関する法律
  Law type: Act (法律)
  Revision: 339AC0000000101_20010106_411AC0000000160
  Raw snapshot: data/raw/339AC0000000101_20010106_411AC0000000160.law.json
  sha256: dd2cb1411a27157f3e8d2fa8bb639a742839672b31d61f9d99916092ee7013b7
  Statutory article: 第十二条 (art. 12), 第一項 (1)
  Source path: LawBody[1]/MainProvision/MainProvision[11]/Article:12/Article#12/
               Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit id: NORM|ae8b530680be9ae5d40132a633d74e5344942744ac431625de51d3ac6196dbd1

原文逐語（pinned, 一字一句改変なし, REFERENCE, verbatim-unique in whole law）:
  「第九条第一項の規定による報告をせず、若しくは虚偽の報告をし、又は同項の規定による検査を拒み、妨げ、若しくは忌避した者は、五万円以下の罰金に処する。」

Variable contract:
  `fineYenCap : Nat := 50000` = 五万円以下 (inclusive upper bound: 以下).
  `withinFineCeiling (yen : Nat) : Bool := decide (yen <= fineYenCap)`.
  Unit 円 (yen); domain Nat.

Scope: ONLY the numeric fine ceiling is modelled. 第九条第一項's reporting duty,
the offence elements, alternative sanctions, other paragraphs and enforcement
rules are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsReportPenaltyCeiling50k

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

end JapanTaxLaw.CustomsReportPenaltyCeiling50k
