import JapanTaxLaw.LocalTax20_9_3CorrectionWithin2Months

/-
# LocalTax20_9_3CorrectionWithin2MonthsSpec — independent spec for 地方税法 Num 20_9_3(2)

Needle 「その申告、更正又は決定に係る課税標準等又は税額等の計算に当たつてその申告をし、又は決定を受けた者に帰属するものとされていた所得その他課税物件が他の者に帰属するものとする当該他の者に係る地方税の更正、決定又は賦課決定があつたとき。　当該更正、決定又は賦課決定があつた日の翌日から起算して二月以内」.
The implementation uses `≤ threshold months`; the independent spec states the same
inclusive bound as `≤ 2 months`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax20_9_3CorrectionWithin2Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months ≤ 2

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax20_9_3CorrectionWithin2Months
