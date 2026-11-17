import JapanTaxLaw.InheritanceAssetValuation

/-!
# InheritanceAssetValuation spec — 独立整数定式と agree 検証

Source (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

本モジュールは実装 (`InheritanceAssetValuation.lean`) とは独立した定式を与える:

  * `specRatePct` — 残存期間区分を「< 上限+1」（実装は「≤ 上限」）で書き直した
    割合表。境界値（ちょうど 10 年は 5%、10 年を超えると 10% 等）が
    実装と一致することを有限グリッドで `decide` する。
  * `specSuperficiesValue` — 土地時価 × 割合 / 100 の独立整数定式。
  * `specArt25NoSurrenderValue` — art. 25 の 90% 適用の独立定式（`m * 90 / 100`）。

### Verification approach（誠実な限界）

各 `agree*` は有限サンプル上の `==` 一致をカーネルが `decide` するものであり、
全 `Nat` に対する普遍的同値を証明したものではない。法的意味の等価証明でもない。
-/

namespace JapanTaxLaw.InheritanceAssetValuation

open JapanTaxLaw.TaxFinance

/-- 独立定式（割合）: 上限を「< 上限+1」の形で記述。
    `perpetual = true` は 40%、50 年超は 90%。 -/
def specRatePct (years : Nat) (perpetual : Bool) : Nat :=
  if perpetual then 40
  else if years < 11 then 5
  else if years < 16 then 10
  else if years < 21 then 20
  else if years < 26 then 30
  else if years < 31 then 40
  else if years < 36 then 50
  else if years < 41 then 60
  else if years < 46 then 70
  else if years < 51 then 80
  else 90

/-- spec 側の割合（TaxRate 化）。実装の `superficiesRate` とは別定義。 -/
def specSuperficiesRate (years : Nat) (perpetual : Bool) : TaxRate :=
  ⟨specRatePct years perpetual, 100, by decide⟩

/-- spec 側の地上権評価額（独立整数定式）。 -/
def specSuperficiesValue (landMarketValue : Money) (years : Nat) (perpetual : Bool) : Money :=
  landMarketValue * (specRatePct years perpetual) / 100

/-- spec 側の art. 25 90% 適用（独立整数定式）。 -/
def specArt25NoSurrenderValue (compoundBase : Money) : Money :=
  compoundBase * 90 / 100

-- ==== spec 自身の境界スモーク ====

example : specRatePct 10 false = 5 := by decide
example : specRatePct 11 false = 10 := by decide
example : specRatePct 25 false = 30 := by decide
example : specRatePct 26 false = 40 := by decide
example : specRatePct 50 false = 80 := by decide
example : specRatePct 51 false = 90 := by decide
example : specRatePct 3 true = 40 := by decide

-- ==== agree（実装 ≡ spec、有限サンプルをカーネルが decide） ====

/-- years = 0..60 の各年度について、perpetual = false/true の双方で
    割合の分子が一致し、分母が 100 であることを確認。 -/
def agreeSuperficiesRate : Bool :=
  let rec go (n : Nat) : Bool :=
    match n with
    | 0 => true
    | n' + 1 =>
        let k := 60 - n'
        ((superficiesRate k false).num == specRatePct k false) &&
        ((superficiesRate k true).num == specRatePct k true) &&
        ((superficiesRate k false).den == 100) &&
        ((superficiesRate k true).den == 100) &&
        go n'
  go 61

example : agreeSuperficiesRate = true := by decide

/-- 評価額も years = 0..60 × perpetual 双方 × 代表時価で一致。 -/
def agreeSuperficiesValue : Bool :=
  let rec go (n : Nat) : Bool :=
    match n with
    | 0 => true
    | n' + 1 =>
        let k := 60 - n'
        (superficiesValue 123_457 k false == specSuperficiesValue 123_457 k false) &&
        (superficiesValue 123_457 k true == specSuperficiesValue 123_457 k true) &&
        (superficiesValue 1_001 k false == specSuperficiesValue 1_001 k false) &&
        go n'
  go 61

example : agreeSuperficiesValue = true := by decide

/-- art. 25 の 90% 適用は compoundBase = 0..64 で一致。 -/
def agreeArt25NoSurrenderValue : Bool :=
  let rec go (n : Nat) : Bool :=
    match n with
    | 0 => true
    | n' + 1 => (art25NoSurrenderValue n' == specArt25NoSurrenderValue n') && go n'
  go 65

example : agreeArt25NoSurrenderValue = true := by decide

end JapanTaxLaw.InheritanceAssetValuation
