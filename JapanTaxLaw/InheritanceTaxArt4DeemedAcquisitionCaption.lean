import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt4DeemedAcquisitionCaption — DEEMING

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|231c551d81dabb99d1af6fba695e53d8baf56b0b7e48a165b245be1e56c4226c
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:4/Article#4/ArticleCaption

原文逐語（pinned, 一字一句改変なし）:
  「（遺贈により取得したものとみなす場合）」

Norm kind: DEEMING (with CONDITION aspect) — the ArticleCaption labels the
cases in which property is deemed to have been acquired by inheritance (the
source terms are reproduced in the verbatim quote above). The computable slice
models the classification rule: a deemed acquisition is treated as an
inheritance acquisition, while an unrelated acquisition is not. The statutory
quote above is byte-verbatim from the pinned source; English prose here is
descriptive only.

Variable contract (meaning / domain / type):
  Acquisition : Type — deemedByInheritance, byInheritance, other.
  classifiedAsInheritance : Acquisition -> Bool — whether the case is treated
    as an inheritance acquisition for this caption's scope.
  deemAsInheritance : Acquisition -> Acquisition — the deeming transformation.
  No numeric amount/unit applies (structural classification); the substantive
  conditions, valuation, and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt4DeemedAcquisitionCaption

/-- The acquisition classifications relevant to the caption. -/
inductive Acquisition : Type
  | deemedByInheritance : Acquisition
  | byInheritance : Acquisition
  | other : Acquisition

/-- Whether the case is classified as an inheritance acquisition. -/
def classifiedAsInheritance : Acquisition -> Bool
  | Acquisition.deemedByInheritance => true
  | Acquisition.byInheritance => true
  | Acquisition.other => false

/-- The deeming transformation: a deemed case is treated as inheritance. -/
def deemAsInheritance : Acquisition -> Acquisition
  | Acquisition.deemedByInheritance => Acquisition.byInheritance
  | Acquisition.byInheritance => Acquisition.byInheritance
  | Acquisition.other => Acquisition.other

/-- A deemed acquisition is classified as inheritance. -/
theorem deemed_classified : classifiedAsInheritance Acquisition.deemedByInheritance = true := rfl

/-- An actual inheritance acquisition is classified as inheritance. -/
theorem actual_classified : classifiedAsInheritance Acquisition.byInheritance = true := rfl

/-- An unrelated acquisition is not classified as inheritance. -/
theorem other_not_classified : classifiedAsInheritance Acquisition.other = false := rfl

/-- The deeming transformation maps the deemed case to inheritance. -/
theorem deeming_yields_inheritance :
    deemAsInheritance Acquisition.deemedByInheritance = Acquisition.byInheritance := rfl

/-- The deemed case is distinct from an unrelated acquisition. -/
theorem deemed_not_other : Acquisition.deemedByInheritance ≠ Acquisition.other := by
  intro h
  cases h

end JapanTaxLaw.InheritanceTaxArt4DeemedAcquisitionCaption
