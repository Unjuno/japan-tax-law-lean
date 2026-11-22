import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt17Delegation — 関税定率法 第十七条(1)（委任）DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|35c971a0758598e57593706d43c4732904e25dab80fb92770430a30ab0f83d3f
  Source path: LawBody[1]/MainProvision/MainProvision[30]/Article:17/Article#17/
               Paragraph#1/Item#1/ItemSentence/Sentence#1
  Article caption: （再輸出免税）

原文逐語（pinned, 一字一句改変なし）:
  「加工される貨物又は加工材料となる貨物で政令で定めるもの」

Norm kind: DELEGATION — goods classes (processed goods or goods serving as
processing materials) are prescribed by Cabinet Order (政令で定めるもの).
Structural inspection of Paragraph#1 finds 13 Item nodes. The computable
slice models which legal source prescribes the goods class; the actual Cabinet
Order content and the substantive customs treatment are NOT MODELLED. All
statutory strings injected from the queue; no hand-typed CJK.

Variable contract (meaning / unit / domain / type):
  GoodsClass : Type — listed (prescribed by Cabinet Order) | other.
  Authority : Type — act | cabinetOrder (政令).
  prescriptionAuthority : Authority — the source prescribing the goods class.
  enumeratedItemCount : Nat = 13 (from structural Item nodes).
  No numeric amount/unit applies (structural DELEGATION, not a formula).

Scope: only the delegating structure and the listed/other discrimination.
Cabinet Order content and legal correctness are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt17Delegation

/-- Goods class: listed (政令-prescribed) or other. -/
inductive GoodsClass : Type
  | listed : GoodsClass
  | other : GoodsClass

/-- Legal source prescribing the goods class (act | 政令). -/
inductive Authority : Type
  | act : Authority
  | cabinetOrder : Authority

deriving instance DecidableEq for GoodsClass
deriving instance DecidableEq for Authority

/-- Number of enumerated Item nodes extracted from Paragraph#1. -/
def enumeratedItemCount : Nat := 13

/-- 政令で定めるもの: the goods class is prescribed by Cabinet Order. -/
def prescriptionAuthority : Authority := Authority.cabinetOrder

/-- The prescription authority is the Cabinet Order, not the Act. -/
theorem prescription_is_cabinet_order : prescriptionAuthority = Authority.cabinetOrder := rfl

/-- The two goods classes are distinct. -/
theorem listed_neq_other : GoodsClass.listed ≠ GoodsClass.other := by decide

end JapanTaxLaw.CustomsTariffArt17Delegation
