import JapanTaxLaw.TaxFinance

/-
# LocalTax62EvadedOver5M — pinned clause 「前項の免れた税額が五百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、五百万円を超える額でその免れた税額に相当する額以下の額とすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第六十二条 (Num 62), paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|16b527dd4211b210e351650a3c39cb0830052394e247e9d20cead79e4666ab8d.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:62/Article#62/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「前項の免れた税額が五百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、五百万円を超える額でその免れた税額に相当する額以下の額とすることができる。」
Scope: ONLY the strict 五百万円を超え threshold (五 = 5,000,000 円) that opens
this discretionary fine rule. The discretionary upper bound (免れた税額に相当
する額以下), the underlying offense, the parallel clauses in 第七十二条の
四十九の三・六十・九十五条 and 第百四十四条の四十一条, the 相続税法 第六十八条(4)
counterpart and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax62EvadedOver5M

open JapanTaxLaw.TaxFinance

/-- 五百万 — を超え (strict, ¥5,000,000). -/
def threshold : Nat := 5_000_000

/-- 「免れた税額が五百万円を超える場合には」. -/
def inScope (evaded : Nat) : Prop := threshold < evaded

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (evaded : Nat) : Bool := decide (5_000_000 < evaded)

end JapanTaxLaw.LocalTax62EvadedOver5M
