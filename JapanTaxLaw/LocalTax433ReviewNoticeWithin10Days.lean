import JapanTaxLaw.TaxFinance

/-
# LocalTax433ReviewNoticeWithin10Days — pinned clause 「固定資産評価審査委員会は、第一項の規定による決定をした場合においては、その決定のあつた日から十日以内に、これを審査を申し出た者及び市町村長に文書をもつて通知しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 433, paragraph 12.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|0d412a1e79683e6a8ce0e138aab34684494994d54857d8f3c0c6d7eadd6d1c72.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:433/Article#433/Paragraph#12/ParagraphSentence/Sentence#1.
原文逐語: 「固定資産評価審査委員会は、第一項の規定による決定をした場合においては、その決定のあつた日から十日以内に、これを審査を申し出た者及び市町村長に文書をもつて通知しなければならない。」
Scope: ONLY the 十日以内 (days ≤ 10) INCLUSIVE ceiling for notifying the 固定資産税 評価審査委員会 decision. 第一項の決定の存在・通知対象者の認定・文書の内容・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax433ReviewNoticeWithin10Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10), INCLUSIVE ceiling. -/
def threshold : Nat := 10

/-- 「固定資産評価審査委員会は、第一項の規定による決定をした場合においては、その決定のあつた日から十日以内に、これを審査を申し出た者及び市町村長に文書をもつて通知しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 10)

end JapanTaxLaw.LocalTax433ReviewNoticeWithin10Days
