import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt4_9Delegation — 関税定率法 第四条の九(1)（委任）DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|183467aae196b171afed87ed9853b9060bb48487f6da8c909d3dbe4f896bc1d4
  Source path: LawBody[1]/MainProvision/MainProvision[13]/Article:4_9/Article#4_9/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: （政令への委任）

原文逐語（pinned, 一字一句改変なし）:
  「第四条から前条までに定めるもののほか、輸入貨物の課税価格の計算に関し必要な事項は、政令で定める。」

Norm kind: DELEGATION. Besides the matters prescribed in the Act (第四条から前条までに定めるもののほか),
matters necessary for computing the 課税価格 of imported goods are
prescribed by 政令. The computable slice models the DELEGATION
STRUCTURE: which legal source determines each class of matter. It does NOT
model the (unprovided) content of the Cabinet Order itself.

The residual word ほか ("in addition to") encodes non-overlap: matters already
prescribed in the Act are NOT delegated. The delegated class is the necessary
matters for computing 課税価格, which are determined by 政令.

Variable contract (meaning / domain / type):
  Matter : Type — two classes: inAct (matters in the Act) and
    necessaryForCustomsValue (delegated matters).
  LegalSource : Type — act | cabinetOrder (政令).
  determinedBy : Matter -> LegalSource — the delegating relation.
  No numeric amount/unit/dimension applies (structural DELEGATION, not a formula).

Scope: only the delegating structure (source of determination per matter class).
The actual Cabinet Order content, other articles, and legal correctness are NOT
MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt4_9Delegation

/-- Class of matter (課税価格 matters). -/
inductive Matter : Type
  | inAct : Matter
  | necessaryForCustomsValue : Matter

/-- Legal source that determines a matter (act | 政令). -/
inductive LegalSource : Type
  | act : LegalSource
  | cabinetOrder : LegalSource

deriving instance DecidableEq for Matter
deriving instance DecidableEq for LegalSource

/-- 政令で定める: delegated matters are determined by Cabinet Order; Act matters by the Act. -/
def determinedBy (m : Matter) : LegalSource :=
  match m with
  | Matter.inAct => LegalSource.act
  | Matter.necessaryForCustomsValue => LegalSource.cabinetOrder

end JapanTaxLaw.CustomsTariffArt4_9Delegation
