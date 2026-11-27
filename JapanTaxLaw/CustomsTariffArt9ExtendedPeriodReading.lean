import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt9ExtendedPeriodReading — READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|f55c47850f0fe15d2b1a966c8b34dda9488ecbc318966a97e974a14813bff0ad
  Source path: LawBody[1]/MainProvision/MainProvision[19]/Article:9/Article#9/Paragraph#11/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「第六項及び第七項の規定は、第一項の規定により指定された期間を前項の規定により延長する場合について準用する。」

Norm kind: READING (with CONDITION aspect) — paragraphs 6 and 7 are applied
mutatis mutandis where the period designated under paragraph 1 is extended
under the preceding paragraph. The computable slice models the extension gate
only. The statutory quote above is byte-verbatim from the pinned source;
English prose here is descriptive only.

Variable contract (meaning / domain / type):
  periodExtended : Bool — caller-established status of the designated period.
  applies : Bool -> Prop — whether paragraphs 6/7 are read in.
  No numeric amount/unit applies (structural gate). The content of paragraphs
  6/7 and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt9ExtendedPeriodReading

/-- The mutatis mutandis reading gate. -/
def applies (periodExtended : Bool) : Prop :=
  periodExtended = true

/-- An extended period triggers the reading. -/
theorem extended_applies : applies true := rfl

/-- A non-extended period does not trigger the reading. -/
theorem not_extended_rejected : ¬ applies false := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt9ExtendedPeriodReading
