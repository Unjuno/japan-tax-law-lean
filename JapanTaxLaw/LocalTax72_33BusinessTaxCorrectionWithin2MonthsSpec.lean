import JapanTaxLaw.LocalTax72_33BusinessTaxCorrectionWithin2Months

/-
# LocalTax72_33BusinessTaxCorrectionWithin2MonthsSpec — independent spec for 地方税法 Num 72_33/2

Needle 「申告書又は修正申告書を提出した法人（収入割のみを申告納付すべきものを除く。）が、当該申告又は修正申告に係る事業税の計算の基礎となつた事業年度に係る法人税の課税標準について国の税務官署の更正又は決定を受けたことに伴い、当該申告又は修正申告に係る付加価値額、資本金等の額若しくは所得又は事業税額が過大となる場合には、国の税務官署が当該更正又は決定の通知をした日から二月以内に限り、総務省令で定めるところにより、道府県知事に対し、当該付加価値額、資本金等の額若しくは所得又は事業税額につ」.
The implementation uses `months ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `months ≤ 2`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax72_33BusinessTaxCorrectionWithin2Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months ≤ 2

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_33BusinessTaxCorrectionWithin2Months
