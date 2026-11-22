import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt14UnconditionalExemption — 関税定率法 第十四条(1)（委任）DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|f6d35dafe6f1a5d34c574d8205cb86f3a7c970ed725d5ad49d6d7824b4509d64
  Source path: LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: （無条件免税）

原文逐語（pinned, 一字一句改変なし）:
  「次に掲げる貨物で輸入されるものについては、政令で定めるところにより、その関税を免除する。」

Norm kind: DELEGATION — the duty exemption for the enumerated imported goods is
prescribed by Cabinet Order (政令で定めるところにより). Structural inspection of
Paragraph#1 finds 21 enumerated Item nodes. The computable slice models
which legal source prescribes the exemption for the listed goods, and the
enumerated-vs-other goods class discrimination. The substantive content of the
21 items, the actual Cabinet Order text, and the legal effect mechanics
are NOT MODELLED. All statutory strings are injected from the queue; no
hand-typed CJK.

Variable contract (meaning / unit / domain / type):
  Goods : Type — listed (one of the enumerated goods) | other.
  Authority : Type — act | cabinetOrder (政令).
  exemptionAuthority : Authority — the source prescribing the exemption.
  enumeratedItemCount : Nat = 21 (from structural Item nodes).
  No numeric amount/unit applies (structural DELEGATION, not a formula).

Scope: only the delegating structure and the listed/other discrimination.
Item substance, Cabinet Order content, and legal correctness are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt14UnconditionalExemption

/-- Goods class: listed (enumerated) or other. -/
inductive Goods : Type
  | listed : Goods
  | other : Goods

/-- Legal source prescribing the exemption (act | 政令). -/
inductive Authority : Type
  | act : Authority
  | cabinetOrder : Authority

deriving instance DecidableEq for Goods
deriving instance DecidableEq for Authority

/-- Number of enumerated Item nodes extracted from Paragraph#1. -/
def enumeratedItemCount : Nat := 21

/-- 政令で定めるところにより: the exemption is prescribed by Cabinet Order. -/
def exemptionAuthority : Authority := Authority.cabinetOrder

/-- The exemption authority is the Cabinet Order, not the Act itself. -/
theorem exemption_is_cabinet_order : exemptionAuthority = Authority.cabinetOrder := rfl

/-- The two goods classes are distinct. -/
theorem listed_neq_other : Goods.listed ≠ Goods.other := by decide

end JapanTaxLaw.CustomsTariffArt14UnconditionalExemption
