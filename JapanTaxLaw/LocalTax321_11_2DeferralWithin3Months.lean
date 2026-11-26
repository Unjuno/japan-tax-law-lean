import JapanTaxLaw.TaxFinance

/-
# LocalTax321_11_2DeferralWithin3Months — pinned clause 「その猶予の期間が三月以内である場合」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第三百二十一条の十一の二 (Num 321_11_2), paragraph 2, sentence 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|86ec2cae4443671ee033ef50dbb02e5b0d82beb07eaa304603fd988e7fcdd950.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:321_11_2/Article#321_11_2/Paragraph#2/ParagraphSentence/Sentence#2.
原文逐語: 「その猶予の期間が三月以内である場合」
Scope: ONLY the inclusive 三月以内 deferral-period ceiling (三 = 3 months) in
this proviso. The ¥1,000,000 tax ceiling in the same sentence, the exception's
legal effect, the parallel clauses in other articles (第五十五条の二 etc.) and
all other paragraphs are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax321_11_2DeferralWithin3Months

open JapanTaxLaw.TaxFinance

/-- 三 — 以内 (inclusive ceiling, 3 months). -/
def threshold : Nat := 3

/-- 「その猶予の期間が三月以内である場合」. -/
def inScope (months : Nat) : Prop := months ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months ≤ 3)

end JapanTaxLaw.LocalTax321_11_2DeferralWithin3Months
