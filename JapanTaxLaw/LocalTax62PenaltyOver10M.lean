import JapanTaxLaw.TaxFinance

/-
# LocalTax62PenaltyOver10M — pinned clause 「前項の免れた税額が千万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、千万円を超える額でその免れた税額に相当する額以下の額とすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 62, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|541f5f9997463cb9ed97a64cc9c6d548c15933a1ddd36407cda351116626f30d.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:62/Article#62/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「前項の免れた税額が千万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、千万円を超える額でその免れた税額に相当する額以下の額とすることができる。」
Scope: ONLY 免れた税額が千万円を超える場合という STRICT 下限. 同項の罰金の上限（免れた税額に相当する額）, 情状による減額, 前項の罰金自体, 他条項 are NOT MODELLED. 「以下」 in the same needle bounds the penalty, not this modelled lower bound.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax62PenaltyOver10M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10000000), STRICT lower bound. -/
def threshold : Nat := 10000000

/-- 「前項の免れた税額が千万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、千万円を超える額でその免れた税額に相当する額以下の額とすることができる。」. -/
def inScope (yen : Nat) : Prop := threshold < yen

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (yen : Nat) : Bool := decide (10000000 < yen)

end JapanTaxLaw.LocalTax62PenaltyOver10M
