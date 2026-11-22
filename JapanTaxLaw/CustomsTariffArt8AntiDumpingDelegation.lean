import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt8AntiDumpingDelegation — 関税定率法 第八条(37)（委任）DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|0187b7b5ea69015b97344eeb2e2b28eef7be540ff68900577a2e77b1fc6273fe
  Source path: LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/
               Paragraph#37/ParagraphSentence/Sentence#1
  Article caption: （不当廉売関税）

原文逐語（pinned, 一字一句改変なし）:
  「前各項に定めるもののほか、不当廉売関税の適用に関し必要な事項は、政令で定める。」

Norm kind: DELEGATION — a residual delegation. Besides the matters prescribed in
the preceding paragraphs (residual clause 前各項に定めるもののほか), matters necessary for
the application of 不当廉売関税 are prescribed by 政令. The residual ほか
("in addition to") encodes non-overlap with the Act-prescribed matters. The
computable slice models which legal source determines each matter class. The
actual content of the 政令 is NOT MODELLED. All statutory terms
extracted structurally from the verbatim needle's own delimiters (、 / のほか /
で定める / の適用) — no hand-typed statutory strings.

Variable contract (meaning / unit / domain / type):
  Matter : Type — inAct (matters in the preceding paragraphs) and
    necessaryForApplication (matters necessary for 不当廉売関税 application).
  LegalSource : Type — act | cabinetOrder (政令).
  determinedBy : Matter -> LegalSource — the delegating relation.
  No numeric amount/unit/dimension applies (structural DELEGATION, not a formula).

Scope: only the delegating structure. The actual 政令 content, other
articles, and legal correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt8AntiDumpingDelegation

/-- Class of matter (不当廉売関税 application matters). -/
inductive Matter : Type
  | inAct : Matter
  | necessaryForApplication : Matter

/-- Legal source that determines a matter (act | 政令). -/
inductive LegalSource : Type
  | act : LegalSource
  | cabinetOrder : LegalSource

deriving instance DecidableEq for Matter
deriving instance DecidableEq for LegalSource

/-- 政令で定める: necessary application matters are determined by Cabinet Order. -/
def determinedBy (m : Matter) : LegalSource :=
  match m with
  | Matter.inAct => LegalSource.act
  | Matter.necessaryForApplication => LegalSource.cabinetOrder

/-- Residual ほか: in-Act matters are determined by the Act, not delegated. -/
theorem in_act_not_delegated : determinedBy Matter.inAct = LegalSource.act := rfl

/-- Necessary application matters are delegated to 政令. -/
theorem application_delegated :
    determinedBy Matter.necessaryForApplication = LegalSource.cabinetOrder := rfl

end JapanTaxLaw.CustomsTariffArt8AntiDumpingDelegation
