import JapanTaxLaw.LocalTax312Capital10MEmployeesUpTo50InclusiveSpec

/- Kernel-decided boundary checks for 「ホ　資本金等の額を有する法人（法人税法別表第二に規定する独立行政法人で収益事業を行わないもの及びニに掲げる法人を除く。以下この表において同じ。）で資本金等の額が千万円以下であるもののうち、市町村内に有する事務所、事業所又は寮等の従業者（政令で定める役員を含む。）の数の合計数（次号から第九号まで及び第五項において「従業者数の合計数」という。）が五十人以下のもの」. -/
namespace JapanTaxLaw.LocalTax312Capital10MEmployeesUpTo50Inclusive

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 9_999_999 = true := by decide  -- threshold_below
example : inScopeBool 10_000_000 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 10_000_001 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 10_000_000 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 10_000_001 := by unfold inScope; decide  -- outside (Prop)
example : inScope 10_000_000 ↔ specInScope 10_000_000 := agree_scope 10_000_000
example (capital : Nat) : inScope capital ↔ specInScope capital := agree_scope capital

end JapanTaxLaw.LocalTax312Capital10MEmployeesUpTo50Inclusive
