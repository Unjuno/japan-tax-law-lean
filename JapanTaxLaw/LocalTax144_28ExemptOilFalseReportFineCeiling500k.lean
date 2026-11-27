import JapanTaxLaw.TaxFinance

/-
# LocalTax144_28ExemptOilFalseReportFineCeiling500k — pinned clause 「前条第一項の規定に違反して報告書を提出せず、又は虚偽の記載をした報告書を提出したときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 144_28, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|43dd8fba6be6d2f78904475c84a186ca2ce2a4dc5d0008d99fa379b05ed0afa8.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_28/Article#144_28/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「前条第一項の規定に違反して報告書を提出せず、又は虚偽の記載をした報告書を提出したときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」
Scope: ONLY the 五十万円以下 (fine ≤ 500,000) INCLUSIVE ceiling on the criminal fine for 免税軽油の引取り等に係る報告義務違反（報告書未提出・虚偽記載）. 一年以下の拘禁刑・法人両罰・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_28ExemptOilFalseReportFineCeiling500k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (500000), INCLUSIVE ceiling. -/
def threshold : Nat := 500000

/-- 「前条第一項の規定に違反して報告書を提出せず、又は虚偽の記載をした報告書を提出したときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」. -/
def inScope (fine : Nat) : Prop := fine ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (fine : Nat) : Bool := decide (fine ≤ 500000)

end JapanTaxLaw.LocalTax144_28ExemptOilFalseReportFineCeiling500k
