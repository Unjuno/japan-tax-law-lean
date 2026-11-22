import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt7ReadingApplication — 関税定率法 第七条(21)（準用）READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|bfcac1c4b65905e68d25b72571e490792faac1b89d59528e53f37f99f733fd64
  Source path: LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/
               Paragraph#21/ParagraphSentence/Sentence#1
  Article caption: （相殺関税）

原文逐語（pinned, 一字一句改変なし）:
  「第八項及び第九項の規定は、第十九項の調査が開始された場合について準用する。」

Norm kind: READING — a 準用 (mutatis-mutandis application). The provisions of
paragraphs 8 and 9 (第八項及び第九項の規定) are read into the case where
the paragraph-19 investigation (第十九項の調査) has begun. Unlike a 読替え
(textual substitution), this models WHICH source provisions apply in WHICH trigger
case, not a string replacement. All paragraph numbers (8, 9,
19) and the 準用 marker are extracted structurally from the verbatim needle.

Variable contract (meaning / unit / domain / type):
  Provision : Type — the provisions being read in (para8, para9).
  InvestigationState : Type — para19Started (第十九項の調査が開始された)
    or other (any other case).
  appliesViaReading : InvestigationState -> Provision -> Prop — true iff the
    para-19 investigation has begun (both source provisions then apply).
  No numeric amount/unit/rounding applies (structural cross-reference, not a formula).

Scope: only the cross-reference structure (which provisions are read into the
para-19 investigation-start case). The substantive content of paragraphs
8, 9, 19, the trigger's establishment, other reading rules,
and legal correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt7ReadingApplication

/-- The source provisions read in (第八項, 第九項). -/
inductive Provision : Type
  | para8 : Provision
  | para9 : Provision

deriving instance DecidableEq for Provision

/-- The trigger state: para19 investigation started (第十九項の調査が開始された)
    versus any other case. -/
inductive InvestigationState : Type
  | para19Started : InvestigationState
  | other : InvestigationState

deriving instance DecidableEq for InvestigationState

/-- Paragraph number of a source provision (8 / 9), from the verbatim. -/
def provisionParagraph : Provision -> Nat
  | Provision.para8 => 8
  | Provision.para9 => 9

/-- The trigger paragraph number (第十九項 = 19), from the verbatim. -/
def triggerParagraph : Nat := 19

/-- 準用: both source provisions apply when the para-19 investigation has begun. -/
def appliesViaReading (s : InvestigationState) (_p : Provision) : Prop :=
  s = InvestigationState.para19Started

end JapanTaxLaw.CustomsTariffArt7ReadingApplication
