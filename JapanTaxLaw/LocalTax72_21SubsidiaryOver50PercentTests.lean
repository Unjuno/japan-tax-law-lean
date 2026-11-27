import JapanTaxLaw.LocalTax72_21SubsidiaryOver50PercentSpec

/- Kernel-decided boundary checks for 「当該内国法人の当該事業年度終了の時又は当該事業年度の前事業年度終了の時における特定子会社（当該内国法人が発行済株式又は出資（政令で定めるものを除く。）の総数又は総額の百分の五十を超える数の株式又は出資を直接又は間接に保有する他の法人をいう。）の株式又は出資で、それぞれの時において当該内国法人が保有するものの帳簿価額の合計額」. -/
namespace JapanTaxLaw.LocalTax72_21SubsidiaryOver50Percent

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 49 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 50 := by unfold inScope threshold; decide  -- threshold_at (STRICT: excluded)
example : inScope 51 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 49 = false := by decide  -- bool
example : inScopeBool 50 = false := by decide  -- bool
example : inScopeBool 51 = true := by decide  -- bool
example : inScope 50 ↔ specInScope 50 := agree_scope 50
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_21SubsidiaryOver50Percent
