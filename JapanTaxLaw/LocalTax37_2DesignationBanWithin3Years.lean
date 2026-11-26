import JapanTaxLaw.TaxFinance

/-
# LocalTax37_2DesignationBanWithin3Years — pinned clause 「総務大臣は、前項の規定により指定を取り消すときは、指定の取消しを受ける都道府県等について、三年以内の期間を定めて指定を行わない旨の決定をしなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 37_2, paragraph 6.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|130fb2232792b61035e0b3adfa9038056af22cfe1dec52ed7a13f3b752932bea.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:37_2/Article#37_2/Paragraph#6/ParagraphSentence/Sentence#1.
原文逐語: 「総務大臣は、前項の規定により指定を取り消すときは、指定の取消しを受ける都道府県等について、三年以内の期間を定めて指定を行わない旨の決定をしなければならない。」
Scope: ONLY 指定の取消しを受けた都道府県等について三年以内の期間を定めて指定を行わない旨の決定. The 前項の指定取消し自体, 都道府県等の定義, the 第三百十四条の七 parallel occurrence of the same clause and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37_2DesignationBanWithin3Years

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), INCLUSIVE. -/
def threshold : Nat := 3

/-- 「総務大臣は、前項の規定により指定を取り消すときは、指定の取消しを受ける都道府県等について、三年以内の期間を定めて指定を行わない旨の決定をしなければならない。」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 3)

end JapanTaxLaw.LocalTax37_2DesignationBanWithin3Years
