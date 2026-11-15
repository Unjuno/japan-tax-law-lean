import JapanTaxLaw.ConsumptionTaxActor

/-!
# ConsumptionTaxActor tests — 消費税法 Act art. 2 items 3/4/7, Act art. 5(1) smoke checks

Decidable smoke checks for the actor classification + obligation anchor.
Scope limited to items 3/4/7 (事業者・人格のない社団等） and Act art. 5(1)
納税義務の対象（事業者＋課税事象） anchor.
-/

namespace JapanTaxLaw

-- 個人事業者 ⇒ 事業者
example : isBusinessOperatorVerdict ⟨.yes, .no, .no, .no, .no⟩ = Verdict.yes := by decide
example : isBusinessOperatorVerdict ⟨.unknown, .no, .no, .no, .no⟩ = Verdict.unknown := by decide
-- 法人 ⇒ 事業者
example : isBusinessOperatorVerdict ⟨.no, .yes, .no, .no, .no⟩ = Verdict.yes := by decide
example : isBusinessOperatorVerdict ⟨.no, .unknown, .no, .no, .no⟩ = Verdict.unknown := by decide
-- 個人事業者でも法人でもない ⇒ 事業者ではない
example : isBusinessOperatorVerdict ⟨.no, .no, .no, .no, .no⟩ = Verdict.no := by decide
-- 人格のない社団等は事業者の定義外（事業能力として判定しない限り）
example : isBusinessOperatorVerdict ⟨.no, .no, .yes, .no, .no⟩ = Verdict.no := by decide

-- 課税事象あり: 課税資産の譲渡等 ⇒ 事象あり
example : taxableEventVerdict ⟨.no, .no, .no, .yes, .no⟩ = Verdict.yes := by decide
-- 課税事象あり: 特定課税仕入れ ⇒ 事象あり
example : taxableEventVerdict ⟨.no, .no, .no, .no, .yes⟩ = Verdict.yes := by decide
-- 課税事象なし ⇒ 事象なし
example : taxableEventVerdict ⟨.no, .no, .no, .no, .no⟩ = Verdict.no := by decide
-- 課税事象不明 ⇒ 判定不能
example : taxableEventVerdict ⟨.no, .no, .no, .unknown, .no⟩ = Verdict.unknown := by decide

-- 事業者かつ課税事象あり ⇒ 納税義務あり
example : owesConsumptionTaxVerdict ⟨.yes, .no, .no, .yes, .no⟩ = Verdict.yes := by decide
example : owesConsumptionTaxVerdict ⟨.no, .yes, .no, .yes, .no⟩ = Verdict.yes := by decide
-- 事業者でない ⇒ 納税義務なし
example : owesConsumptionTaxVerdict ⟨.no, .no, .no, .yes, .no⟩ = Verdict.no := by decide
-- 事業者だが課税事象なし ⇒ 納税義務なし
example : owesConsumptionTaxVerdict ⟨.yes, .no, .no, .no, .no⟩ = Verdict.no := by decide
-- 事業者でも課税事象でも不明 ⇒ 判定不能
example : owesConsumptionTaxVerdict ⟨.unknown, .unknown, .no, .unknown, .unknown⟩ = Verdict.unknown := by decide
-- 矛盾入力 ⇒ 判決不能
example : owesConsumptionTaxVerdict ⟨.yes, .yes, .no, .conflict, .no⟩ = Verdict.conflict := by decide

-- 分類: exactly one of the four outcomes
example : classifyConsumptionTaxActor ⟨.yes, .no, .no, .yes, .no⟩ = .owes := by decide
example : classifyConsumptionTaxActor ⟨.no, .no, .no, .no, .no⟩ = .doesNotOwe := by decide
example : classifyConsumptionTaxActor ⟨.unknown, .unknown, .no, .yes, .no⟩ = .undetermined := by decide
example : classifyConsumptionTaxActor ⟨.conflict, .conflict, .no, .conflict, .no⟩ = .inconsistent := by decide

end JapanTaxLaw
