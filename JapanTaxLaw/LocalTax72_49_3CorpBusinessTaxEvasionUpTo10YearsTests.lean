import JapanTaxLaw.LocalTax72_49_3CorpBusinessTaxEvasionUpTo10YearsSpec

/- Kernel-decided boundary checks for 「偽りその他不正の行為により法人の行う事業に対する事業税の全部又は一部を免れた場合には、法人の代表者（法人課税信託の受託者である個人を含む。第三項において同じ。）、代理人、使用人その他の従業者で、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」. -/
namespace JapanTaxLaw.LocalTax72_49_3CorpBusinessTaxEvasionUpTo10Years

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 9 = true := by decide  -- threshold_below
example : inScopeBool 10 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 11 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 10 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 11 := by unfold inScope; decide  -- outside (Prop)
example : inScope 10 ↔ specInScope 10 := agree_scope 10
example (years : Nat) : inScope years ↔ specInScope years := agree_scope years

end JapanTaxLaw.LocalTax72_49_3CorpBusinessTaxEvasionUpTo10Years
