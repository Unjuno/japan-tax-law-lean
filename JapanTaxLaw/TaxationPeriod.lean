import JapanTaxLaw.Verdict

/-!
# TaxationPeriod — 国税通則法（国税の通則に関する法律）第2条第9号（課税期間の定義）

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Law id: 337AC0000000066（昭和三十七年法律第六十六号）
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 6F8B43E168652D228066CDA3389A3BF6823900A9268E6BF97297CB6B25189DEE

Act art. 2 item 9, verbatim from the pinned text:
  九課税期間 国税に関する法律の規定により国税の課税標準の計算の基礎となる期間
  （課税資産の譲渡等（消費税法（昭和六十三年法律第百八号）第二条第一項第九号（定義）
  に規定する課税資産の譲渡等をいい、同項第八号の二に規定する特定資産の譲渡等に
  該当するものを除く。）及び特定課税仕入れ（同法第五条第一項（納税義務者）に規定する
  特定課税仕入れをいう。）に課される消費税（以下「課税資産の譲渡等に係る消費税」と
  いう。）については、同法第十九条（課税期間）に規定する課税期間）をいう。

Reading: the taxation period under this Act item 9 depends on the kind of tax:
  * general — 国税に関する法律の規定により国税の課税標準の計算の基礎となる期間
             （general, law-specific period）
  * special — 消費税の課税標準の計算の基礎となる期間として、同法第十九条に規定する
             課税期間として扱われる場面（消費税固有の例外ルール）

Scope:
* Only Act art. 2 item 9 itself is formalized, and only the period-kind bifurcation.
* 課税資産の譲渡等 / 特定課税仕入れ (i.e. WHICH events attract consumption tax) is NOT
  decided here — the model takes that as an externally assessed fact (Verdict-typed).
* The internal cross-references (excluding 特定資産の譲渡等, Act art. 15(2)(7) parity,
  消費税法 art. 2(1)(9), art. 5(1), art. 19) are NOT formalized by this module; they are
  recorded as limitations in the README.
* Unknown is never treated as false; conflict escalates to `inconsistent`.

Axiom discipline: all theorems are proved by `cases` over Verdict constructors
(all cases are decidable). No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Assessed facts relevant to Act art. 2 item 9's period bifurcation. -/
structure TaxationPeriodFacts where
  /-- 課税資産の譲渡等及び特定課税仕入れに課される消費税に該当するか（外部判定）. -/
  isConsumptionTaxQualifiedEvent : Verdict
  deriving DecidableEq, Repr

/-- Outcome of the Act art. 2 item 9 period-kind question. -/
inductive TaxationPeriodOutcome where
  | generalPeriodByTheTaxCostLaw     -- 国税に関する法律の規定により国税の課税標準の計算の基礎となる期間
  | consumptionTaxPeriodArt19        -- 消費税法第十九条（課税期間）に規定する期間
  | undetermined                     -- 判定不能（不明）
  | inconsistent                     -- 矛盾（判決不能）
  deriving DecidableEq, Repr

/-- Act art. 2 item 9 resolution: consumption-tax-qualified events use the
    Consumption Tax Act art. 19 period rule; all others use their own tax law. -/
def resolveTaxationPeriod (f : TaxationPeriodFacts) : TaxationPeriodOutcome :=
  match f.isConsumptionTaxQualifiedEvent with
  | .yes => .consumptionTaxPeriodArt19
  | .no => .generalPeriodByTheTaxCostLaw
  | .unknown => .undetermined
  | .conflict => .inconsistent

-- ==================== structural consistency lemmas ====================

/-- 課税資産の譲渡等に係る消費税に該当 ⇒ 消費税法第十九条の期間. -/
theorem consumption_qualified_art19 (f : TaxationPeriodFacts)
    (h : f.isConsumptionTaxQualifiedEvent = Verdict.yes) :
    resolveTaxationPeriod f = .consumptionTaxPeriodArt19 := by
  simp [resolveTaxationPeriod, h]

/-- 消費税に該当しない ⇒ 各税法の計算基礎期間（規定に基づく）. -/
theorem not_consumption_qualified_general (f : TaxationPeriodFacts)
    (h : f.isConsumptionTaxQualifiedEvent = Verdict.no) :
    resolveTaxationPeriod f = .generalPeriodByTheTaxCostLaw := by
  simp [resolveTaxationPeriod, h]

/-- 不明 ⇒ 判定不能（不明を偽として処理しない）. -/
theorem unknown_event_undetermined (f : TaxationPeriodFacts)
    (h : f.isConsumptionTaxQualifiedEvent = Verdict.unknown) :
    resolveTaxationPeriod f = .undetermined := by
  simp [resolveTaxationPeriod, h]

/-- 矛盾 ⇒ 判決不能. -/
theorem conflict_event_inconsistent (f : TaxationPeriodFacts)
    (h : f.isConsumptionTaxQualifiedEvent = Verdict.conflict) :
    resolveTaxationPeriod f = .inconsistent := by
  simp [resolveTaxationPeriod, h]

/-- 判断は排他的に一意のどちらかに丸められる. -/
theorem outcome_is_exactly_one (f : TaxationPeriodFacts) :
    resolveTaxationPeriod f = .consumptionTaxPeriodArt19 ∨
    resolveTaxationPeriod f = .generalPeriodByTheTaxCostLaw ∨
    resolveTaxationPeriod f = .undetermined ∨
    resolveTaxationPeriod f = .inconsistent := by
  cases h : f.isConsumptionTaxQualifiedEvent <;>
    simp [resolveTaxationPeriod, h]

/-- 例外側（art. 19）が選ばれる ⇒ 課税資産の譲渡等に係る消費税に該当する. -/
theorem art19_implies_qualified (f : TaxationPeriodFacts)
    (h : resolveTaxationPeriod f = .consumptionTaxPeriodArt19) :
    f.isConsumptionTaxQualifiedEvent = Verdict.yes := by
  unfold resolveTaxationPeriod at h
  cases hd : f.isConsumptionTaxQualifiedEvent <;> simp [hd] at h
  rfl

/-- 一般側が選ばれる ⇒ 課税資産の譲渡等に係る消費税に該当しない. -/
theorem general_implies_not_qualified (f : TaxationPeriodFacts)
    (h : resolveTaxationPeriod f = .generalPeriodByTheTaxCostLaw) :
    f.isConsumptionTaxQualifiedEvent = Verdict.no := by
  unfold resolveTaxationPeriod at h
  cases hd : f.isConsumptionTaxQualifiedEvent <;> simp [hd] at h
  rfl

/-- 非課税イベントが同時に両方の期間を持つことはない. -/
theorem outcomes_disjoint (f : TaxationPeriodFacts) :
    ¬ (resolveTaxationPeriod f = .consumptionTaxPeriodArt19 ∧
       resolveTaxationPeriod f = .generalPeriodByTheTaxCostLaw) := by
  intro h
  have h1 := h.1
  have h2 := h.2
  unfold resolveTaxationPeriod at h1 h2
  cases hd : f.isConsumptionTaxQualifiedEvent <;> simp [hd] at h1 h2

end JapanTaxLaw
