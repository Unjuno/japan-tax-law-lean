import JapanTaxLaw.TaxFinance

/-
# LocalTax144_30NotificationWithin60Days — pinned clause 「道府県知事は、第一項の規定による申請を受理した場合においては、同項又は前項に規定する措置を採るかどうかについて、その申請を受理した日から六十日以内に特別徴収義務者に通知しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 144_30, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|8800ded7feb6277f86fa62028979eaa852a5d791aee2513027bce600064f8257.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_30/Article#144_30/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「道府県知事は、第一項の規定による申請を受理した場合においては、同項又は前項に規定する措置を採るかどうかについて、その申請を受理した日から六十日以内に特別徴収義務者に通知しなければならない。」
Scope: ONLY the 申請を受理した日から六十日以内 (days ≤ 60) forwarding deadline. 申請の受理自体, 措置を採るかどうかの判断, 通知先・通知手続, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_30NotificationWithin60Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (60), INCLUSIVE ceiling. -/
def threshold : Nat := 60

/-- 「道府県知事は、第一項の規定による申請を受理した場合においては、同項又は前項に規定する措置を採るかどうかについて、その申請を受理した日から六十日以内に特別徴収義務者に通知しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 60)

end JapanTaxLaw.LocalTax144_30NotificationWithin60Days
