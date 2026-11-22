import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt8_2NonApplicability — 関税定率法 第八条の二(2)（条件）CONDITION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|3f6a79aacce7c6e225e32f8ee0c3a4f20ff56056b93d87ac347341b2ceee1ede
  Source path: LawBody[1]/MainProvision/MainProvision[18]/Article:8_2/Article#8_2/
               Paragraph#2/ParagraphSentence/Sentence#1
  Article caption: （不当廉売関税の課税の回避のために第三国から輸入される貨物等に対して課する関税）

原文逐語（pinned, 一字一句改変なし）:
  「前項の規定は、次の各号のいずれかに該当する場合には、適用しない。」

Norm kind: CONDITION — a non-applicability gate. The preceding paragraph's
provisions do NOT apply when a case falls under any of the following enumerated
items (次の各号のいずれかに該当する場合は、適用しない). Structural inspection of
Paragraph#2 finds exactly two items (Num 1, Num 2). The computable slice models
the enumerated case discrimination (item1 / item2 / other) and the resulting
applicability gate. The substantive content of the items (investigation dates,
periods, import-volume conditions 等) and the previous paragraph are NOT MODELLED.
All statutory structure extracted from the source; no hand-typed statutory strings.

Variable contract (meaning / unit / domain / type):
  Case : Type — item1, item2 (the two enumerated items), other (no item).
  enumeratedItemCount : Nat = 2 (from the structural item numbers 1, 2).
  precedingParagraphApplies : Case -> Bool — false for item1/item2, true for other.
  No numeric amount/unit applies (case gate, not a formula).

Scope: only the case-discrimination gate. Item substance, the preceding
paragraph, and legal correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt8_2NonApplicability

/-- Case under paragraph 2: two enumerated items plus the catch-all. -/
inductive Case : Type
  | item1 : Case
  | item2 : Case
  | other : Case

deriving instance DecidableEq for Case

/-- Number of enumerated items extracted structurally from Paragraph#2 (Num 1, Num 2). -/
def enumeratedItemCount : Nat := 2

/-- 次の各号のいずれかに該当する場合は、適用しない: listed items disable the preceding paragraph. -/
def precedingParagraphApplies (c : Case) : Bool :=
  match c with
  | Case.item1 => false
  | Case.item2 => false
  | Case.other => true

/-- Item 1 falls under the enumerated cases; preceding paragraph does not apply. -/
theorem item1_not_applies : precedingParagraphApplies Case.item1 = false := rfl

/-- Item 2 falls under the enumerated cases; preceding paragraph does not apply. -/
theorem item2_not_applies : precedingParagraphApplies Case.item2 = false := rfl

/-- A case under no item is not caught by the non-applicability gate. -/
theorem other_applies : precedingParagraphApplies Case.other = true := rfl

end JapanTaxLaw.CustomsTariffArt8_2NonApplicability
