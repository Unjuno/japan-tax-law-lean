import JapanTaxLaw.TaxFinance

/-
# InheritanceTax49DisclosureWithin2Months — pinned clause 「第一項の請求があつた場合には、税務署長は、当該請求をした者に対し、当該請求後二月以内に同項の開示をしなければならない。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 49, paragraph 3.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|78cc8ff175ad3daa18249df1c3405aa12bf358b03cd2e01bbb63c54515f70843.
Source path: LawBody[3]/MainProvision/MainProvision[6]/Article:49/Article#49/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「第一項の請求があつた場合には、税務署長は、当該請求をした者に対し、当該請求後二月以内に同項の開示をしなければならない。」
Scope: ONLY 請求後二月以内に同項の開示をする期間. The 第一項の請求自体, 開示の内容・方法, 請求者の範囲, all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax49DisclosureWithin2Months

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE. -/
def threshold : Nat := 2

/-- 「第一項の請求があつた場合には、税務署長は、当該請求をした者に対し、当該請求後二月以内に同項の開示をしなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 2)

end JapanTaxLaw.InheritanceTax49DisclosureWithin2Months
