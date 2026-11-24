import JapanTaxLaw.TaxFinance

/-!
# StatutoryFractions — 16 の pinned 法定割合（分数）規定

Each pinned unit states a fraction of a caller-established base:
  七十八分の二十二, 三分の一, 二分の一, 五分の一, 五分の四, 十分の一, 十分の九,
  百分の九十, 百分の九十四, 百分の二十五, 百分の五, 百分の五十, 百分の八十,
  百分の六, 百分の六十, 百分の十.

Model: the exact (numerator, denominator) pair in Nat. The base amount and the
operation (multiply / cap / grant / reading-substitution) are caller-established
and NOT MODELLED; only the statutory fraction constant is verified here.
-/

namespace JapanTaxLaw.StatutoryFractions

/-- 16 の法定割合規定を区別する添字。 -/
inductive FractionKind where
  | f22_78 | f1_3 | f1_2 | f1_5 | f4_5 | f1_10 | f9_10
  | f90_100 | f94_100 | f25_100 | f5_100 | f50_100 | f80_100
  | f6_100 | f60_100 | f10_100

deriving DecidableEq, Repr

/-- 実装: (分子, 分母) の組。 -/
def fractionOf : FractionKind → Nat × Nat
  | FractionKind.f22_78 => (22, 78)
  | FractionKind.f1_3 => (1, 3)
  | FractionKind.f1_2 => (1, 2)
  | FractionKind.f1_5 => (1, 5)
  | FractionKind.f4_5 => (4, 5)
  | FractionKind.f1_10 => (1, 10)
  | FractionKind.f9_10 => (9, 10)
  | FractionKind.f90_100 => (90, 100)
  | FractionKind.f94_100 => (94, 100)
  | FractionKind.f25_100 => (25, 100)
  | FractionKind.f5_100 => (5, 100)
  | FractionKind.f50_100 => (50, 100)
  | FractionKind.f80_100 => (80, 100)
  | FractionKind.f6_100 => (6, 100)
  | FractionKind.f60_100 => (60, 100)
  | FractionKind.f10_100 => (10, 100)

/-- 分母は零でない（全域で成立）。 -/
theorem denominator_pos (k : FractionKind) : (fractionOf k).2 > 0 := by
  cases k <;> decide

end JapanTaxLaw.StatutoryFractions
