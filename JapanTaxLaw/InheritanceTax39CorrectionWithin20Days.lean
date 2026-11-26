import JapanTaxLaw.TaxFinance

/-
# InheritanceTax39CorrectionWithin20Days — pinned clause 「第十項の規定により申請書の訂正又は担保提供関係書類の訂正若しくは提出を求められた当該申請者は、前項の規定による通知を受けた日の翌日から起算して二十日以内に当該申請書の訂正又は当該担保提供関係書類の訂正若しくは提出をしなければならない。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 39, paragraph 12.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|b9bdb97609b2cd079263a67e16cf8c6ef9ff1996f73885dde279cc7a208fe9fb.
Source path: LawBody[3]/MainProvision/MainProvision[5]/Article:39/Article#39/Paragraph#12/ParagraphSentence/Sentence#1.
原文逐語: 「第十項の規定により申請書の訂正又は担保提供関係書類の訂正若しくは提出を求められた当該申請者は、前項の規定による通知を受けた日の翌日から起算して二十日以内に当該申請書の訂正又は当該担保提供関係書類の訂正若しくは提出をしなければならない。」
Scope: ONLY 通知を受けた日の翌日から起算して二十日以内に申請書又は担保提供関係書類を訂正し又は提出する期間. The 第十項の訂正要求自体, 前項の通知自体, 担保提供関係書類の範囲, all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax39CorrectionWithin20Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (20), INCLUSIVE. -/
def threshold : Nat := 20

/-- 「第十項の規定により申請書の訂正又は担保提供関係書類の訂正若しくは提出を求められた当該申請者は、前項の規定による通知を受けた日の翌日から起算して二十日以内に当該申請書の訂正又は当該担保提供関係書類の訂正若しくは提出をしなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 20)

end JapanTaxLaw.InheritanceTax39CorrectionWithin20Days
