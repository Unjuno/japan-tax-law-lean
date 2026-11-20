import JapanTaxLaw.TaxFinance

/-!
# InheritanceCivilCodeRelativeRef — 相続税法 art.1_2（民法877条の親族を参照する定義）

Pinned source:
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|12e21a0a9f20bff1db674861bd44ab88a5ad29f22d750c0042c85775e51414cb
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:1_2/Article#1_2/
               Paragraph#1/Item#1/ItemSentence/Column#2/Sentence#1
  Statutory article: art. 1_2(1) item 1 (REFERENCE / cross-law definition)

原文逐語（pinned, 一字一句改変なし）:
  「配偶者及び民法（明治二十九年法律第八十九号）第八百七十七条（扶養義務者）に規定する親族をいう。」

Variable contract:
  This clause DEFINES a term by cross-reference. The defined class has two
  disjuncts: 配偶者 (spouse) and 民法第八百七十七条に規定する親族 (relatives
  prescribed in Civil Code art.877, captioned 扶養義務者). `PersonKind`
  enumerates those two plus an `other` value used ONLY as a boundary probe for
  persons outside the defined class (not a statutory category).
  The reference target is recorded explicitly: law 民法, 明治二十九年法律第八十九号
  (law number 89), article 877, caption 扶養義務者.

Scope: only the referential definition and its target identity. The substantive
content of 民法877 (who counts as a support-obligor relative), other items of
art.1_2, and all tax consequences are NOT MODELLED. Computable slice of one
norm unit.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceCivilCodeRelativeRef

/-- The referent law number: 明治二十九年法律第八十九号. -/
def referenceLawNumber : Nat := 89

/-- The referent article: 民法第八百七十七条. -/
def referenceArticle : Nat := 877

/-- Kinds of person relevant to the definition; `other` is a boundary probe. -/
inductive PersonKind where
  | spouse                -- 配偶者 (stated in this law)
  | civilCode877Relative  -- 民法877条に規定する親族 (by cross-reference)
  | other                 -- outside the defined class (boundary probe only)
  deriving BEq, DecidableEq

/-- Membership in the defined term (implementation: equality disjunction). -/
def inDefinedTerm (p : PersonKind) : Bool :=
  p == PersonKind.spouse || p == PersonKind.civilCode877Relative

end JapanTaxLaw.InheritanceCivilCodeRelativeRef
