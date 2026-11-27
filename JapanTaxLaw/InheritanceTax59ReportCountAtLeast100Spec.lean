import JapanTaxLaw.InheritanceTax59ReportCountAtLeast100

/-
# InheritanceTax59ReportCountAtLeast100Spec — independent spec for 相続税法 Num 59/5

Needle 「第一項各号、第二項又は第三項に定める調書（以下この条において単に「調書」という。）のうち、当該調書の提出期限の属する年の前々年の一月一日から十二月三十一日までの間に提出すべきであつた当該調書の枚数として財務省令で定めるところにより算出した数が百以上であるものについては、当該調書を提出すべき者は、第一項から第三項までの規定にかかわらず、当該調書に記載すべきものとされるこれらの規定に規定する事項（以下この条において「記載事項」という。）を次に掲げる方法のいずれかによりこれらの規定」.
The implementation uses `threshold ≤ reports`; the independent spec states
the statutory INCLUSIVE lower bound as `100 ≤ reports`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.InheritanceTax59ReportCountAtLeast100

open JapanTaxLaw.TaxFinance

def specInScope (reports : Nat) : Prop := 100 ≤ reports

theorem agree_scope (reports : Nat) : inScope reports ↔ specInScope reports := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax59ReportCountAtLeast100
