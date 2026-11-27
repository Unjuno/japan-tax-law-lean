import JapanTaxLaw.TaxFinance

/-
# LocalTax144_19FalseReportFineCeiling500k — pinned clause 「正当な理由がなくて前条第一項各号の規定による申告書を当該各号に規定する申告書の提出期限までに提出しなかつたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 144_19, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|d47259b347f2a6a12a6a900ea6a1cf7df598ad8eb95fe8ab5267d64253f369de.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_19/Article#144_19/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「正当な理由がなくて前条第一項各号の規定による申告書を当該各号に規定する申告書の提出期限までに提出しなかつたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」
Scope: ONLY the 五十万円以下 (fine ≤ 500,000) INCLUSIVE ceiling for a late/omitted 申告書. 一年以下の拘禁刑・前条各号の要件該当性・情状判断・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_19FalseReportFineCeiling500k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (500000), INCLUSIVE ceiling. -/
def threshold : Nat := 500000

/-- 「正当な理由がなくて前条第一項各号の規定による申告書を当該各号に規定する申告書の提出期限までに提出しなかつたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」。 -/
def inScope (fine : Nat) : Prop := fine ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (fine : Nat) : Bool := decide (fine ≤ 500000)

end JapanTaxLaw.LocalTax144_19FalseReportFineCeiling500k
