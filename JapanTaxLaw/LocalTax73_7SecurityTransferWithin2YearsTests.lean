import JapanTaxLaw.LocalTax73_7SecurityTransferWithin2YearsSpec

/- Kernel-decided boundary checks for 「譲渡により担保の目的となつている財産（以下この節において「譲渡担保財産」という。）により担保される債権の消滅により当該譲渡担保財産の設定の日から二年以内に譲渡担保財産の権利者（以下この節において「譲渡担保権者」という。）から譲渡担保財産の設定者（設定者が更迭した場合における新設定者を除く。以下この節において同じ。）に当該譲渡担保財産を移転する場合における不動産の取得」. -/
namespace JapanTaxLaw.LocalTax73_7SecurityTransferWithin2Years

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

end JapanTaxLaw.LocalTax73_7SecurityTransferWithin2Years
