import JapanTaxLaw.TaxFinance

/-
# LocalTax400RegisterWithin10Days — pinned clause 「市町村長は、前条の規定による通知を受けた場合においては、その通知を受けた日から十日以内に道府県知事又は総務大臣の決定に係る当該価格等を固定資産課税台帳に登録しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 400, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|f81380149fb307f5c05ced827263f0113d8dd6ac7738d2178709c980ac5b8a68.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:400/Article#400/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「市町村長は、前条の規定による通知を受けた場合においては、その通知を受けた日から十日以内に道府県知事又は総務大臣の決定に係る当該価格等を固定資産課税台帳に登録しなければならない。」
Scope: ONLY the 十日以内 (days ≤ 10) INCLUSIVE ceiling for registering the 決定に係る価格等 in the 固定資産課税台帳. 通知受領の事実認定・決定価格の内容・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax400RegisterWithin10Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10), INCLUSIVE ceiling. -/
def threshold : Nat := 10

/-- 「市町村長は、前条の規定による通知を受けた場合においては、その通知を受けた日から十日以内に道府県知事又は総務大臣の決定に係る当該価格等を固定資産課税台帳に登録しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 10)

end JapanTaxLaw.LocalTax400RegisterWithin10Days
