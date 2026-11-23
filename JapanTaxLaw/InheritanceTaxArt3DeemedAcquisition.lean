import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt3DeemedAcquisition — DEEMING

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|6a574541c0cc8e189b22ac97d2c2ddacaa3a00871afe9a7f5c9ca2137f72dc74
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:3/Article#3/ArticleCaption

原文逐語（pinned, 一字一句改変なし）:
  「（相続又は遺贈により取得したものとみなす場合）」

Norm kind: DEEMING — this is the article caption (見出し) of 第三条, labeling the
cases deemed to be acquisitions by inheritance or legacy. The computable slice
models the disjunctive acquisition-mode discrimination (the 又は of 相続/遺贈).
This is a heading, NOT the operative deeming provisions; the substantive deeming
rules and their legal consequences are NOT MODELLED.
Structural facts extracted from the caption; no hand-typed CJK.

Variable contract (meaning / domain / type):
  AcquisitionMode : Type — inheritance (相続), legacy (遺贈), or other.
  isDeemed : AcquisitionMode -> Bool — true for either listed mode (the 又は).
  No numeric amount/unit applies (structural DEEMING, not a formula).

Scope: only the caption-level disjunctive-mode discrimination. Operative deeming
provisions and legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt3DeemedAcquisition

/-- The acquisition modes named in the caption. -/
inductive AcquisitionMode : Type
  | inheritance : AcquisitionMode
  | legacy : AcquisitionMode
  | other : AcquisitionMode

/-- Deeming applies to either listed mode (the 又は disjunction). -/
def isDeemed (m : AcquisitionMode) : Bool :=
  match m with
  | AcquisitionMode.inheritance => true
  | AcquisitionMode.legacy => true
  | AcquisitionMode.other => false

/-- Inheritance is a deemed case. -/
theorem inheritance_deemed : isDeemed AcquisitionMode.inheritance = true := rfl

/-- Legacy is a deemed case. -/
theorem legacy_deemed : isDeemed AcquisitionMode.legacy = true := rfl

/-- Other modes are not deemed cases. -/
theorem other_not_deemed : isDeemed AcquisitionMode.other = false := rfl

end JapanTaxLaw.InheritanceTaxArt3DeemedAcquisition
