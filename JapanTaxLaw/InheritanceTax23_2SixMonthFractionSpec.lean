import JapanTaxLaw.InheritanceTax23_2SixMonthFraction

/-
# InheritanceTax23_2SixMonthFractionSpec — independent spec for 相続税法 Num 23_2/1

Needle 「当該配偶者居住権の目的となつている建物の耐用年数（所得税法の規定に基づいて定められている耐用年数に準ずるものとして政令で定める年数をいう。ロにおいて同じ。）から建築後の経過年数（六月以上の端数は一年とし、六月に満たない端数は切り捨てる。ロにおいて同じ。）及び当該配偶者居住権の存続年数（当該配偶者居住権が存続する年数として政令で定める年数をいう。次号において同じ。）を控除した年数」.
The implementation uses `months >= 6`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.InheritanceTax23_2SixMonthFraction

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months >= 6

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.InheritanceTax23_2SixMonthFraction
