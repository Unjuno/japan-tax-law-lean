import JapanTaxLaw.LocalTaxExpropriationTwoYearWindowSpec

/- Kernel-decided boundary checks for 「これらの者が公共事業を行う者に代わつて当該公共事業の用に供する不動産を取得する場合においてこれらの者に当該公共事業の用に供する不動産を譲渡した者又は当該譲渡に係る土地の上に建築されていた家屋について移転補償金を受けた者に対する当該譲渡し、又は移転補償金を受けた不動産（以下この号において「被買収不動産等」という。）に代わるものと市町村長が認める土地（当該被買収不動産等に対応するものとして政令で定める土地に限る。）の譲渡（当該不動産を譲渡し、又は当該家屋についての移転補償金に係る契約をした日から二年以内に行われる土地の譲渡に限る。）」. -/
namespace JapanTaxLaw.LocalTaxExpropriationTwoYearWindow

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input / threshold_below
example : inScopeBool 2 = true := by decide  -- threshold_at (INCLUSIVE)
example : inScopeBool 3 = false := by decide  -- threshold_above
example : inScope 2 := by unfold inScope; decide  -- threshold_at (Prop, INCLUSIVE)
example : ¬ inScope 3 := by unfold inScope; decide  -- threshold_above (Prop)
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (years : Nat) : inScope years ↔ specInScope years := agree_scope years

end JapanTaxLaw.LocalTaxExpropriationTwoYearWindow
