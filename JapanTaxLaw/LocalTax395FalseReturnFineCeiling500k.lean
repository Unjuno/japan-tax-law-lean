import JapanTaxLaw.TaxFinance

/-
# LocalTax395FalseReturnFineCeiling500k — pinned clause 「前条の規定により申告すべき事項について申告をせず、又は虚偽の申告をしたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 395, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|19058a52de37bac5c471b25fb60e4fb21786f1f586f94067597c8d3e3b967130.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:395/Article#395/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「前条の規定により申告すべき事項について申告をせず、又は虚偽の申告をしたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」
Scope: ONLY the 五十万円以下 (fine ≤ 500,000) INCLUSIVE ceiling for an omitted/false 申告. 一年以下の拘禁刑・前条の要件該当性・情状判断・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax395FalseReturnFineCeiling500k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (500000), INCLUSIVE ceiling. -/
def threshold : Nat := 500000

/-- 「前条の規定により申告すべき事項について申告をせず、又は虚偽の申告をしたときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」。 -/
def inScope (fine : Nat) : Prop := fine ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (fine : Nat) : Bool := decide (fine ≤ 500000)

end JapanTaxLaw.LocalTax395FalseReturnFineCeiling500k
