import JapanTaxLaw.InheritanceTax39SurveyOver3Months

/-
# InheritanceTax39SurveyOver3MonthsSpec — independent spec for 相続税法 Num 39/23

Needle 「第二項の規定により、税務署長が、同項の調査を行う場合において、当該調査に三月を超える期間を要すると認めるときにおける同項の規定の適用については、同項中「三月」とあるのは、「六月」とする。」.
The implementation uses `threshold < months`; the independent spec states
the statutory STRICT lower bound as `3 < months`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」 is STRICT: the threshold itself does NOT qualify; only a value strictly above it does.
-/
namespace JapanTaxLaw.InheritanceTax39SurveyOver3Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := 3 < months

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax39SurveyOver3Months
