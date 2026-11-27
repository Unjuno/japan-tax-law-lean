import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt17ReexportGoodsDelegation — DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|7683650c1eee7e91e43bab06f869a0234b89d07aab791ea50dc7ebb7f077e00f
  Source path: LawBody[1]/MainProvision/MainProvision[30]/Article:17/Article#17/Paragraph#1/Item#11/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「条約の規定により輸入の後一定の期間内に輸出されることを条件として関税を免除することとされている貨物で政令で定めるもの」

Norm kind: DELEGATION — goods exempted under a treaty on condition of export
within a fixed period are further limited to those designated by cabinet order.
The computable slice models the three caller-established gates. The statutory
quote above is byte-verbatim from the pinned source; English prose is descriptive.

Variable contract (meaning / domain / type):
  treatyExempt : Bool — caller-established treaty-based duty-exemption status.
  exportedInPeriod : Bool — caller-established export-within-period status.
  cabinetDesignated : Bool — caller-established cabinet-order designation.
  inScope : Bool -> Bool -> Bool -> Bool — conjunction of the three gates.
  No numeric amount/unit applies (structural gate). Treaty content, the period's
  length, cabinet-order content and legal correctness are NOT MODELLED. Human
  legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt17ReexportGoodsDelegation

/-- All three gates: treaty basis, export period, cabinet designation. -/
def inScope (treatyExempt exportedInPeriod cabinetDesignated : Bool) : Bool :=
  treatyExempt && exportedInPeriod && cabinetDesignated

/-- All three gates true puts the goods in scope. -/
theorem all_true_in_scope : inScope true true true = true := rfl

/-- Missing treaty basis puts the goods out of scope. -/
theorem no_treaty_out_of_scope : inScope false true true = false := rfl

/-- Missing export-in-period puts the goods out of scope. -/
theorem no_export_out_of_scope : inScope true false true = false := rfl

/-- Missing cabinet designation puts the goods out of scope. -/
theorem no_designation_out_of_scope : inScope true true false = false := rfl

end JapanTaxLaw.CustomsTariffArt17ReexportGoodsDelegation
