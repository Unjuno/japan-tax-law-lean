import JapanTaxLaw.TaxFinance

/-!
# LocalTaxVehicleSnowRate — 地方税法施行令 第四十四条の三（自動車税の税率に乗ずる割合・積雪軽減）の bounded L4 モデル

Sources (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json
  (revision CurrentEnforced per data/INVENTORY.json; 地方税法施行令)

  原文（担当範囲・正規化済み・UTF-8、183 文字）: local_order_K2.txt（第四十四条の三）。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized source,
doc-comments only）:

  art. 44の3(1)
    「（法第百五十四条第三項の自動車税の税率に乗ずる割合）第四十四条の三法第百五十四条第三項に規定する政令で定める割合は、十分の十から積雪により」
    「供することができないと認められる期間の月数（当該月数が四を超える場合には、四）に十分の〇・七五を乗じて得た数を控除したものとする」
  art. 44の3(2)
    「〇・七五を乗じて得た数を控除したものとする。２前項の月数は、暦に従つて計算し、一月に満たない端数を生じたときは、切り捨てる」

⚠ 指示文の「内容」との相違（重要・要確認）:
  親セッションから渡された「内容」は「…月数…に十分の一を乗じて得た数を減じた数」とし、
  実装方針も「10/10 − min(s,4) × 1/10」を求めていました。しかし pinned 原文（上の needle
  および data/raw/…law.json）は一字違わず「十分の〇・七五を乗じて得た数を控除したものとする」
  です（「十分の一」でも「減じた数」でもない）。「原文を一字も誤らず」かつ needle を pinned
  JSON に対して検証する規則に従い、**本モジュールは原文どおり 〇・七五（= 3/40）を採用**
  しました。指示文の 1/10 を採用すると needle が pinned JSON に MISS し、法的にも誤った
  軽減率（最大 4 割減）になります。**[〇・七五 = 3/40 が正] という判断は親セッションの
  最終確認を要します。**

Modelled (only the explicit statutory arithmetic in para. 1):

  * 「十分の十」= 10/10 = 1（型 `fullRate`）。
  * 「十分の〇・七五」= 〇・七五 / 10 = 0.75/10 = 75/1000 = **3/40**
    （型 `monthlyReductionRate`、1 月あたりの控除率）。
    十進「〇・七五」を Nat 分数で表すため分母 40 に通分する（den = 10 の Nat 分数では
    num = 7.5 となり表現不能）。これが指示文 den=10 からの唯一の逸脱で、原文逐語の
    「十分の〇・七五」を整数化した結果である。
  * 「当該月数が四を超える場合には、四」→ `capSnowMonths s = min s 4`。
  * 軽減割合 = 10/10 − min(s,4) × (3/40) = (40 − 3·min(s,4)) / 40
    （型 `snowReductionRatio`、num/den の Nat 分数・den = 40、値域 0 < 割合 ≤ 1）。
  * 税額 = 基準税額 × 割合（`TaxRate.applyFloor`、切り捨て）（型 `snowReducedTax`）。

  数値例（原文どおり 〇・七五）:
    s = 0 → 40/40 = 1.0、s = 1 → 37/40 = 0.925、s = 4 → 28/40 = 0.7、
    s ≥ 4 → 28/40（キャップ）。最大軽減は 3 割（0.7 倍）。

Scope & honest boundaries:

  * 積雪月数 `snowMonths`・基準税額 `baseTax`・「積雪により自動車を運行の用に供する
    ことができないと認められる」該当性・法第百五十四条第三項の適用判定はすべて
    **caller-established**。Bool は算定式に入れず、認定は本モジュールの外で行う。
  * 第2項の「暦に従つて計算し、一月に満たない端数を生じたときは、切り捨てる」は
    月数の算定方法を定める規定であり、`snowMonths` を caller が確定させる入力として
   扱うため **NOT MODELLED**（needle は逐語保持のみ）。
  * 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文に割合適用後の丸め細目の
    明記はなく、他モジュールと同じ慣例を採用する。
  * 転記監査は fidelity-only であり法的正しさを保証しない。
  * これは L4 の bounded スライスであり、**完成・網羅を主張しない**。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw.LocalTaxVehicleSnowRate

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 44の3 — 原文の定数と算定式
-- ============================================================

/-- art. 44の3(1): 原文の「十分の十」= 10/10 = 1。 -/
def fullRate : TaxRate := ⟨10, 10, by decide⟩

/-- art. 44の3(1): 原文の「十分の〇・七五」= 〇・七五/10 = 0.75/10 = 75/1000 = 3/40。
    「十分の一」ではない（指示文との相違は module doc-comment 参照）。 -/
def monthlyReductionRate : TaxRate := ⟨3, 40, by decide⟩

/-- art. 44の3(1): 「当該月数が四を超える場合には、四」。月数を 4 でキャップする。 -/
def capSnowMonths (snowMonths : Nat) : Nat :=
  min snowMonths 4

/-- art. 44の3(1): 軽減割合の分子（Nat 分数の num）= 40 − 3·min(s,4)。
    十進「〇・七五」を 3/40 に通分した整数式。 -/
def snowReductionRatioNum (snowMonths : Nat) : Nat :=
  40 - 3 * capSnowMonths snowMonths

/-- art. 44の3(1): 軽減割合 = 十分の十 − min(s,4) × 十分の〇・七五
    = 10/10 − min(s,4) × 3/40 = (40 − 3·min(s,4)) / 40。
    Nat 分数（num/den、den = 40）。0 < 割合 ≤ 1。 -/
def snowReductionRatio (snowMonths : Nat) : TaxRate :=
  ⟨snowReductionRatioNum snowMonths, 40, by decide⟩

/-- art. 44の3(1): 税額 = 基準税額 × 軽減割合（切り捨て）。 -/
def snowReducedTax (baseTax : Money) (snowMonths : Nat) : Money :=
  (snowReductionRatio snowMonths).applyFloor baseTax

-- ==== verified facts (positivity / connection) ====

theorem fullRate_numDen : fullRate.numDen = (10, 10) := rfl

theorem monthlyReductionRate_numDen : monthlyReductionRate.numDen = (3, 40) := rfl

theorem capSnowMonths_eq (snowMonths : Nat) :
    capSnowMonths snowMonths = min snowMonths 4 := rfl

theorem capSnowMonths_le_four (snowMonths : Nat) :
    capSnowMonths snowMonths ≤ 4 := by
  unfold capSnowMonths
  exact Nat.min_le_right snowMonths 4

theorem snowReductionRatio_num_eq (snowMonths : Nat) :
    (snowReductionRatio snowMonths).num = snowReductionRatioNum snowMonths := rfl

theorem snowReductionRatio_den (snowMonths : Nat) :
    (snowReductionRatio snowMonths).den = 40 := rfl

/-- 控除される分子 3·min(s,4) は高々 12 なので、割合の分子は常に正（≥ 28）。 -/
theorem snowReductionRatioNum_pos (snowMonths : Nat) :
    0 < snowReductionRatioNum snowMonths := by
  unfold snowReductionRatioNum capSnowMonths
  have hm : min snowMonths 4 ≤ 4 := Nat.min_le_right snowMonths 4
  have hmul : 3 * min snowMonths 4 ≤ 12 := Nat.mul_le_mul_left 3 hm
  have hlt : 3 * min snowMonths 4 < 40 := Nat.lt_of_le_of_lt hmul (by decide)
  exact Nat.sub_pos_of_lt hlt

theorem snowReductionRatio_num_pos (snowMonths : Nat) :
    0 < (snowReductionRatio snowMonths).num := by
  rw [snowReductionRatio_num_eq]
  exact snowReductionRatioNum_pos snowMonths

/-- 割合は高々 1（分子 ≤ 分母）。 -/
theorem snowReductionRatioNum_le_den (snowMonths : Nat) :
    snowReductionRatioNum snowMonths ≤ 40 := by
  unfold snowReductionRatioNum
  exact Nat.sub_le 40 (3 * capSnowMonths snowMonths)

theorem snowReductionRatio_num_le_den (snowMonths : Nat) :
    (snowReductionRatio snowMonths).num ≤ (snowReductionRatio snowMonths).den := by
  rw [snowReductionRatio_num_eq, snowReductionRatio_den]
  exact snowReductionRatioNum_le_den snowMonths

theorem snowReducedTax_eq (baseTax : Money) (snowMonths : Nat) :
    snowReducedTax baseTax snowMonths =
      baseTax * (40 - 3 * capSnowMonths snowMonths) / 40 := by
  rfl

-- ==== kernel-decided smoke checks ====

-- 定数（原文どおり 〇・七五 = 3/40）
example : fullRate.numDen = (10, 10) := by decide
example : monthlyReductionRate.numDen = (3, 40) := by decide
example : monthlyReductionRate.applyFloor 1000 = 75 := by decide

-- 月数キャップ（0/1/4/5(キャップ)/境界）
example : capSnowMonths 0 = 0 := by decide
example : capSnowMonths 1 = 1 := by decide
example : capSnowMonths 3 = 3 := by decide
example : capSnowMonths 4 = 4 := by decide
example : capSnowMonths 5 = 4 := by decide
example : capSnowMonths 12 = 4 := by decide

-- 軽減割合の分子（den = 40）
example : (snowReductionRatio 0).numDen = (40, 40) := by decide
example : (snowReductionRatio 1).numDen = (37, 40) := by decide
example : (snowReductionRatio 2).numDen = (34, 40) := by decide
example : (snowReductionRatio 3).numDen = (31, 40) := by decide
example : (snowReductionRatio 4).numDen = (28, 40) := by decide
example : (snowReductionRatio 5).numDen = (28, 40) := by decide

-- 税額（基準税額 × 割合・切り捨て）
example : snowReducedTax 1000 0 = 1000 := by decide
example : snowReducedTax 1000 1 = 925 := by decide
example : snowReducedTax 1000 4 = 700 := by decide
example : snowReducedTax 1000 5 = 700 := by decide
example : snowReducedTax 1000 100 = 700 := by decide
example : snowReducedTax 999 1 = 924 := by decide  -- 999×37/40 = 924.075 → 924

end JapanTaxLaw.LocalTaxVehicleSnowRate
