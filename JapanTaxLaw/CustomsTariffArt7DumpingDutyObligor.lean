import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt7DumpingDutyObligor — EFFECT

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|55732d61aadf34d9ec30275f6f3461c7eb7c5699b8d8647180d92c9bc8124760
  Source path: LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#4/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前項の相殺関税は、当該相殺関税を課されることとなる貨物の輸入者が納める義務があるものとする。」

Norm kind: EFFECT — the preceding paragraph's dumping duty is an obligation
borne by the importer of the goods subject to that duty. The computable slice
models the obligor selection. The statutory quote above is byte-verbatim from
the pinned source; English prose here is descriptive only.

Variable contract (meaning / domain / type):
  Obligor : Type — importer, other.
  obligor : Obligor — the selected duty obligor.
  dutyObligation : Prop — whether the importer bears the obligation.
  No numeric amount/unit applies (structural selection). Duty computation and
  legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt7DumpingDutyObligor

/-- Possible obligors for the dumping duty. -/
inductive Obligor : Type
  | importer : Obligor
  | other : Obligor

/-- The duty obligation is borne by the importer. -/
def obligor : Obligor := Obligor.importer

/-- The importer bears the obligation. -/
def dutyObligation : Prop :=
  obligor = Obligor.importer

/-- The selected obligor is the importer. -/
theorem obligor_is_importer : obligor = Obligor.importer := rfl

/-- The duty obligation holds. -/
theorem importer_bears_duty : dutyObligation := rfl

/-- Another obligor is not selected. -/
theorem other_not_selected : obligor ≠ Obligor.other := by
  unfold obligor
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt7DumpingDutyObligor
