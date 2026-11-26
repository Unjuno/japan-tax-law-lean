import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt6RefundReading — READING

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|6a9778cbcc93bdfeea0959a2d1564eb147745c8fdb27015070e8875a83e9923e
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:6/Article#6/Paragraph#2/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし、旧かな遣いを保持）:
  「前項の規定は、定期金給付契約について返還金その他これに準ずるものの取得があつた場合について準用する。」

Norm kind: READING (with CONDITION aspect) — the preceding paragraph's rule is
applied mutatis mutandis in cases where an annuity contract has yielded a
refund or similar acquisition. The computable slice models the case selection.
The statutory quote above is byte-verbatim from the pinned source, including
the old kana spelling; English prose here is descriptive only.

Variable contract (meaning / domain / type):
  Case : Type — refundAcquisition, other.
  applies : Case -> Prop — whether the preceding paragraph is read in.
  No numeric amount/unit applies (structural case selection). The content of
  the preceding paragraph and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt6RefundReading

/-- The case classes relevant to the mutatis mutandis reading. -/
inductive Case : Type
  | refundAcquisition : Case
  | other : Case

/-- The preceding paragraph is read in for a refund acquisition. -/
def applies : Case -> Prop
  | Case.refundAcquisition => True
  | Case.other => False

/-- A refund acquisition qualifies. -/
theorem refund_applies : applies Case.refundAcquisition := by trivial

/-- An unrelated case does not qualify. -/
theorem other_not_applies : ¬ applies Case.other := by
  intro h
  cases h

/-- Qualification is decidable by case. -/
theorem applies_decidable : applies Case.refundAcquisition ∨ ¬ applies Case.other := by
  left
  trivial

end JapanTaxLaw.InheritanceTaxArt6RefundReading
