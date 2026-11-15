import JapanTaxLaw.Verdict

/-!
# ConsumptionTaxActor — 消費税法（昭和六十三年法律第百八号）
                        Act art. 2 items 3, 4, 7 (definitions); Act art. 4(1) (課税の対象); Act art. 5(1) (納税義務者)

Source (pinned):
https://laws.e-gov.go.jp/law/363AC0000000108
Law id: 363AC0000000108（昭和六十三年法律第百八号）
Revision: 363AC0000000108_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 25DCCEBFFB6690902C117A4AB9C16E4D64DB087BBA6D184A10EA6AEB58AB4A82

Key text (verbatim-equivalent extracts from the pinned source):
  三個人事業者 事業を行う個人をいう。
  四事業者 個人事業者及び法人をいう。
  七人格のない社団等 法人でない社団又は財団で代表者又は管理人の定めがあるものをいう。
  第三条第四号四人格のない社団等
  第四条第一項 国内において事業者が行つた資産の譲渡等（特定資産の譲渡等に該当するものを除く。第三項において同じ。）及び特定仕入れ（事業として他の者から受けた特定資産の譲渡等をいう。以下この章において同じ。）には、この法律により、消費税を課する。
  第五条第一項 事業者は、国内において行つた課税資産の譲渡等（特定資産の譲渡等に該当するものを除く。第三十条第二項及び第三十二条を除き、以下同じ。）及び特定課税仕入れ（課税仕入れのうち特定仕入れに該当するものをいう。以下同じ。）につき、この法律により、消費税を納める義務がある。

Scope:
* Only the actor anchor of Act art. 2/4/5 is formalized:
  - isIndividualBusinessOperator (item 3)
  - isCorporation (item 4/3併)
  - isBusinessOperator (item 4)
  - isPersonlessEntity (item 7) — classified separately; NOT part of 事業者 per item 4
  - taxableEventVerdict (act.4/5: 国内課税資産の譲渡等 / 特定課税仕入れ) as an external fact
  - owesConsumptionTax = businessOperator ∧ taxableEventConducted
* 課税資産の譲渡等/特定課税仕入れ の実際の認定は本モジュールの対象外。
* Act art. 2 item 5（合併法人）, item 6（分割法人）item 4の2（国外事業者）は意図的に未対応。

Axiom discipline: all theorems are proved by `cases`/`simp` over Verdict constructors.
No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Facts relevant to the consumption tax actor classification. -/
structure ConsumptionTaxActorFacts where
  /-- 事業を行う個人か（消費税法第2条第3号：個人事業者）. -/
  isIndividualBusinessOperator : Verdict
  /-- 法人か（消費税法第2条第4号：法人）. -/
  isCorporation : Verdict
  /-- 人格のない社団等（法人でない社団又は財団で代表者又は管理人の定めのあるもの）か. -/
  isPersonlessEntity : Verdict
  /-- 国内において行つた課税資産の譲渡等か. -/
  domesticTaxableSupplyConducted : Verdict
  /-- 特定課税仕入れを行つたか. -/
  specificTaxablePurchaseConducted : Verdict
  deriving DecidableEq, Repr

/-- 消費税法第2条第4号：事業者 = 個人事業者及び法人をいう. -/
def isBusinessOperatorVerdict (f : ConsumptionTaxActorFacts) : Verdict :=
  Verdict.or f.isIndividualBusinessOperator f.isCorporation

/-- 消費税法第5条第1項が参照する課税事象（外部判定事実）. -/
def taxableEventVerdict (f : ConsumptionTaxActorFacts) : Verdict :=
  Verdict.or f.domesticTaxableSupplyConducted f.specificTaxablePurchaseConducted

/-- 消費税法第5条第1項：事業者は課税資産の譲渡等／特定課税仕入れにつき消費税を納める義務がある. -/
def owesConsumptionTaxVerdict (f : ConsumptionTaxActorFacts) : Verdict :=
  Verdict.and (isBusinessOperatorVerdict f) (taxableEventVerdict f)

/-- Classification of the actor + obligation status for consumers. -/
inductive ConsumptionTaxObligation where
  | owes
  | doesNotOwe
  | undetermined
  | inconsistent
  deriving DecidableEq, Repr

/-- Four-valued classification of the obligation to the actor. -/
def classifyConsumptionTaxActor (f : ConsumptionTaxActorFacts) : ConsumptionTaxObligation :=
  match owesConsumptionTaxVerdict f with
  | .yes      => .owes
  | .no       => .doesNotOwe
  | .unknown  => .undetermined
  | .conflict => .inconsistent

-- ==================== structural consistency lemmas ====================

/-- 事業者 = 個人事業者 ∨ 法人（定義の書き換えのみ）. -/
theorem isBusinessOperatorVerdict_eq_or (f : ConsumptionTaxActorFacts) :
    isBusinessOperatorVerdict f = Verdict.or f.isIndividualBusinessOperator f.isCorporation := by
  unfold isBusinessOperatorVerdict at *; rfl

