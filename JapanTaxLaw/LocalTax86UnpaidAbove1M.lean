import JapanTaxLaw.TaxFinance

/-
# LocalTax86UnpaidAbove1M — pinned clause 「前項の納入しなかつた金額が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 86, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|168a9c5e9c65038b774c1c767681820184811830eddce67622de25b52220af5c.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:86/Article#86/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「前項の納入しなかつた金額が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」
Scope: ONLY the 百万円を超える (unpaid > 1,000,000) STRICT lower bound for raising the 罰金. 情状判断・相当額の算定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax86UnpaidAbove1M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (1000000), STRICT lower bound. -/
def threshold : Nat := 1000000

/-- 「前項の納入しなかつた金額が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」. -/
def inScope (unpaid : Nat) : Prop := threshold < unpaid

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (unpaid : Nat) : Bool := decide (1000000 < unpaid)

end JapanTaxLaw.LocalTax86UnpaidAbove1M
