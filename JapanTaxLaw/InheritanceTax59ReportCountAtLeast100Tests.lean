import JapanTaxLaw.InheritanceTax59ReportCountAtLeast100Spec

/- Kernel-decided boundary checks for 「第一項各号、第二項又は第三項に定める調書（以下この条において単に「調書」という。）のうち、当該調書の提出期限の属する年の前々年の一月一日から十二月三十一日までの間に提出すべきであつた当該調書の枚数として財務省令で定めるところにより算出した数が百以上であるものについては、当該調書を提出すべき者は、第一項から第三項までの規定にかかわらず、当該調書に記載すべきものとされるこれらの規定に規定する事項（以下この条において「記載事項」という。）を次に掲げる方法のいずれかによりこれらの規定」. -/
namespace JapanTaxLaw.InheritanceTax59ReportCountAtLeast100

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 99 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 100 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : inScope 101 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 99 = false := by decide  -- bool
example : inScopeBool 100 = true := by decide  -- bool
example : inScopeBool 101 = true := by decide  -- bool
example : inScope 100 ↔ specInScope 100 := agree_scope 100
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax59ReportCountAtLeast100