/-- 個人事業者であることの確認 ⇒ 事業者である. -/
theorem individual_business_operator_sufficient (f : ConsumptionTaxActorFacts)
    (h : f.isIndividualBusinessOperator = Verdict.yes) :
    isBusinessOperatorVerdict f = Verdict.yes := by
  simp [isBusinessOperatorVerdict, h, Verdict.or]

/-- 法人であることの確認 ⇒ 事業者である. -/
theorem corporation_sufficient (f : ConsumptionTaxActorFacts)
    (h : f.isCorporation = Verdict.yes) : isBusinessOperatorVerdict f = Verdict.yes := by
  cases hI : f.isIndividualBusinessOperator <;> simp [isBusinessOperatorVerdict, hI, h, Verdict.or]

/-- 人格のない社団等でも事業者の構成要件を満たさない限り、納税義務なし（第4号の該当否）. -/
theorem personless_entity_not_sufficient (f : ConsumptionTaxActorFacts)
    (hn : isBusinessOperatorVerdict f ≠ Verdict.yes) :
    ¬(f.isIndividualBusinessOperator = Verdict.yes) ∧ ¬(f.isCorporation = Verdict.yes) := by
  cases hI : f.isIndividualBusinessOperator <;> cases hC : f.isCorporation <;>
    simp [isBusinessOperatorVerdict, hI, hC, Verdict.or] at hn ⊢

/-- 課税資産の譲渡等 ⇒ 課税事象がある. -/
theorem domestic_supply_sufficient (f : ConsumptionTaxActorFacts)
    (h : f.domesticTaxableSupplyConducted = Verdict.yes) :
    taxableEventVerdict f = Verdict.yes := by
  simp [taxableEventVerdict, h, Verdict.or]

/-- 特定課税仕入れ ⇒ 課税事象がある. -/
theorem specific_purchase_sufficient (f : ConsumptionTaxActorFacts)
    (h : f.specificTaxablePurchaseConducted = Verdict.yes) :
    taxableEventVerdict f = Verdict.yes := by
  cases hS : f.domesticTaxableSupplyConducted <;>
    simp [taxableEventVerdict, hS, h, Verdict.or]

/-- 課税事象なし ⇒ 納税義務なし. -/
theorem no_taxable_event_no_obligation (f : ConsumptionTaxActorFacts)
    (h : taxableEventVerdict f = Verdict.no) :
    owesConsumptionTaxVerdict f = Verdict.no := by
  unfold owesConsumptionTaxVerdict
  rw [h]
  cases hB : isBusinessOperatorVerdict f <;> rfl

/-- 事業者かつ課税事象 ⇒ 納税義務あり（判定規則そそのもの）. -/
theorem business_operator_and_event_implies_owes (f : ConsumptionTaxActorFacts)
    (hB : isBusinessOperatorVerdict f = Verdict.yes)
    (hE : taxableEventVerdict f = Verdict.yes) :
    owesConsumptionTaxVerdict f = Verdict.yes := by
  simp [owesConsumptionTaxVerdict, hB, hE, Verdict.and]

/-- 事業者かつ課税事象なし ⇒ 納税義務なし. -/
theorem business_operator_no_event_no_obligation (f : ConsumptionTaxActorFacts)
    (hB : isBusinessOperatorVerdict f = Verdict.yes)
    (hE : taxableEventVerdict f = Verdict.no) :
    owesConsumptionTaxVerdict f = Verdict.no := by
  simp [owesConsumptionTaxVerdict, hB, hE, Verdict.and]

/-- 課税事象ありでも事業者でない ⇒ 納税義務なし. -/
theorem not_business_operator_no_obligation (f : ConsumptionTaxActorFacts)
    (hB : isBusinessOperatorVerdict f = Verdict.no)
    (hE : taxableEventVerdict f = Verdict.yes) :
    owesConsumptionTaxVerdict f = Verdict.no := by
  simp [owesConsumptionTaxVerdict, hB, hE, Verdict.and]

/-- 消費税の納税義務者が存在しないとする分類の整合性: 一様なyes/noセグメントでは分類が単一に定まる. -/
theorem consumption_tax_classification_always_one (f : ConsumptionTaxActorFacts) :
    classifyConsumptionTaxActor f = .owes ∨ classifyConsumptionTaxActor f = .doesNotOwe ∨
    classifyConsumptionTaxActor f = .undetermined ∨ classifyConsumptionTaxActor f = .inconsistent := by
  cases h : owesConsumptionTaxVerdict f <;>
    simp [classifyConsumptionTaxActor, h]

/-- 納税義務の and/or 合成規則を明示: 支払い義務は事業者 ∧ 課税事象. -/
theorem owes_iff_business_operator_and_event (f : ConsumptionTaxActorFacts) :
    owesConsumptionTaxVerdict f = Verdict.and (isBusinessOperatorVerdict f) (taxableEventVerdict f) := by
  unfold owesConsumptionTaxVerdict at *; rfl

end JapanTaxLaw
