import JapanTaxLaw.TaxFinance

/-
# LocalTax453FalseReportFine300k — pinned clause 「前条の規定により申告し、又は報告すべき事項について虚偽の申告又は報告をしたときは、その違反行為をした者は、三十万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 453, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|8311a201119c59741799c239199a5642445159b19be078bdf7d711ea69d3ec64.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:453/Article#453/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「前条の規定により申告し、又は報告すべき事項について虚偽の申告又は報告をしたときは、その違反行為をした者は、三十万円以下の罰金に処する。」
Scope: ONLY 虚偽の申告又は報告をした者に対する三十万円以下の罰金の上限. The 前条の申告義務自体, 違反行為の認定, the 第七百条の五十七 parallel 三十万円 clause and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax453FalseReportFine300k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (300000), INCLUSIVE. -/
def threshold : Nat := 300000

/-- 「前条の規定により申告し、又は報告すべき事項について虚偽の申告又は報告をしたときは、その違反行為をした者は、三十万円以下の罰金に処する。」. -/
def inScope (yen : Nat) : Prop := yen ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (yen : Nat) : Bool := decide (yen ≤ 300000)

end JapanTaxLaw.LocalTax453FalseReportFine300k
