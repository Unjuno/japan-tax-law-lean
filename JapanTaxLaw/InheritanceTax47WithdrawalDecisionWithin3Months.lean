import JapanTaxLaw.TaxFinance

/-
# InheritanceTax47WithdrawalDecisionWithin3Months — pinned clause 「税務署長は、前項の規定による申請書の提出があつた場合においては、その申請の基因となる物納の撤回の申請の却下をする場合を除き、当該申請者及び当該申請に係る事項について前条第一項及び前二項の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出期限の翌日から起算して三月以内に当該申請に係る税額の全部又は一部について当該申請に係る条件若しくはこれを変更した条件により物納の撤回に係る延納の許可をし、又は当該申請の却下をする。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 47, paragraph 3.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|9e0f7e9b813702184959bd2aacc46156a16f0d7e7c1e289735197b4883d7506c.
Source path: LawBody[3]/MainProvision/MainProvision[5]/Article:47/Article#47/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「税務署長は、前項の規定による申請書の提出があつた場合においては、その申請の基因となる物納の撤回の申請の却下をする場合を除き、当該申請者及び当該申請に係る事項について前条第一項及び前二項の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出期限の翌日から起算して三月以内に当該申請に係る税額の全部又は一部について当該申請に係る条件若しくはこれを変更した条件により物納の撤回に係る延納の許可をし、又は当該申請の却下をする。」
Scope: ONLY the 申請書の提出期限の翌日から起算して三月以内 (days <= 3) INCLUSIVE ceiling for the 物納の撤回に係る延納の許可又は却下. 却下をする場合を除く, 前条第一項及び前二項の規定に該当するか否かの調査, 条件の変更, 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax47WithdrawalDecisionWithin3Months

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), INCLUSIVE ceiling. -/
def threshold : Nat := 3

/-- 「税務署長は、前項の規定による申請書の提出があつた場合においては、その申請の基因となる物納の撤回の申請の却下をする場合を除き、当該申請者及び当該申請に係る事項について前条第一項及び前二項の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出期限の翌日から起算して三月以内に当該申請に係る税額の全部又は一部について当該申請に係る条件若しくはこれを変更した条件により物納の撤回に係る延納の許可をし、又は当該申請の却下をする。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 3)

end JapanTaxLaw.InheritanceTax47WithdrawalDecisionWithin3Months
