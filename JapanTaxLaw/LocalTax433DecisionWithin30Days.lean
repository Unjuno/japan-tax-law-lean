import JapanTaxLaw.TaxFinance

/-
# LocalTax433DecisionWithin30Days — pinned clause 「固定資産評価審査委員会は、前条第一項の審査の申出を受けた場合においては、直ちにその必要と認める調査その他事実審査を行い、その申出を受けた日から三十日以内に審査の決定をしなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 433, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|d3f870931f2f605a6e613869e42984168124662362f147dfa3321802d01763b5.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:433/Article#433/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「固定資産評価審査委員会は、前条第一項の審査の申出を受けた場合においては、直ちにその必要と認める調査その他事実審査を行い、その申出を受けた日から三十日以内に審査の決定をしなければならない。」
Scope: ONLY the 申出を受けた日から三十日以内 (days ≤ 30) decision deadline. 直ちに必要と認める調査その他事実審査の内容, 決定の内容・効力, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax433DecisionWithin30Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (30), INCLUSIVE ceiling. -/
def threshold : Nat := 30

/-- 「固定資産評価審査委員会は、前条第一項の審査の申出を受けた場合においては、直ちにその必要と認める調査その他事実審査を行い、その申出を受けた日から三十日以内に審査の決定をしなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 30)

end JapanTaxLaw.LocalTax433DecisionWithin30Days
