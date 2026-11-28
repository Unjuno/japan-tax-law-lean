import JapanTaxLaw.TaxFinance

/-
# InheritanceTax19_2PartitionWithin3Months — pinned clause 「ただし、その分割されていない財産が申告期限から三年以内（当該期間が経過するまでの間に当該財産が分割されなかつたことにつき、当該相続又は遺贈に関し訴えの提起がされたことその他の政令で定めるやむを得ない事情がある場合において、政令で定めるところにより納税地の所轄税務署長の承認を受けたときは、当該財産の分割ができることとなつた日として政令で定める日の翌日から四月以内）に分割された場合には、その分割された財産については、この限りでない。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 19_2, paragraph 2.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|d867915d1db8ebc39b44e08d9a107a2d9d05de1aa6140ce3e1a51297b2eca514.
原文逐語: 「ただし、その分割されていない財産が申告期限から三年以内（当該期間が経過するまでの間に当該財産が分割されなかつたことにつき、当該相続又は遺贈に関し訴えの提起がされたことその他の政令で定めるやむを得ない事情がある場合において、政令で定めるところにより納税地の所轄税務署長の承認を受けたときは、当該財産の分割ができることとなつた日として政令で定める日の翌日から四月以内）に分割された場合には、その分割された財産については、この限りでない。」
Scope: ONLY the 申告期限から三年以内 (months <= 3) INCLUSIVE ceiling for the 分割されていない財産の分割. 四月以内のやむを得ない事情の例外・政令で定める日の認定・訴えの提起の有無・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax19_2PartitionWithin3Months

open JapanTaxLaw.TaxFinance

/-- 「ただし、その分割されていない財産が申告期限から三年以内（当該期間が経過するまでの間に当該財産が分割されなかつたことにつき、当該相続又は遺贈に関し訴えの提起がされたことその他の政令で定めるやむを得ない事情がある場合において、政令で定めるところにより納税地の所轄税務署長の承認を受けたときは、当該財産の分割ができることとなつた日として政令で定める日の翌日から四月以内）に分割された場合には、その分割された財産については、この限りでない。」 — statutory threshold literal (3); INCLUSIVE boundary. -/
def inScope (months : Nat) : Prop := months <= 3

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months <= 3)

end JapanTaxLaw.InheritanceTax19_2PartitionWithin3Months
