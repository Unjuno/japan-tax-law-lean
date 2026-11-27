import JapanTaxLaw.LocalTax73_7SecurityTransferWithin2Years

/-
# LocalTax73_7SecurityTransferWithin2YearsSpec — independent spec for 地方税法 Num 73_7/1/8

Needle 「譲渡により担保の目的となつている財産（以下この節において「譲渡担保財産」という。）により担保される債権の消滅により当該譲渡担保財産の設定の日から二年以内に譲渡担保財産の権利者（以下この節において「譲渡担保権者」という。）から譲渡担保財産の設定者（設定者が更迭した場合における新設定者を除く。以下この節において同じ。）に当該譲渡担保財産を移転する場合における不動産の取得」.
The implementation uses `years ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `years ≤ 2`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax73_7SecurityTransferWithin2Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years ≤ 2

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax73_7SecurityTransferWithin2Years
