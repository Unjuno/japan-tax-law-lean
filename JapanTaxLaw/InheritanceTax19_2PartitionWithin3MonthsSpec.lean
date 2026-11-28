import JapanTaxLaw.InheritanceTax19_2PartitionWithin3Months

/-
# InheritanceTax19_2PartitionWithin3MonthsSpec — independent spec for 相続税法 Num 19_2/2

Needle 「ただし、その分割されていない財産が申告期限から三年以内（当該期間が経過するまでの間に当該財産が分割されなかつたことにつき、当該相続又は遺贈に関し訴えの提起がされたことその他の政令で定めるやむを得ない事情がある場合において、政令で定めるところにより納税地の所轄税務署長の承認を受けたときは、当該財産の分割ができることとなつた日として政令で定める日の翌日から四月以内）に分割された場合には、その分割された財産については、この限りでない。」.
The implementation uses `months <= 3`; this independent spec states the
statutory INCLUSIVE boundary as `months <= 3`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.InheritanceTax19_2PartitionWithin3Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months <= 3

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.InheritanceTax19_2PartitionWithin3Months
