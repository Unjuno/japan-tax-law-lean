import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt32EquivalentCauseDelegation — DELEGATION

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|82d24538082c811fd40812c245cec18adcb9be279741d0f8070dbf6c3497523b
  Source path: LawBody[3]/MainProvision/MainProvision[3]/Article:32/Article#32/Paragraph#1/Item#6/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前各号に規定する事由に準ずるものとして政令で定める事由が生じたこと。」

Norm kind: DELEGATION — a cause prescribed by cabinet order as analogous to the
causes listed in the preceding items triggers the rule. The computable slice
models the cause-occurrence and cabinet-designation gates. The statutory quote
above is byte-verbatim from the pinned source (old spelling 準ずる preserved);
English prose here is descriptive only.

Variable contract (meaning / domain / type):
  causeOccurred : Bool — caller-established occurrence of the cause.
  cabinetDesignated : Bool — caller-established cabinet-order designation as
    analogous to a listed cause.
  inScope : Bool -> Bool -> Bool — conjunction of both gates.
  No numeric amount/unit applies (structural gate). Cabinet-order content,
  the preceding items' content and legal correctness are NOT MODELLED. Human
  legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt32EquivalentCauseDelegation

/-- Both gates: cause occurrence and cabinet-order designation. -/
def inScope (causeOccurred cabinetDesignated : Bool) : Bool :=
  causeOccurred && cabinetDesignated

/-- Both gates true puts the cause in scope. -/
theorem both_true_in_scope : inScope true true = true := rfl

/-- Without the cause the item is out of scope. -/
theorem no_cause_out_of_scope : inScope false true = false := rfl

/-- Without cabinet designation the item is out of scope. -/
theorem no_designation_out_of_scope : inScope true false = false := rfl

end JapanTaxLaw.InheritanceTaxArt32EquivalentCauseDelegation
