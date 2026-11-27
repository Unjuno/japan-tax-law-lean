import JapanTaxLaw.TaxFinance

/-
# LocalTax74_15EvadedAbove1M — pinned clause 「第一項の免れた税額又は前項の還付を受けた金額が百万円を超える場合には、情状により、当該各項の罰金の額は、当該各項の規定にかかわらず、百万円を超える額でその免れた税額又は還付を受けた金額に相当する額以下の額とすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 74_15, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|bd6c5f51c32ffb0764482cc4bd192a2885e35fe43205d8f53059032607cf568b.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:74_15/Article#74_15/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「第一項の免れた税額又は前項の還付を受けた金額が百万円を超える場合には、情状により、当該各項の罰金の額は、当該各項の規定にかかわらず、百万円を超える額でその免れた税額又は還付を受けた金額に相当する額以下の額とすることができる。」
Scope: ONLY the 百万円を超える (evaded > 1,000,000) STRICT lower bound for the たばこ税 penalty enhancement. 情状による罰金の増額判断・相当する額の算定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax74_15EvadedAbove1M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (1000000), STRICT lower bound. -/
def threshold : Nat := 1000000

/-- 「第一項の免れた税額又は前項の還付を受けた金額が百万円を超える場合には、情状により、当該各項の罰金の額は、当該各項の規定にかかわらず、百万円を超える額でその免れた税額又は還付を受けた金額に相当する額以下の額とすることができる。」. -/
def inScope (evaded : Nat) : Prop := threshold < evaded

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (evaded : Nat) : Bool := decide (1000000 < evaded)

end JapanTaxLaw.LocalTax74_15EvadedAbove1M
