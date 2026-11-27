import JapanTaxLaw.InheritanceTax42SnowSurveyOver6Months

/-
# InheritanceTax42SnowSurveyOver6MonthsSpec — independent spec for 相続税法 Num 42/17

Needle 「第二項の規定により、税務署長が、同項の調査を行う場合において、積雪その他これに準ずる事由により当該調査に六月を超える期間を要すると認めるときにおける前項の規定の適用については、同項中「六月」とあるのは、「九月」とする。」.
The implementation uses `threshold < months`; the independent spec states
the statutory STRICT lower bound as `6 < months`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」 is STRICT: the threshold itself does NOT qualify; only a value strictly above it does.
-/
namespace JapanTaxLaw.InheritanceTax42SnowSurveyOver6Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := 6 < months

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax42SnowSurveyOver6Months
