import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt15ActualChildDeeming — DEEMING

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|3a29e9541c61aee3230a076944570965f9b95a0617d2d8dd3a8975ee05f475df
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:15/Article#15/Paragraph#3/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前項の規定の適用については、次に掲げる者は実子とみなす。」

Norm kind: DEEMING — for the application of the preceding paragraph, the
enumerated persons are deemed to be actual children. The computable slice
models that classification transformation over a three-way enumeration.
The statutory quote above is byte-verbatim from the pinned source; English
prose here is descriptive only.

Variable contract (meaning / domain / type):
  PersonClass : Type — listedPerson, actualChild, other.
  deemAsActualChild : PersonClass -> PersonClass — the deeming transformation.
  classifiedAsActualChild : PersonClass -> Prop — resulting classification.
  No numeric amount/unit applies (structural classification). The identity of
  the enumerated persons and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt15ActualChildDeeming

/-- Person classes relevant to the deeming rule. -/
inductive PersonClass : Type
  | listedPerson : PersonClass
  | actualChild : PersonClass
  | other : PersonClass

/-- The deeming transformation, with fully explicit branches. -/
def deemAsActualChild : PersonClass -> PersonClass
  | PersonClass.listedPerson => PersonClass.actualChild
  | PersonClass.actualChild => PersonClass.actualChild
  | PersonClass.other => PersonClass.other

/-- Whether a class is treated as an actual child after deeming. -/
def classifiedAsActualChild (p : PersonClass) : Prop :=
  deemAsActualChild p = PersonClass.actualChild

/-- A listed person is deemed an actual child. -/
theorem listed_deemed_actual_child : classifiedAsActualChild PersonClass.listedPerson := rfl

/-- An actual child remains classified as such. -/
theorem actual_child_unchanged : classifiedAsActualChild PersonClass.actualChild := rfl

/-- An unrelated person is not deemed an actual child. -/
theorem other_not_deemed : ¬ classifiedAsActualChild PersonClass.other := by
  unfold classifiedAsActualChild deemAsActualChild
  intro h
  cases h

end JapanTaxLaw.InheritanceTaxArt15ActualChildDeeming
