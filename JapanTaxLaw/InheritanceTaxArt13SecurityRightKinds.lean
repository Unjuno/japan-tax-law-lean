import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt13SecurityRightKinds — EFFECT

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|4db9b05db4964c68d07dea49463fe1dd72302abd50067a924db0ecd6d0e054fb
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:13/Article#13/Paragraph#2/Item#2/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「その財産を目的とする留置権、特別の先取特権、質権又は抵当権で担保される債務」

Norm kind: EFFECT — Article 13(2) item 2 enumerates the kinds of security rights
securing a debt: possessory lien (retention right) (留置権), a special preferential right
(特別の先取特権), a pledge (質権) or a mortgage (抵当権). The computable slice
models the enumerated right-kind set and membership. The statutory terms above are
reproduced from the verbatim needle; the canonical quote is byte-verbatim.

Variable contract (meaning / domain / type):
  SecurityRight : Type — retention, specialPriority, pledge, mortgage (and other).
  isListedRight : SecurityRight -> Bool — true for the four enumerated rights.
  No numeric amount/unit applies (structural enumeration, not a formula).

Scope: only the enumeration membership. The substantive legal effect of these
rights, the rest of Article 13, and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt13SecurityRightKinds

/-- The security rights named in the provision (plus an 'other' constructor). -/
inductive SecurityRight : Type
  | retention : SecurityRight
  | specialPriority : SecurityRight
  | pledge : SecurityRight
  | mortgage : SecurityRight
  | other : SecurityRight

/-- 留置権、特別の先取特権、質権又は抵当権: the enumerated rights. -/
def isListedRight (r : SecurityRight) : Bool :=
  match r with
  | SecurityRight.retention => true
  | SecurityRight.specialPriority => true
  | SecurityRight.pledge => true
  | SecurityRight.mortgage => true
  | SecurityRight.other => false

/-- 留置権 is listed. -/
theorem retention_listed : isListedRight SecurityRight.retention = true := rfl

/-- 特別の先取特権 is listed. -/
theorem special_priority_listed : isListedRight SecurityRight.specialPriority = true := rfl

/-- 質権 is listed. -/
theorem pledge_listed : isListedRight SecurityRight.pledge = true := rfl

/-- 抵当権 is listed. -/
theorem mortgage_listed : isListedRight SecurityRight.mortgage = true := rfl

/-- An unlisted right is not covered. -/
theorem other_not_listed : isListedRight SecurityRight.other = false := rfl

end JapanTaxLaw.InheritanceTaxArt13SecurityRightKinds
