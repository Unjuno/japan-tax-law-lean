import JapanTaxLaw.TaxFinance

/-
# LocalTax328_16EvadedAboveTwoMillion — pinned clause 「第一項の納入しなかつた金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 328_16, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|b89a2d17b5638e7628b2c14eabad94e59f846577953db192e03e614a48d7b06f.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:328_16/Article#328_16/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「第一項の納入しなかつた金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」
Scope: ONLY the 納入しなかつた金額が二百万円を超える (evaded > 2,000,000) STRICT lower bound. 情状による罰金の増額判断・相当する額の算定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax328_16EvadedAboveTwoMillion

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2000000), STRICT lower bound. -/
def threshold : Nat := 2000000

/-- 「第一項の納入しなかつた金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」. -/
def inScope (evaded : Nat) : Prop := threshold < evaded

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (evaded : Nat) : Bool := decide (2000000 < evaded)

end JapanTaxLaw.LocalTax328_16EvadedAboveTwoMillion
