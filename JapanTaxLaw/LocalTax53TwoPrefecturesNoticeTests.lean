import JapanTaxLaw.LocalTax53TwoPrefecturesNoticeSpec

/- Kernel-decided boundary checks for 「二以上の道府県において事務所又は事業所を有する法人の主たる事務所又は事業所所在地の道府県知事は、当該法人から前項の規定による届出があつた場合には、その旨を関係道府県知事に通知しなければならない。」. -/
namespace JapanTaxLaw.LocalTax53TwoPrefecturesNotice

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : inScope 2 := by unfold inScope threshold; decide
example : inScope 3 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 2 = true := by decide
example : inScopeBool 3 = true := by decide
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax53TwoPrefecturesNotice
