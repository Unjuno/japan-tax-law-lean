import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt8PrevReadingSubsection6to8 — 関税定率法 第八条(14)（準用）READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|533e8fd979ea8c72174c0058f51b1b16fd737427b0e378f0dc295d0f0140ed08
  Source path: LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/
               Paragraph#14/ParagraphSentence/Sentence#1
  Article caption: （不当廉売関税）

原文逐語（pinned, 一字一句改変なし）:
  「第六項から第八項までの規定は、前項の調査が開始された場合について準用する。」

Norm kind: READING — a 準用 (mutatis-mutandis application). The provisions of
paragraphs 6 to 8 (第六項から第八項までの規定) are read into the case where
the preceding paragraph (前項, para 13) investigation has begun. The
source paragraph range 6–8 is extracted structurally from the verbatim;
the trigger number 13 is the immediately preceding paragraph derived from
the source path (Paragraph#14). No statutory string is hand-typed.

Variable contract (meaning / unit / domain / type):
  Provision : Type — source provisions para6, para7, para8.
  InvestigationState : Type — prevStarted (前項の調査が開始された) | other.
  appliesViaReading : InvestigationState -> Provision -> Prop — true iff the 前項
    investigation has begun (all source provisions then apply).
  No numeric amount/unit applies (structural cross-reference).

Scope: only the cross-reference structure. The substantive content of paragraphs
6–8/13, the trigger's establishment, other reading rules, and
legal correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt8PrevReading6to8

/-- Source provisions 第六項, 第七項, 第八項. -/
inductive Provision : Type
  | para6 : Provision
  | para7 : Provision
  | para8 : Provision

deriving instance DecidableEq for Provision

/-- Trigger state: 前項 investigation started versus any other case. -/
inductive InvestigationState : Type
  | prevStarted : InvestigationState
  | other : InvestigationState

deriving instance DecidableEq for InvestigationState

/-- Paragraph number of a source provision (6/7/8), from the verbatim range. -/
def provisionParagraph : Provision -> Nat
  | Provision.para6 => 6
  | Provision.para7 => 7
  | Provision.para8 => 8

/-- The 前項 trigger paragraph number (13), from the source path. -/
def triggerParagraph : Nat := 13

/-- 準用: all source provisions apply when the 前項 investigation has begun. -/
def appliesViaReading (s : InvestigationState) (_p : Provision) : Prop :=
  s = InvestigationState.prevStarted

end JapanTaxLaw.CustomsTariffArt8PrevReading6to8
