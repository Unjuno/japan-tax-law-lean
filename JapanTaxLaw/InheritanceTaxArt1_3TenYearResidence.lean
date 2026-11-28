import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt1_3TenYearResidence — 相続税法 art.1の3 (相続開始前十年以内の住所)

Pinned source:
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Enforcement: 2026-04-01

Normative unit: NORM|46158208ca535db7caaf710f6aaccd29da4847ec77e12c037869077566d13fdf
Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:1_3/Article#1_3/Paragraph#1/Item#2/Subitem1#1/Subitem2#1/Subitem2Sentence/Sentence#1
Verbatim unit: 「当該相続又は遺贈に係る相続の開始前十年以内のいずれかの時においてこの法律の施行地に住所を有していたことがあるもの」

Reading (verbatim): the person had a domicile in this law's territory at some
time within ten years before the inheritance/gift start. `yearsBefore` is
caller-established; 「十年以内」 is inclusive at year 10.

Scope: only the ten-year window predicate and its boundary. The identity of the
person, the other subitems, the tax consequences and all other paragraphs are
NOT MODELLED. One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.InheritanceTaxArt1_3TenYearResidence

/-- 「十年」. Unit: years; domain: Nat. -/
def windowYears : Nat := 10

/-- 相続開始前十年以内 (inclusive at 10). -/
def hadResidenceWithin (yearsBefore : Nat) : Bool :=
  yearsBefore <= windowYears

example : windowYears = 10 := by decide
example : hadResidenceWithin 0 = true := by decide
example : hadResidenceWithin 9 = true := by decide
example : hadResidenceWithin 10 = true := by decide
example : hadResidenceWithin 11 = false := by decide
example : hadResidenceWithin 20 = false := by decide

end JapanTaxLaw.InheritanceTaxArt1_3TenYearResidence
