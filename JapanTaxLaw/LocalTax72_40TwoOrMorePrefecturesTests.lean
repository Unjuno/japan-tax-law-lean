import JapanTaxLaw.LocalTax72_40TwoOrMorePrefecturesSpec

/- Kernel-decided boundary checks for 「二以上の道府県において事務所又は事業所を設けて事業を行う法人に係る法人税の課税標準について、前項の規定によつて税務官署に対しすべき更正又は決定の請求は、当該法人の主たる事務所又は事業所所在地の道府県知事（外国法人にあつては、この法律の施行地において行う事業の経営の責任者が主として執務する事務所又は事業所所在地の道府県知事）又は当該法人の主たる事務所又は事業所所在地の道府県知事を経由して関係道府県知事が行うものとする。」. -/
namespace JapanTaxLaw.LocalTax72_40TwoOrMorePrefectures

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_40TwoOrMorePrefectures
