import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt14DisabledPersonEquipmentDelegation — 関税定率法 第十四条(1) DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|c8d2540f3dcbd0d71d4c31a4833f7616bb803940ef8c78479d752b2588172adc
  Source path: LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/
               Paragraph#1/Item#16/ItemSentence/Sentence#1
  Article caption: （無条件免税）

原文逐語（pinned, 一字一句改変なし）:
  「身体障害者用に特に製作された器具その他これに類する物品で政令で定めるもの」

Norm kind: DELEGATION — a goods class (equipment specially made for use by
persons with disabilities and similar articles) is prescribed by Cabinet Order
(政令で定めるもの). The computable slice models which legal source prescribes
the goods class and the listed/other discrimination. The Cabinet Order content
and substantive customs treatment are NOT MODELLED. All statutory strings
injected from the queue; no hand-typed CJK.

Variable contract (meaning / unit / domain / type):
  GoodsClass : Type — listed (政令-prescribed equipment) | other.
  Authority : Type — act | cabinetOrder (政令).
  prescriptionAuthority : Authority — the source prescribing the class.
  No numeric amount/unit applies (structural DELEGATION, not a formula).

Scope: only the delegating structure and listed/other discrimination.
Cabinet Order content and legal correctness NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt14DisabledPersonEquipmentDelegation

/-- Goods class: listed (政令-prescribed equipment) or other. -/
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

end JapanTaxLaw.CustomsTariffArt14DisabledPersonEquipmentDelegation
