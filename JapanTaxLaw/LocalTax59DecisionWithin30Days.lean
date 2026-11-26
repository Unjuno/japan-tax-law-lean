import JapanTaxLaw.TaxFinance

/-
# LocalTax59DecisionWithin30Days — pinned clause 「総務大臣は、前項の申出を受けた場合においては、その申出を受けた日から三十日以内に、その決定をしなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 59, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c924d502b23ff8fe48a5f1968eb9cc82f94d4300ed5c6cd044b79b3feea2f28b.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:59/Article#59/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「総務大臣は、前項の申出を受けた場合においては、その申出を受けた日から三十日以内に、その決定をしなければならない。」
Scope: ONLY 申出を受けた日から三十日以内に総務大臣が決定をする期間. The 前項の申出自体, 決定の内容, the 第三百二十一条の十五 parallel occurrence and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax59DecisionWithin30Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (30), INCLUSIVE. -/
def threshold : Nat := 30

/-- 「総務大臣は、前項の申出を受けた場合においては、その申出を受けた日から三十日以内に、その決定をしなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 30)

end JapanTaxLaw.LocalTax59DecisionWithin30Days
