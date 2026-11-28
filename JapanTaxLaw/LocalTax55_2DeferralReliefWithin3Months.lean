import JapanTaxLaw.TaxFinance

/-
# LocalTax55_2DeferralReliefWithin3Months — pinned clause 「ただし、その猶予に係る税額が百万円以下である場合、その猶予の期間が三月以内である場合又は担保を徴することができない特別の事情がある場合は、この限りでない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 55_2, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|8c095d47899bc578623b2e1cd9acb6d078f63048d0f3ac1c82036369a1e99a8b.
原文逐語: 「ただし、その猶予に係る税額が百万円以下である場合、その猶予の期間が三月以内である場合又は担保を徴することができない特別の事情がある場合は、この限りでない。」
Scope: ONLY the 猶予の期間が三月以内 (months <= 3) INCLUSIVE ceiling of the 徴収猶予特例. 百万円以下の税額要件・担保を徴することができない特別の事情・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax55_2DeferralReliefWithin3Months

open JapanTaxLaw.TaxFinance

/-- 「ただし、その猶予に係る税額が百万円以下である場合、その猶予の期間が三月以内である場合又は担保を徴することができない特別の事情がある場合は、この限りでない。」 — statutory threshold literal (3); INCLUSIVE boundary. -/
def inScope (months : Nat) : Prop := months <= 3

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months <= 3)

end JapanTaxLaw.LocalTax55_2DeferralReliefWithin3Months
