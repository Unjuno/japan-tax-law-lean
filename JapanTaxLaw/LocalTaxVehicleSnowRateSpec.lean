import JapanTaxLaw.LocalTaxVehicleSnowRate

/-!
# LocalTaxVehicleSnowRateSpec — 地方税法施行令 第四十四条の三 の独立整数定式

Sources (pinned; identical to LocalTaxVehicleSnowRate.lean):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

Independent restatement of the single modelled computation:

  * art. 44の3(1)「当該月数が四を超える場合には、四」
      impl: `capSnowMonths s = min s 4`
      spec: `specCapSnowMonths s = if s ≤ 4 then s else 4`
  * art. 44の3(1)「十分の〇・七五」
      impl: 約分済み `3/40`（`monthlyReductionRate = ⟨3,40⟩`）
      spec: 十進をそのまま保持した `75/1000`
      （〇・七五 = 75/100 なので 十分の〇・七五 = 75/1000。75/1000 = 3/40）
  * art. 44の3(1) 軽減割合
      impl: `(40 − 3·min(s,4)) / 40`
      spec: `(1000 − 75·specCap(s)) / 1000`
      両者は 25 倍関係（1000 = 25×40, 75 = 25×3）で同じ有理数。
  * art. 44の3(1) 税額
      impl: `snowReducedTax b s = b * (40 − 3·min(s,4)) / 40`
      spec: `specSnowReducedTax b s = b * (1000 − 75·specCap(s)) / 1000`

`agreeSnowReductionRatio` は交差掛け（n1*d2 == n2*d1）で、
`agreeSnowReducedTax` は有限サンプル上の `==` 一致で impl ≡ spec を確認する。
これらは有限サンプル上の一致確認であり、法的意味の等価証明ではない。

原文との相違（重要）: 親セッションの「内容」は「十分の一…減じた数」とするが、
pinned 原文は「十分の〇・七五…控除したものとする」である。impl / spec ともに
**原文どおり 〇・七五（75/1000 = 3/40）** を採用した（impl の module doc-comment 参照）。

Scope boundaries identical to the implementation. 積雪月数・基準税額・該当性は
caller-established、第2項の月数算定（暦に従い一月未満切捨て）は NOT MODELLED。

-/

namespace JapanTaxLaw.LocalTaxVehicleSnowRate

open JapanTaxLaw.TaxFinance

-- ==== independent formula ====

/-- Spec: 原文「十分の〇・七五」を十進のまま保持した 1 月あたり控除分子
    （〇・七五 = 75/100 → 十分の〇・七五 = 75/1000）。 -/
def specMonthlyReductionPerThousand : Nat := 75

/-- Spec: 「当該月数が四を超える場合には、四」（if-then-else による独立定式）。 -/
def specCapSnowMonths (snowMonths : Nat) : Nat :=
  if snowMonths ≤ 4 then snowMonths else 4

/-- Spec: 軽減割合 (num, den) = (1000 − 75·cap) / 1000。
    impl の (40 − 3·min) / 40 と 25 倍で同値。 -/
def specRatio (snowMonths : Nat) : Nat × Nat :=
  (1000 - 75 * specCapSnowMonths snowMonths, 1000)

/-- Spec: 税額 = 基準税額 × spec 割合（切り捨て）。 -/
def specSnowReducedTax (baseTax : Money) (snowMonths : Nat) : Money :=
  baseTax * (1000 - 75 * specCapSnowMonths snowMonths) / 1000

-- ==== points (kernel-decided) ====

example : specMonthlyReductionPerThousand = 75 := by decide

-- 月数キャップ（0/1/4/5(キャップ)/境界）
example : specCapSnowMonths 0 = 0 := by decide
example : specCapSnowMonths 1 = 1 := by decide
example : specCapSnowMonths 4 = 4 := by decide
example : specCapSnowMonths 5 = 4 := by decide
example : specCapSnowMonths 100 = 4 := by decide

-- 割合（spec・分母 1000）
example : specRatio 0 = (1000, 1000) := by decide
example : specRatio 1 = (925, 1000) := by decide
example : specRatio 4 = (700, 1000) := by decide
example : specRatio 5 = (700, 1000) := by decide

-- 税額（spec）
example : specSnowReducedTax 1000 0 = 1000 := by decide
example : specSnowReducedTax 1000 1 = 925 := by decide
example : specSnowReducedTax 1000 4 = 700 := by decide
example : specSnowReducedTax 1000 5 = 700 := by decide
example : specSnowReducedTax 999 1 = 924 := by decide

-- ==== agreement checks between implementation and Spec ====

/-- art. 44の3(1): impl ≡ spec の割合一致（交差掛け、有限サンプル）。 -/
def agreeSnowReductionRatio : Bool :=
  [0, 1, 2, 3, 4, 5, 6, 12, 100].all fun s =>
    let (n1, d1) := (snowReductionRatio s).numDen
    let (n2, d2) := specRatio s
    n1 * d2 == n2 * d1

/-- art. 44の3(1): impl ≡ spec の税額一致（有限サンプル上の `==`）。 -/
def agreeSnowReducedTax : Bool :=
  [ (0, 0), (1000, 0), (1000, 1), (1000, 4), (1000, 5), (1000, 100),
    (999, 1), (7, 3), (12_345, 12) ].all fun (b, s) =>
      snowReducedTax b s == specSnowReducedTax b s

example : agreeSnowReductionRatio = true := by decide
example : agreeSnowReducedTax = true := by decide

end JapanTaxLaw.LocalTaxVehicleSnowRate
