import JapanTaxLaw.TaxFinance

/-
# LocalTax73_19FalseReportFineCeiling500k — pinned clause 「前条の規定により申告し、又は報告すべき事項について虚偽の申告又は報告をしたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 73_19, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|121bebce906a5a073e6f6ad1e0f8b2d277e695cb10c19df3291ace01af3ef052.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:73_19/Article#73_19/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「前条の規定により申告し、又は報告すべき事項について虚偽の申告又は報告をしたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」
Scope: ONLY the 五十万円以下 (fine ≤ 500,000) INCLUSIVE ceiling on the criminal fine for a 虚偽の申告又は報告. 一年以下の拘禁刑・前条の要件該当性・情状判断・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax73_19FalseReportFineCeiling500k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (500000), INCLUSIVE ceiling. -/
def threshold : Nat := 500000

/-- 「前条の規定により申告し、又は報告すべき事項について虚偽の申告又は報告をしたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」. -/
def inScope (fine : Nat) : Prop := fine ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (fine : Nat) : Bool := decide (fine ≤ 500000)

end JapanTaxLaw.LocalTax73_19FalseReportFineCeiling500k
