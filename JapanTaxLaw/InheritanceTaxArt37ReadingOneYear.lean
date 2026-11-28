import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt37ReadingOneYear — 相続税法 art.37(6) (「二年」を「一年」と読み替える)

Pinned source:
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Enforcement: 2026-04-01

Normative unit: NORM|a21c53e36ea825a1b4301337ab9dc6b03aff4de951fdbdfe5e7f91d91d8ffb7c
Source path: LawBody[3]/MainProvision/MainProvision[4]/Article:37/Article#37/Paragraph#6/ParagraphSentence/Sentence#2
Verbatim unit: 「この場合において、同項ただし書中「二年」とあるのは、「一年」と読み替えるものとする。」

Reading (verbatim): in this case, the proviso's 「二年」 (2 years) is read as
「一年」 (1 year). `months` is caller-established elapsed months; the effective
period in this case is one year (12 months).

Scope: only the substituted period and its comparison. The underlying proviso,
the conditions triggering 「この場合」, and all other paragraphs are NOT MODELLED.
One computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.InheritanceTaxArt37ReadingOneYear

/-- The original proviso period 「二年」 (years). -/
def originalYears : Nat := 2
/-- The substituted period 「一年」 (years). -/
def replacementYears : Nat := 1
/-- Effective period in this case, in months. -/
def effectiveMonths : Nat := 12

/-- Within the substituted one-year period (inclusive at 12 months). -/
def withinOneYear (months : Nat) : Bool := months <= effectiveMonths

example : originalYears = 2 := by decide
example : replacementYears = 1 := by decide
example : effectiveMonths = 12 := by decide
example : withinOneYear 0 = true := by decide
example : withinOneYear 11 = true := by decide
example : withinOneYear 12 = true := by decide
example : withinOneYear 13 = false := by decide
example : withinOneYear 24 = false := by decide

end JapanTaxLaw.InheritanceTaxArt37ReadingOneYear
