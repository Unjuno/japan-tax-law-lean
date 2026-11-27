import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt15TreatyGoodsDelegation — DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|e88e79c160c4c7a008abfc095e601ed439e9cbeefd112e183044f3c2e2a8a57c
  Source path: LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/Paragraph#1/Item#10/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「条約の規定により輸入の後特定の用途に供されることを条件として関税を免除することとされている貨物で政令で定めるもの」

Norm kind: DELEGATION — treaty-based duty-exempt goods are further limited to
those designated by cabinet order (政令で定めるもの). The computable slice models
the two caller-established gates. The statutory quote above is byte-verbatim
from the pinned source; English prose here is descriptive only.

Variable contract (meaning / domain / type):
  treatyExempt : Bool — caller-established treaty-based duty-exemption status.
  cabinetDesignated : Bool — caller-established cabinet-order designation.
  inScope : Bool -> Bool -> Bool — conjunction of both gates.
  No numeric amount/unit applies (structural gate). Treaty content, the cabinet
  order's content, and legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt15TreatyGoodsDelegation

/-- Both gates: treaty basis and cabinet-order designation. -/
def inScope (treatyExempt cabinetDesignated : Bool) : Bool :=
  treatyExempt && cabinetDesignated

/-- A treaty-exempt, cabinet-designated good is in scope. -/
theorem both_true_in_scope : inScope true true = true := rfl

/-- Without treaty basis the good is out of scope. -/
theorem no_treaty_out_of_scope : inScope false true = false := rfl

/-- Without cabinet designation the good is out of scope. -/
theorem no_designation_out_of_scope : inScope true false = false := rfl

end JapanTaxLaw.CustomsTariffArt15TreatyGoodsDelegation
