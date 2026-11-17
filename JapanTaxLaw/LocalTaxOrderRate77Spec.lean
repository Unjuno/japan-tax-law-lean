import JapanTaxLaw.LocalTaxOrderRate77

/-!
# LocalTaxOrderRate77Spec — 地方税法施行令 第九条の二十二・第三十五条の四の五 の独立整数定式

Sources (pinned; identical to LocalTaxOrderRate77.lean):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

Independent restatement of the two modelled computations:

  * art. 9の22「百分の九十九」
      impl: `art9_22Rate = ⟨99, 100⟩`, `art9_22Tax b = b * 99 / 100`
      spec: `specArt9Rate = (99, 100)`, `specArt9Tax b = 99 * b / 100`
      （乗法の順序を入れ替えた独立定式。Nat の可換性により一致する）
  * art. 35の4の5「百分の七・七」
      impl: `art35_4_5Rate = ⟨77, 1000⟩`, `art35_4_5Tax b = b * 77 / 1000`
      spec: 十進「七・七」を 10 分の単位で保持し
            `specPercent77Tenths = 7 * 10 + 7 = 77`、
            `specArt35Rate = (77, 1000)`, `specArt35Tax b = 77 * b / 1000`
      （七・七 = 77/10 なので 百分の七・七 = (77/10)/100 = 77/1000。
        **770/1000 ではない**。10 倍過大バグを明確に否定する example を置く）

`agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではない。
範囲・境界は impl と同じ（課税標準・該当性は caller-established、Bool は式に入れない、
丸めは `TaxRate.applyFloor` に委ねる）。

-/

namespace JapanTaxLaw.LocalTaxOrderRate77

open JapanTaxLaw.TaxFinance

-- ==== independent integer formulation ====

/-- Spec: 第九条の二十二「百分の九十九」= 99/100 の (num, den)。 -/
def specArt9Rate : Nat × Nat := (99, 100)

/-- Spec: 十進「七・七」を 10 分の単位で保持した分子 = 7*10 + 7 = 77。
    これを 100 で割ると 百分の七・七 = 77/1000 になる（770/1000 ではない）。 -/
def specPercent77Tenths : Nat := 7 * 10 + 7

/-- Spec: 第三十五条の四の五「百分の七・七」= 77/1000 の (num, den)。 -/
def specArt35Rate : Nat × Nat := (specPercent77Tenths, 1000)

/-- Spec: 第九条の二十二の税額 = 99 * base / 100（乗法の順序を impl と逆にした独立定式）。 -/
def specArt9Tax (base : Money) : Money := 99 * base / 100

/-- Spec: 第三十五条の四の五の税額 = 77 * base / 1000（乗法の順序を impl と逆にした独立定式）。 -/
def specArt35Tax (base : Money) : Money := specPercent77Tenths * base / 1000

-- ==== points (kernel-decided) ====

example : specArt9Rate = (99, 100) := by decide
example : specPercent77Tenths = 77 := by decide
example : specArt35Rate = (77, 1000) := by decide

/-- ⚠ 10 倍過大バグ（770/1000 = 77%）の明示的な否定。 -/
example : specArt35Rate ≠ (770, 1000) := by decide
example : specArt35Tax 1000 ≠ 770 := by decide

example : specArt9Tax 0 = 0 := by decide
example : specArt9Tax 1 = 0 := by decide
example : specArt9Tax 100 = 99 := by decide
example : specArt9Tax 1000 = 990 := by decide

example : specArt35Tax 0 = 0 := by decide
example : specArt35Tax 1 = 0 := by decide
example : specArt35Tax 13 = 1 := by decide
example : specArt35Tax 999 = 76 := by decide
example : specArt35Tax 1000 = 77 := by decide
example : specArt35Tax 10_000 = 770 := by decide

-- ==== agreement checks between implementation and Spec ====

/-- art. 9の22: impl ≡ spec（numDen の一致）。 -/
def agreeArt9Rate : Bool :=
  specArt9Rate == art9_22Rate.numDen

/-- art. 35の4の5: impl ≡ spec（numDen の一致）。 -/
def agreeArt35Rate : Bool :=
  specArt35Rate == art35_4_5Rate.numDen

/-- art. 9の22: impl ≡ spec の税額一致（有限サンプル上の `==`）。 -/
def agreeArt9Tax : Bool :=
  [0, 1, 2, 99, 100, 101, 999, 1000, 10_000].all fun b =>
    specArt9Tax b == art9_22Tax b

/-- art. 35の4の5: impl ≡ spec の税額一致（有限サンプル上の `==`）。 -/
def agreeArt35Tax : Bool :=
  [0, 1, 12, 13, 77, 999, 1000, 2000, 10_000].all fun b =>
    specArt35Tax b == art35_4_5Tax b

example : agreeArt9Rate = true := by decide
example : agreeArt35Rate = true := by decide
example : agreeArt9Tax = true := by decide
example : agreeArt35Tax = true := by decide

end JapanTaxLaw.LocalTaxOrderRate77
