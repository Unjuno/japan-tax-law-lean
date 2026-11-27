import JapanTaxLaw.TaxFinance

/-
# LocalTax73_30EvadedTaxAboveOneMillion — pinned clause 「前項の免れた税額が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超える額でその免れた税額に相当する額以下の額とすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 73_30, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|30beacd51ed0f2c20f27f0bfe58d07315d276c86c35223aa2e5d8e162169ccc4.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:73_30/Article#73_30/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「前項の免れた税額が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超える額でその免れた税額に相当する額以下の額とすることができる。」
Scope: ONLY the 免れた税額が百万円を超える (evaded > 1,000,000) STRICT lower bound. 情状による罰金の増額判断・相当する額の算定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax73_30EvadedTaxAboveOneMillion

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (1000000), STRICT lower bound. -/
def threshold : Nat := 1000000

/-- 「前項の免れた税額が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超える額でその免れた税額に相当する額以下の額とすることができる。」. -/
def inScope (evaded : Nat) : Prop := threshold < evaded

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (evaded : Nat) : Bool := decide (1000000 < evaded)

end JapanTaxLaw.LocalTax73_30EvadedTaxAboveOneMillion
