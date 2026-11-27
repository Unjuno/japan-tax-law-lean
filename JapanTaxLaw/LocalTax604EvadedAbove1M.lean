import JapanTaxLaw.TaxFinance

/-
# LocalTax604EvadedAbove1M — pinned clause 「前項の免れた税額が百万円をこえる場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円をこえる額でその免れた税額に相当する額以下の額とすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 604, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|283a357a88e434d27b4f1cc1cb98c5be5d37476084b74102d7702fda5d65c679.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:604/Article#604/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「前項の免れた税額が百万円をこえる場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円をこえる額でその免れた税額に相当する額以下の額とすることができる。」
Scope: ONLY the 百万円をこえる (evaded > 1,000,000) STRICT lower bound for the 罰金引き上げ. 情状による増額判断・相当額の算定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax604EvadedAbove1M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (1000000), STRICT lower bound. -/
def threshold : Nat := 1000000

/-- 「前項の免れた税額が百万円をこえる場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円をこえる額でその免れた税額に相当する額以下の額とすることができる。」. -/
def inScope (evaded : Nat) : Prop := threshold < evaded

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (evaded : Nat) : Bool := decide (1000000 < evaded)

end JapanTaxLaw.LocalTax604EvadedAbove1M
