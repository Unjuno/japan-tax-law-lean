import JapanTaxLaw.InheritanceTax46InKindRevocationTwoOrMoreSpec

/- Kernel-decided boundary checks for 「税務署長は、前項の場合において、物納の許可があつた二以上の不動産の一部について物納の撤回の申請があり、又は物納の許可があつた一の不動産を分割してその一部について物納の撤回の申請があつたとき（これらの申請のあつた財産以外の物納財産のうちにその物納の撤回により管理又は処分をするのに不適格な財産として政令で定めるもの（以下この条において「不適格財産」という。）があるときに限る。）は、当該不適格財産を物納の撤回の申請に係る財産に追加することを求め、当該申請者が当該財産に当該不適格財産」. -/
namespace JapanTaxLaw.InheritanceTax46InKindRevocationTwoOrMore

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

end JapanTaxLaw.InheritanceTax46InKindRevocationTwoOrMore
