import JapanTaxLaw.TaxFinance

/-
# InheritanceTax46ApprovalWithin3Months — pinned clause 「税務署長は、前項の規定による申請書の提出があつた場合においては、当該申請者及び当該申請に係る事項について第一項の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出があつた日の翌日から起算して三月以内に当該申請の承認をし、又は当該申請の却下をする。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 46, paragraph 3.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|3882f054e06b85388ee2f5aa85dd1f1b8c5af70afcf8cecbd6a196bf1e25e937.
Source path: LawBody[3]/MainProvision/MainProvision[5]/Article:46/Article#46/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「税務署長は、前項の規定による申請書の提出があつた場合においては、当該申請者及び当該申請に係る事項について第一項の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出があつた日の翌日から起算して三月以内に当該申請の承認をし、又は当該申請の却下をする。」
Scope: ONLY 申請書を受け取つた日の翌日から起算して三月以内に承認又は却下をする期間. 第一項の規定に該当するか否かの調査自体, 承認/却下の実体的要件, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax46ApprovalWithin3Months

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), INCLUSIVE. -/
def threshold : Nat := 3

/-- 「税務署長は、前項の規定による申請書の提出があつた場合においては、当該申請者及び当該申請に係る事項について第一項の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出があつた日の翌日から起算して三月以内に当該申請の承認をし、又は当該申請の却下をする。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 3)

end JapanTaxLaw.InheritanceTax46ApprovalWithin3Months
