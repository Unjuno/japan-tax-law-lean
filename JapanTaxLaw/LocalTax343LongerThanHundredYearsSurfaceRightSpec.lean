import JapanTaxLaw.LocalTax343LongerThanHundredYearsSurfaceRight

/-
# LocalTax343LongerThanHundredYearsSurfaceRightSpec — independent spec for 地方税法 Num 343/1

Needle 「固定資産税は、固定資産の所有者（質権又は百年より永い存続期間の定めのある地上権の目的である土地については、その質権者又は地上権者とする。以下固定資産税について同様とする。）に課する。」.
The implementation uses `years > 100`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.LocalTax343LongerThanHundredYearsSurfaceRight

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years > 100

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax343LongerThanHundredYearsSurfaceRight
