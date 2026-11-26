import JapanTaxLaw.LocalTax21LightOilTaxOver30000Spec

/- Kernel-decided boundary checks for 「道府県知事は、前項の場合における軽油引取税額が三万円をこえるときは、当該特約業者、元売業者又は小売業者の申請により、三月以内の期間を限つて徴収の猶予をすることができる。」. -/
namespace JapanTaxLaw.LocalTax21LightOilTaxOver30000

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 29999 := by unfold inScope threshold; decide  -- below_limit
example : ¬ inScope 30000 := by unfold inScope threshold; decide  -- limit_at (をこえる STRICT: excluded)
example : inScope 30001 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 29999 = false := by decide  -- bool
example : inScopeBool 30000 = false := by decide  -- bool
example : inScopeBool 30001 = true := by decide  -- bool
example : inScope 30000 ↔ specInScope 30000 := agree_scope 30000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax21LightOilTaxOver30000
