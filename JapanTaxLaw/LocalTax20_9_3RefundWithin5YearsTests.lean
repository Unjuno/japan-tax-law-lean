import JapanTaxLaw.LocalTax20_9_3RefundWithin5YearsSpec

/- Kernel-decided boundary checks for 「申告納付又は申告納入に係る地方税の申告書（以下この条において「申告書」という。）を提出した者は、当該申告書に記載した課税標準等若しくは税額等の計算が地方税に関する法令の規定に従つていなかつたこと又は当該計算に誤りがあつたことにより、次の各号のいずれかに該当する場合には、当該申告書に係る地方税の法定納期限から五年以内に限り、総務省令の定めるところにより、地方団体の長に対し、その申告に係る課税標準等又は税額等（当該課税標準等又は税額等に関し更正があつた場合には、当該更正後の課税標」. -/
namespace JapanTaxLaw.LocalTax20_9_3RefundWithin5Years

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 4 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 5 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 6 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 4 = true := by decide  -- bool
example : inScopeBool 5 = true := by decide  -- bool
example : inScopeBool 6 = false := by decide  -- bool
example : inScope 5 ↔ specInScope 5 := agree_scope 5
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax20_9_3RefundWithin5Years
