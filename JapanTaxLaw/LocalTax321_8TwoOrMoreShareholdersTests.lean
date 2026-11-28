import JapanTaxLaw.LocalTax321_8TwoOrMoreShareholdersSpec

/- Kernel-decided boundary checks for 「当該前十年内事業年度に係る控除未済還付法人税額（当該他の法人に株主等が二以上ある場合には、当該控除未済還付法人税額を当該他の法人の発行済株式又は出資（当該他の法人が有する自己の株式又は出資を除く。）の総数又は総額で除し、これに当該法人の有する当該他の法人の株式又は出資の数又は金額を乗じて計算した金額）は、それぞれ当該控除未済還付法人税額に係る前十年内事業年度開始の日の属する当該法人の事業年度（当該法人の合併等事業年度開始の日以後に開始した当該被合併法人等の前十年内事業年度に係」. -/
namespace JapanTaxLaw.LocalTax321_8TwoOrMoreShareholders

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 1 = false := by decide  -- threshold_below
example : inScopeBool 2 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 3 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 2 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 1 := by unfold inScope; decide  -- outside (Prop)
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (shareholders : Nat) : inScope shareholders ↔ specInScope shareholders := agree_scope shareholders

end JapanTaxLaw.LocalTax321_8TwoOrMoreShareholders
