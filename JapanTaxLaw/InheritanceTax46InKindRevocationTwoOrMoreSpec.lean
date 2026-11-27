import JapanTaxLaw.InheritanceTax46InKindRevocationTwoOrMore

/-
# InheritanceTax46InKindRevocationTwoOrMoreSpec — independent spec for 相続税法 Num 46/4

Needle 「税務署長は、前項の場合において、物納の許可があつた二以上の不動産の一部について物納の撤回の申請があり、又は物納の許可があつた一の不動産を分割してその一部について物納の撤回の申請があつたとき（これらの申請のあつた財産以外の物納財産のうちにその物納の撤回により管理又は処分をするのに不適格な財産として政令で定めるもの（以下この条において「不適格財産」という。）があるときに限る。）は、当該不適格財産を物納の撤回の申請に係る財産に追加することを求め、当該申請者が当該財産に当該不適格財産」.
The implementation uses `threshold ≤ properties`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ properties`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.InheritanceTax46InKindRevocationTwoOrMore

open JapanTaxLaw.TaxFinance

def specInScope (properties : Nat) : Prop := 2 ≤ properties

theorem agree_scope (properties : Nat) : inScope properties ↔ specInScope properties := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax46InKindRevocationTwoOrMore
