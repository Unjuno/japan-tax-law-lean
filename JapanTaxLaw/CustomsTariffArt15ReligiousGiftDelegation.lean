import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt15ReligiousGiftDelegation — 関税定率法 第十五条(1) DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|fa7a3092ac09ddfe08ed1fc2f6df6297910fd9d29f82ded988b0f644938c19fa
  Source path: LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/
               Paragraph#1/Item#4/ItemSentence/Sentence#1
  Article caption: （特定用途免税）

原文逐語（pinned, 一字一句改変なし）:
  「儀式又は礼拝の用に直接供するため宗教団体に寄贈された物品で財務省令で定めるもの」

Norm kind: DELEGATION — a goods class (articles donated to a religious body
for direct use at ceremonies/weddings) is prescribed by 財務省令 (an Ordinance
of the Ministry of Finance), NOT by 政令 (Cabinet Order). The computable slice
models which legal source prescribes the class and the listed/other
discrimination, faithfully distinguishing 財務省令 from other instruments.
The ordinance content and substantive customs treatment are NOT MODELLED.
All statutory strings injected from the queue; no hand-typed CJK.

Variable contract (meaning / unit / domain / type):
  GoodsClass : Type — listed (財務省令-prescribed articles) | other.
  Authority : Type — act | cabinetOrder | financeMinistryOrdinance.
  prescriptionAuthority : Authority — the source prescribing the class.
  No numeric amount/unit applies (structural DELEGATION, not a formula).

Scope: only the delegating structure and listed/other discrimination.
Ordinance content and legal correctness NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt15ReligiousGiftDelegation

/-- Goods class: listed (財務省令-prescribed articles) or other. -/
inductive GoodsClass : Type
  | listed : GoodsClass
  | other : GoodsClass

/-- Legal source prescribing the goods class. -/
inductive Authority : Type
  | act : Authority
  | cabinetOrder : Authority
  | financeMinistryOrdinance : Authority

deriving instance DecidableEq for GoodsClass
deriving instance DecidableEq for Authority

/-- 財務省令で定めるもの: prescribed by Ministry-of-Finance Ordinance. -/
def prescriptionAuthority : Authority := Authority.financeMinistryOrdinance

/-- The prescription authority is the 財務省令, not the Act or 政令. -/
theorem prescription_is_finance_ordinance :
    prescriptionAuthority = Authority.financeMinistryOrdinance := rfl

/-- It is NOT the Cabinet Order (this Act's other delegations use 政令). -/
theorem prescription_not_cabinet_order :
    prescriptionAuthority ≠ Authority.cabinetOrder := by decide

/-- The two goods classes are distinct. -/
theorem listed_neq_other : GoodsClass.listed ≠ GoodsClass.other := by decide

end JapanTaxLaw.CustomsTariffArt15ReligiousGiftDelegation
