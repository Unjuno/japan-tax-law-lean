import JapanTaxLaw.TaxationPeriod

/-!
# TaxationPeriod tests — 国税通則法 Act art. 2 item 9 smoke checks

Decidable smoke checks for the period-kind bifurcation. Scope limited to
Act art. 2 item 9; item 6 （納税申告書）, item 7 （法定申告期限）,
item 11+ and consumption-tax/exempt-special rules are not claimed.
-/

namespace JapanTaxLaw

-- 課税資産の譲渡等に係る消費税 ⇒ art. 19 の課税期間
example : resolveTaxationPeriod ⟨.yes⟩ = .consumptionTaxPeriodArt19 := by decide
-- 非課税イベント ⇒ 各税法の計算基礎期間
example : resolveTaxationPeriod ⟨.no⟩ = .generalPeriodByTheTaxCostLaw := by decide
-- 不明 ⇒ 判定不能（不明を偽として処理しない）
example : resolveTaxationPeriod ⟨.unknown⟩ = .undetermined := by decide
-- 矛盾 ⇒ 判決不能
example : resolveTaxationPeriod ⟨.conflict⟩ = .inconsistent := by decide

-- 例外は例外だけに成立（規定が混然しない）
example : resolveTaxationPeriod ⟨.no⟩ ≠ .consumptionTaxPeriodArt19 := by decide

-- 非課税イベントでも消費税法以外の法律の課税期間が適用される側（一般側）に倒れる
example : resolveTaxationPeriod ⟨.yes⟩ ≠ .generalPeriodByTheTaxCostLaw := by decide

-- 丸め不能判定（不明）は両者へ還元されない
example : resolveTaxationPeriod ⟨.unknown⟩ ≠ .consumptionTaxPeriodArt19 := by decide
example : resolveTaxationPeriod ⟨.unknown⟩ ≠ .generalPeriodByTheTaxCostLaw := by decide

-- 矛盾は丸められない（全域性のみ）
example : resolveTaxationPeriod ⟨.conflict⟩ ≠ .consumptionTaxPeriodArt19 := by decide

end JapanTaxLaw
