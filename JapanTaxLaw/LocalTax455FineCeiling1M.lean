import JapanTaxLaw.TaxFinance

/-
# LocalTax455FineCeiling1M — pinned clause 「偽りその他不正の行為により軽自動車税の全部又は一部を免れたときは、その違反行為をした者は、百万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 455, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|76a4a70a45aebcf35faa2ea01dd7bc68a20205f906e95d99590f69a8836dc212.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:455/Article#455/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「偽りその他不正の行為により軽自動車税の全部又は一部を免れたときは、その違反行為をした者は、百万円以下の罰金に処する。」
Scope: ONLY the 百万円以下 (fine ≤ 1,000,000) ceiling for the 軽自動車税 不正免脱 penalty. 一年以下の拘禁刑 (statutory literal 1), 不正行為該当性・情状判断・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax455FineCeiling1M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (1000000), INCLUSIVE ceiling. -/
def threshold : Nat := 1000000

/-- 「偽りその他不正の行為により軽自動車税の全部又は一部を免れたときは、その違反行為をした者は、百万円以下の罰金に処する。」. -/
def inScope (fine : Nat) : Prop := fine ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (fine : Nat) : Bool := decide (fine ≤ 1000000)

end JapanTaxLaw.LocalTax455FineCeiling1M
