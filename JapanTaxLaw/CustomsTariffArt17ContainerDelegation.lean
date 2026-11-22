import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt17ContainerDelegation — 関税定率法 第十七条(1) DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|eb942c04756a7ec5c979ef888fe65f217714c5600aa0b2fa2e3585c110e99644
  Source path: LawBody[1]/MainProvision/MainProvision[30]/Article:17/Article#17/
               Paragraph#1/Item#2/ItemSentence/Sentence#1
  Article caption: （再輸出免税）

原文逐語（pinned, 一字一句改変なし）:
  「輸入貨物の容器で政令で定めるもの」

Norm kind: DELEGATION — a goods class (containers of imported goods) is
prescribed by Cabinet Order (政令で定めるもの). The computable slice models which
legal source prescribes the goods class and the listed/other discrimination.
The actual Cabinet Order content and substantive customs treatment are NOT
MODELLED. All statutory strings injected from the queue; no hand-typed CJK.

Variable contract (meaning / unit / domain / type):
  GoodsClass : Type — listed (政令-prescribed containers) | other.
  Authority : Type — act | cabinetOrder (政令).
  prescriptionAuthority : Authority — the source prescribing the class.
  No numeric amount/unit applies (structural DELEGATION, not a formula).

Scope: only the delegating structure and listed/other discrimination.
Cabinet Order content and legal correctness NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt17ContainerDelegation

/-- Goods class: listed (政令-prescribed containers) or other. -/
inductive GoodsClass : Type
  | listed : GoodsClass
  | other : GoodsClass

/-- Legal source prescribing the goods class (act | 政令). -/
inductive Authority : Type
  | act : Authority
  | cabinetOrder : Authority

deriving instance DecidableEq for GoodsClass
deriving instance DecidableEq for Authority

/-- 政令で定めるもの: the goods class is prescribed by Cabinet Order. -/
def prescriptionAuthority : Authority := Authority.cabinetOrder

/-- The prescription authority is Cabinet Order, not the Act. -/
theorem prescription_is_cabinet_order : prescriptionAuthority = Authority.cabinetOrder := rfl

/-- The two goods classes are distinct. -/
theorem listed_neq_other : GoodsClass.listed ≠ GoodsClass.other := by decide

end JapanTaxLaw.CustomsTariffArt17ContainerDelegation
