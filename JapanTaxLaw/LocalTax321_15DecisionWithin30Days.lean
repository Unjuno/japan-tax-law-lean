import JapanTaxLaw.TaxFinance

/-
# LocalTax321_15DecisionWithin30Days — pinned clause 「道府県知事又は総務大臣は、前項の申出を受けた場合においては、その申出を受けた日から三十日以内に、その決定をしなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 321_15, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|7339f16ada0f4eab605eb9107c87d766ea83d0e1003a1157a9ab6ba5bdf7915d.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:321_15/Article#321_15/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「道府県知事又は総務大臣は、前項の申出を受けた場合においては、その申出を受けた日から三十日以内に、その決定をしなければならない。」
Scope: ONLY 申出を受けた日から三十日以内に道府県知事又は総務大臣が決定をする期間. The 前項の申出自体, 決定の内容, 申出者の範囲, the 第五十九条 parallel occurrence and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax321_15DecisionWithin30Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (30), INCLUSIVE. -/
def threshold : Nat := 30

/-- 「道府県知事又は総務大臣は、前項の申出を受けた場合においては、その申出を受けた日から三十日以内に、その決定をしなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 30)

end JapanTaxLaw.LocalTax321_15DecisionWithin30Days
