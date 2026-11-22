import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt7PrevParagraphReading — 関税定率法 第七条(25)（準用）READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|f8c7e9bb416eb400df2c804473bd1982fd394436266d05baed397418ac7c731e
  Source path: LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/
               Paragraph#25/ParagraphSentence/Sentence#1
  Article caption: （相殺関税）

原文逐語（pinned, 一字一句改変なし）:
  「第八項、第九項及び第二十項の規定は、前項の調査が開始された場合について準用する。」

Norm kind: READING — a 準用 (mutatis-mutandis application). The provisions of
paragraphs 8, 9 and 20 (第八項、第九項及び第二十項の規定) are read into
the case where the 前項 investigation (直前の 24 項の調査) has begun. This
models WHICH source provisions apply in WHICH trigger case, not a string
replacement. Source paragraph numbers 8/9/20 and the 準用 marker are
extracted from the verbatim needle; the trigger number 24 is the
immediately preceding paragraph derived from the source path (Paragraph#25).

Variable contract (meaning / unit / domain / type):
  Provision : Type — the source provisions read in (para8, para9, para20).
  InvestigationState : Type — prevStarted (前項の調査が開始された) or other.
  appliesViaReading : InvestigationState -> Provision -> Prop — true iff the
    前項 investigation has begun (all three source provisions then apply).
  No numeric amount/unit/rounding applies (structural cross-reference).

Scope: only the cross-reference structure. The substantive content of paragraphs
8/9/20/24, the trigger's establishment, other reading rules,
and legal correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt7PrevParagraphReading

/-- The source provisions read in (第八項, 第九項, 第二十項). -/
inductive Provision : Type
  | para8 : Provision
  | para9 : Provision
  | para20 : Provision

deriving instance DecidableEq for Provision

/-- The trigger state: 前項 investigation started versus any other case. -/
inductive InvestigationState : Type
  | prevStarted : InvestigationState
  | other : InvestigationState

deriving instance DecidableEq for InvestigationState

/-- Paragraph number of a source provision (8 / 9 / 20), from the verbatim. -/
def provisionParagraph : Provision -> Nat
  | Provision.para8 => 8
  | Provision.para9 => 9
  | Provision.para20 => 20

/-- The 前項 trigger paragraph number (24), from the source path. -/
def triggerParagraph : Nat := 24

/-- 準用: all source provisions apply when the 前項 investigation has begun. -/
def appliesViaReading (s : InvestigationState) (_p : Provision) : Prop :=
  s = InvestigationState.prevStarted

end JapanTaxLaw.CustomsTariffArt7PrevParagraphReading
