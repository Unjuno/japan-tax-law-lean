import JapanTaxLaw.TaxFinance

/-
# LocalTax73_30EvadedAbove500k — pinned clause 「前項の免れた税額が五十万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、五十万円を超える額でその免れた税額に相当する額以下の額とすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 73_30, paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|49a2a78a51cd6eaf13450819bcc780ded6654854eaf27619966af2eb4491e994.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:73_30/Article#73_30/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「前項の免れた税額が五十万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、五十万円を超える額でその免れた税額に相当する額以下の額とすることができる。」
Scope: ONLY the 五十万円を超える (evaded > 500,000) STRICT lower bound for raising the 罰金. 情状判断・相当額の算定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax73_30EvadedAbove500k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (500000), STRICT lower bound. -/
def threshold : Nat := 500000

/-- 「前項の免れた税額が五十万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、五十万円を超える額でその免れた税額に相当する額以下の額とすることができる。」. -/
def inScope (evaded : Nat) : Prop := threshold < evaded

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (evaded : Nat) : Bool := decide (500000 < evaded)

end JapanTaxLaw.LocalTax73_30EvadedAbove500k
