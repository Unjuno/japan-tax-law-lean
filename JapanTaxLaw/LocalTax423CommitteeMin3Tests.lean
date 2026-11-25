import JapanTaxLaw.LocalTax423CommitteeMin3Spec

/- Kernel-decided boundary checks for 「固定資産評価審査委員会の委員の定数は三人以上とし、当該市町村の条例で定める。」. -/
namespace JapanTaxLaw.LocalTax423CommitteeMin3

open JapanTaxLaw.TaxFinance

example : ¬ inScope 2 := by unfold inScope threshold; decide
example : inScope 3 := by unfold inScope threshold; decide
example : inScope 4 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 2 = false := by decide
example : inScopeBool 3 = true := by decide
example : inScopeBool 4 = true := by decide
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax423CommitteeMin3
