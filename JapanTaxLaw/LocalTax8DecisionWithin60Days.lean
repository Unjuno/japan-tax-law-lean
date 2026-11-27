import JapanTaxLaw.TaxFinance

/-
# LocalTax8DecisionWithin60Days — pinned clause 「総務大臣又は道府県知事は、前項の決定を求める旨の申出を受けた場合においては、その申出を受けた日から六十日以内に決定をし、遅滞なく、その旨を関係地方団体の長に通知しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 8, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|8c22b360d1401604dcf17859a3d1b5c7f920fd4b1b7d9985cf7bba52bc338b8f.
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:8/Article#8/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「総務大臣又は道府県知事は、前項の決定を求める旨の申出を受けた場合においては、その申出を受けた日から六十日以内に決定をし、遅滞なく、その旨を関係地方団体の長に通知しなければならない。」
Scope: ONLY 決定を求める申出を受けた日から六十日以内に決定をし遅滞なく関係地方団体の長に通知する期間. 第一項の決定自体, 通知の方法, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax8DecisionWithin60Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (60), INCLUSIVE. -/
def threshold : Nat := 60

/-- 「総務大臣又は道府県知事は、前項の決定を求める旨の申出を受けた場合においては、その申出を受けた日から六十日以内に決定をし、遅滞なく、その旨を関係地方団体の長に通知しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 60)

end JapanTaxLaw.LocalTax8DecisionWithin60Days
