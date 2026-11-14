/-!
# Residency (limited statutory definitions)

Source:
- Income Tax Act (Act No. 33 of 1965), Article 2(1)(iii) and (v).
- https://laws.e-gov.go.jp/law/340AC0000000033/

Scope:
The Boolean inputs are *already determined legal facts*. This module does
not determine domicile, interpret "continuously for one year or more",
or model Article 3 deemed-domicile rules, implementing orders or treaties.

A theorem here establishes only consistency of this limited abstraction,
not that the Japanese Income Tax Act contains (or lacks) a drafting error.
-/

namespace JapanTaxLaw

/-- Two externally established legal predicates relevant to Article 2(1)(iii).
    A Bool is dimensionless; no duration-to-day-count conversion is assumed. -/
structure ResidencyFacts where
  hasDomesticDomicile : Bool
  hasContinuousDomesticAbodeAtLeastOneYear : Bool
  deriving DecidableEq, Repr

/-- Limited model of "resident", Article 2(1)(iii). -/
def resident (f : ResidencyFacts) : Bool :=
  f.hasDomesticDomicile || f.hasContinuousDomesticAbodeAtLeastOneYear

/-- Limited model of "non-resident", Article 2(1)(v). -/
def nonResident (f : ResidencyFacts) : Bool :=
  !resident f

/-- The resident classification is precisely the disjunction of the inputs. -/
theorem resident_iff (f : ResidencyFacts) :
    resident f = true ↔
      f.hasDomesticDomicile = true ∨
      f.hasContinuousDomesticAbodeAtLeastOneYear = true := by
  cases f with
  | mk domicile abode =>
    cases domicile <;> cases abode <;> decide

/-- Within this model, every input is classified in at least one category. -/
theorem classification_exhaustive (f : ResidencyFacts) :
    resident f = true ∨ nonResident f = true := by
  cases h : resident f <;> simp [nonResident, h]

/-- Within this model, no input belongs to both categories. -/
theorem classification_exclusive (f : ResidencyFacts) :
    ¬ (resident f = true ∧ nonResident f = true) := by
  cases h : resident f <;> simp [nonResident, h]

/-- A verified domestic domicile suffices for residence in this model. -/
theorem domestic_domicile_sufficient (f : ResidencyFacts)
    (h : f.hasDomesticDomicile = true) : resident f = true := by
  simp [resident, h]

/-- A verified continuous domestic abode for at least one year suffices. -/
theorem abode_sufficient (f : ResidencyFacts)
    (h : f.hasContinuousDomesticAbodeAtLeastOneYear = true) :
    resident f = true := by
  simp [resident, h]

end JapanTaxLaw
