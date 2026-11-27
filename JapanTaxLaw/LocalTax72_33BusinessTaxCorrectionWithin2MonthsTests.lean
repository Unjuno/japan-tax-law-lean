import JapanTaxLaw.LocalTax72_33BusinessTaxCorrectionWithin2MonthsSpec

/- Kernel-decided boundary checks for 「申告書又は修正申告書を提出した法人（収入割のみを申告納付すべきものを除く。）が、当該申告又は修正申告に係る事業税の計算の基礎となつた事業年度に係る法人税の課税標準について国の税務官署の更正又は決定を受けたことに伴い、当該申告又は修正申告に係る付加価値額、資本金等の額若しくは所得又は事業税額が過大となる場合には、国の税務官署が当該更正又は決定の通知をした日から二月以内に限り、総務省令で定めるところにより、道府県知事に対し、当該付加価値額、資本金等の額若しくは所得又は事業税額につ」. -/
namespace JapanTaxLaw.LocalTax72_33BusinessTaxCorrectionWithin2Months

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at
example : ¬ inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = false := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_33BusinessTaxCorrectionWithin2Months
