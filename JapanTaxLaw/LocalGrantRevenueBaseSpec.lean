import JapanTaxLaw.LocalGrantRevenueBase

/-!
# LocalGrantRevenueBaseSpec — 地方交付税法 art. 14「交付金の百分の七十五控除」の独立整数定式

Sources (pinned; identical to LocalGrantRevenueBase.lean):

  Law id: 325AC0000000211
  Revision: 325AC0000000211_20261102_508AC0000000062

Independent restatement of the modelled computation — **not** reusing the
implementation's `TaxRate.applyFloor` helper:

  * impl: `grantDeductionRate = ⟨75, 100⟩`,
          `netRevenue e g = e - (g * 75 / 100)`
  * spec: `specDeductionRate = (75, 100)`,
          `specDeduction g = 75 * g / 100`（impl と乗法順を入れ替えた独立定式）,
          `specNetRevenue e g = e - specDeduction g`

3 税目（利子割・配当割・株式等譲渡所得割）はいずれも共通関数 `netRevenue` を呼ぶだけなので、
Spec 側でも 1 本の `specNetRevenue` に対する `agree*` で 3 税目すべてを被覆する。

`agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではない。
範囲・境界は impl と同じ（基準税率・収入見込額・交付金見込額・該当性は caller-established、
Bool は式に入れない、丸めは `TaxRate.applyFloor` に委ねる、減算は saturating）。

NOT MODELLED: 本文の他の税目・控除、経過措置・附則（impl の doc-comment を参照）。

-/

namespace JapanTaxLaw.LocalGrantRevenueBase

open JapanTaxLaw.TaxFinance

-- ==== independent integer formulation ====

/-- Spec: 原文「百分の七十五」= 75/100 の (num, den)。 -/
def specDeductionRate : Nat × Nat := (75, 100)

/-- Spec: 交付金 75% 相当額 = 75 * grant / 100（impl と乗法順を逆にした独立定式）。 -/
def specDeduction (grant : Money) : Money := 75 * grant / 100

/-- Spec: 控除後収入見込額 = 収入見込額 − 75*交付金/100（saturating）。 -/
def specNetRevenue (estimatedTax grant : Money) : Money :=
  estimatedTax - specDeduction grant

-- ==== points (kernel-decided) ====

example : specDeductionRate = (75, 100) := by decide

example : specDeduction 0 = 0 := by decide
example : specDeduction 100 = 75 := by decide
example : specDeduction 101 = 75 := by decide  -- 端数切り捨て
example : specDeduction 200 = 150 := by decide

example : specNetRevenue 0 0 = 0 := by decide
example : specNetRevenue 0 100 = 0 := by decide
example : specNetRevenue 74 100 = 0 := by decide
example : specNetRevenue 75 100 = 0 := by decide
example : specNetRevenue 76 100 = 1 := by decide
example : specNetRevenue 1000 100 = 925 := by decide
example : specNetRevenue 1000 0 = 1000 := by decide

-- ==== agreement checks between implementation and Spec ====

/-- 控除率: impl ≡ spec（numDen の一致）。 -/
def agreeDeductionRate : Bool :=
  specDeductionRate == grantDeductionRate.numDen

/-- 控除額: impl ≡ spec（有限サンプル上の `==`）。 -/
def agreeDeduction : Bool :=
  [0, 1, 74, 75, 76, 99, 100, 101, 200, 999, 1000, 10_000].all fun g =>
    specDeduction g == grantDeductionRate.applyFloor g

/-- 控除後額（= 3 税目すべての共通関数）: impl ≡ spec（有限サンプル上の `==`）。
    境界: 0、控除>見込額で 0、端数を含む。 -/
def agreeNetRevenue : Bool :=
  [ (0, 0), (0, 100), (74, 100), (75, 100), (76, 100),
    (100, 0), (100, 100), (100, 200), (101, 100), (999, 200),
    (1000, 0), (1000, 100), (1000, 1000), (10_000, 1), (1, 10_000) ].all fun p =>
    specNetRevenue p.1 p.2 == netRevenue p.1 p.2

/-- 利子割: impl ≡ spec（3 税目は共通関数を呼ぶだけなので agreeNetRevenue と同値を確認）。 -/
def agreeInterest : Bool :=
  [0, 74, 76, 100, 101, 1000].all fun g =>
    specNetRevenue 1000 g == interestSplitNetRevenue 1000 g

/-- 配当割: impl ≡ spec。 -/
def agreeDividend : Bool :=
  [0, 74, 76, 100, 101, 1000].all fun g =>
    specNetRevenue 1000 g == dividendSplitNetRevenue 1000 g

/-- 株式等譲渡所得割: impl ≡ spec。 -/
def agreeStock : Bool :=
  [0, 74, 76, 100, 101, 1000].all fun g =>
    specNetRevenue 1000 g == stockTransferIncomeSplitNetRevenue 1000 g

example : agreeDeductionRate = true := by decide
example : agreeDeduction = true := by decide
example : agreeNetRevenue = true := by decide
example : agreeInterest = true := by decide
example : agreeDividend = true := by decide
example : agreeStock = true := by decide

end JapanTaxLaw.LocalGrantRevenueBase
