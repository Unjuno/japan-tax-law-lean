import JapanTaxLaw.TaxFinance

/-
# LocalTax8AppealWithin30Days — pinned clause 「第二項の規定による道府県知事の決定に不服がある市町村長は、同項の通知を受けた日から三十日以内に総務大臣に裁決を求める旨を申し出ることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 8, paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|06691e01250357a799be279903bb436a54e521f74978d57d04bcd78345838e15.
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:8/Article#8/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「第二項の規定による道府県知事の決定に不服がある市町村長は、同項の通知を受けた日から三十日以内に総務大臣に裁決を求める旨を申し出ることができる。」
Scope: ONLY the 通知を受けた日から三十日以内 (days ≤ 30) INCLUSIVE ceiling for a 市町村長 to 総務大臣に裁決を求める旨を申し出る. 第二項の決定・不服の認定・裁決の手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax8AppealWithin30Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (30), INCLUSIVE ceiling. -/
def threshold : Nat := 30

/-- 「第二項の規定による道府県知事の決定に不服がある市町村長は、同項の通知を受けた日から三十日以内に総務大臣に裁決を求める旨を申し出ることができる。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 30)

end JapanTaxLaw.LocalTax8AppealWithin30Days
