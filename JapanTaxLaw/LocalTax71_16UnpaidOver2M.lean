import JapanTaxLaw.TaxFinance

/-
# LocalTax71_16UnpaidOver2M — pinned clause 「前項の納入しなかつた金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第七十一条の十六 (Num 71_16), paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|ac7a3ed89541e42133587152b49c0d96ece56d8b428fc091560cdb2c3542c51b.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:71_16/Article#71_16/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「前項の納入しなかつた金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」
Scope: ONLY the strict 二百万円を超え threshold (二 = 2,000,000 円) that opens
this discretionary fine rule. The discretionary upper bound (未納税額に相当
する額以下), the underlying offense, the parallel clauses in 第七十一条の
三十七・五十七 and 第三百二十四条 and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax71_16UnpaidOver2M

open JapanTaxLaw.TaxFinance

/-- 二百万 — を超え (strict, ¥2,000,000). -/
def threshold : Nat := 2_000_000

/-- 「納入しなかつた金額が二百万円を超える場合には」. -/
def inScope (unpaid : Nat) : Prop := threshold < unpaid

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (unpaid : Nat) : Bool := decide (2_000_000 < unpaid)

end JapanTaxLaw.LocalTax71_16UnpaidOver2M
