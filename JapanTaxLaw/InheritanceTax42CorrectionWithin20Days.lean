import JapanTaxLaw.TaxFinance

/-
# InheritanceTax42CorrectionWithin20Days — pinned clause 「第八項の規定により申請書の訂正又は物納手続関係書類の訂正若しくは提出を求められた当該申請者は、前項の規定による通知を受けた日の翌日から起算して二十日以内に当該申請書の訂正又は当該物納手続関係書類の訂正若しくは提出をしなければならない。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 42, paragraph 10.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|b9a19904c52f432cc27608eae1e49d46c33cba41eb2dd69ce9193344ebd923e8.
Source path: LawBody[3]/MainProvision/MainProvision[5]/Article:42/Article#42/Paragraph#10/ParagraphSentence/Sentence#1.
原文逐語: 「第八項の規定により申請書の訂正又は物納手続関係書類の訂正若しくは提出を求められた当該申請者は、前項の規定による通知を受けた日の翌日から起算して二十日以内に当該申請書の訂正又は当該物納手続関係書類の訂正若しくは提出をしなければならない。」
Scope: ONLY the 通知を受けた日の翌日から起算して二十日以内 (days ≤ 20) INCLUSIVE ceiling for the 申請書・物納手続関係書類の訂正若しくは提出. 第八項の訂正要求・前項の通知・訂正の内容・手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax42CorrectionWithin20Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (20), INCLUSIVE ceiling. -/
def threshold : Nat := 20

/-- 「第八項の規定により申請書の訂正又は物納手続関係書類の訂正若しくは提出を求められた当該申請者は、前項の規定による通知を受けた日の翌日から起算して二十日以内に当該申請書の訂正又は当該物納手続関係書類の訂正若しくは提出をしなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 20)

end JapanTaxLaw.InheritanceTax42CorrectionWithin20Days
