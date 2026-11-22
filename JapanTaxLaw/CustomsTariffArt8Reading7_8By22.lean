import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt8Reading7_8By22 — 関税定率法 第八条(24)（準用）READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|9839bfa7e7f185855424800f3e4a5eb453f506c4c71e60153da993af1f76d0ba
  Source path: LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/
               Paragraph#24/ParagraphSentence/Sentence#1
  Article caption: （不当廉売関税）

原文逐語（pinned, 一字一句改変なし）:
  「第七項及び第八項の規定は、第二十二項の調査が開始された場合について準用する。」

Norm kind: READING — a 準用 (mutatis-mutandis application). The provisions of
paragraphs 7 and 8 (第七項及び第八項の規定) are read into the case where the
paragraph-22 investigation (第二十二項の調査) has begun. Source paragraphs
7/8 and the explicit trigger 22 are all extracted structurally
from the verbatim; no statutory string is hand-typed.

Variable contract (meaning / unit / domain / type):
  Provision : Type — source provisions para7, para8.
  InvestigationState : Type — para22Started | other.
  appliesViaReading : InvestigationState -> Provision -> Prop — true iff the
    paragraph-22 investigation has begun (both provisions then apply).
  No numeric amount/unit applies (structural cross-reference).

Scope: only the cross-reference structure. The substantive content of paragraphs
7/8/22, the trigger's establishment, other reading rules, and
legal correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt8Reading7_8By22

/-- Source provisions 第七項, 第八項. -/
inductive Provision : Type
  | para7 : Provision
  | para8 : Provision

deriving instance DecidableEq for Provision

/-- Trigger state: paragraph-22 investigation started versus any other case. -/
inductive InvestigationState : Type
  | para22Started : InvestigationState
  | other : InvestigationState

deriving instance DecidableEq for InvestigationState

/-- Paragraph numbers of source provisions (7/8), from the verbatim. -/
def provisionParagraph : Provision -> Nat
  | Provision.para7 => 7
  | Provision.para8 => 8

/-- The explicit trigger paragraph number (第二十二項 = 22), from the verbatim. -/
def triggerParagraph : Nat := 22

/-- 準用: both source provisions apply when the paragraph-22 investigation has begun. -/
def appliesViaReading (s : InvestigationState) (_p : Provision) : Prop :=
  s = InvestigationState.para22Started

end JapanTaxLaw.CustomsTariffArt8Reading7_8By22
