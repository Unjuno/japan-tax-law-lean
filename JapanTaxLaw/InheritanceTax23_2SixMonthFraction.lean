import JapanTaxLaw.TaxFinance

/-
# InheritanceTax23_2SixMonthFraction — pinned clause 「当該配偶者居住権の目的となつている建物の耐用年数（所得税法の規定に基づいて定められている耐用年数に準ずるものとして政令で定める年数をいう。ロにおいて同じ。）から建築後の経過年数（六月以上の端数は一年とし、六月に満たない端数は切り捨てる。ロにおいて同じ。）及び当該配偶者居住権の存続年数（当該配偶者居住権が存続する年数として政令で定める年数をいう。次号において同じ。）を控除した年数」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 23_2, paragraph 1, item 2.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|691d95b85eebea0ca57029103083a4bf3968d82da61e0e936a9df2caba09253c.
原文逐語: 「当該配偶者居住権の目的となつている建物の耐用年数（所得税法の規定に基づいて定められている耐用年数に準ずるものとして政令で定める年数をいう。ロにおいて同じ。）から建築後の経過年数（六月以上の端数は一年とし、六月に満たない端数は切り捨てる。ロにおいて同じ。）及び当該配偶者居住権の存続年数（当該配偶者居住権が存続する年数として政令で定める年数をいう。次号において同じ。）を控除した年数」
Scope: ONLY the 建築後経過年数の六月以上の端数を一年とする INCLUSIVE 下限（months >= 6）. 耐用年数そのものの算定・六月未満の切り捨て・存続年数の算定・他号他項他条項は NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax23_2SixMonthFraction

open JapanTaxLaw.TaxFinance

/-- Statutory threshold literal (6) with the inclusive boundary fixed by the clause. -/
def inScope (months : Nat) : Prop := months >= 6

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months >= 6)

end JapanTaxLaw.InheritanceTax23_2SixMonthFraction
