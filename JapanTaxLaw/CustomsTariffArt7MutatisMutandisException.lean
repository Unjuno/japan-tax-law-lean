import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt7MutatisMutandisException — EXCEPTION + READING + CONDITION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|1432e7d9fd592fd3f859fd0bb6be8bf74a4119a191bd87e0ad89bbc16a123d15
  Source path: LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#15/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「第七項、第八項（第一号を除く。）及び第九項の規定は、前項の調査が開始された場合について準用する。」

Norm kind: EXCEPTION (with READING and CONDITION aspects) — the provisions of
paragraphs 7, 8 (excluding its item 1) and 9 apply mutatis mutandis when the
investigation under the preceding paragraph has begun. The computable slice
models exactly: (a) which provisions are included, with the item-1 carve-out;
(b) the applicability condition on the investigation flag. The statutory quote
above is byte-verbatim from the pinned source; English prose here is descriptive.

Variable contract (meaning / domain / type):
  Provision : Type — finite enumeration of the enumerated provisions plus `other`.
  investigationStarted : Bool — whether the preceding paragraph's investigation
    has begun; caller-established, not computed here.
  included : Provision -> Bool — true for paragraphs 7, 8 (except item 1), 9.
  applies : Bool -> Provision -> Bool — mutatis-mutandis applicability flag.
  No numeric amount/unit applies (structural selection); the content and legal
  effect of the incorporated provisions are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt7MutatisMutandisException

/-- The provisions enumerated by the source, with the item-1 carve-out. -/
inductive Provision : Type
  | paragraph7 : Provision
  | paragraph8Item1 : Provision
  | paragraph8Other : Provision
  | paragraph9 : Provision
  | other : Provision

/-- Which provisions are incorporated (item 1 of paragraph 8 is excluded). -/
def included : Provision -> Bool
  | Provision.paragraph7 => true
  | Provision.paragraph8Item1 => false
  | Provision.paragraph8Other => true
  | Provision.paragraph9 => true
  | Provision.other => false

/-- Applicability gate: incorporation applies only once the investigation has begun. -/
def applies (investigationStarted : Bool) (p : Provision) : Bool :=
  investigationStarted && included p

/-- Item 1 of paragraph 8 is excluded from the incorporated provisions. -/
theorem item1_excepted : included Provision.paragraph8Item1 = false := rfl

/-- The excluded item never applies, whatever the investigation flag. -/
theorem item1_never_applies (s : Bool) : applies s Provision.paragraph8Item1 = false := by
  cases s <;> rfl

/-- Paragraph 7 applies when the investigation has begun. -/
theorem paragraph7_applies : applies true Provision.paragraph7 = true := rfl

/-- Paragraph 9 applies when the investigation has begun. -/
theorem paragraph9_applies : applies true Provision.paragraph9 = true := rfl

/-- The remaining part of paragraph 8 applies when the investigation has begun. -/
theorem paragraph8Other_applies : applies true Provision.paragraph8Other = true := rfl

/-- Without the investigation having begun, nothing applies. -/
theorem no_investigation_no_apply (p : Provision) : applies false p = false := by
  cases p <;> rfl

end JapanTaxLaw.CustomsTariffArt7MutatisMutandisException
