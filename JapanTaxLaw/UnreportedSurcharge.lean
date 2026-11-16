import JapanTaxLaw.TaxFinance

/-!
# UnreportedSurcharge — 国税通則法 art. 66（無申告加算税）L4 モデル

Source (pinned):

  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: (data/raw/337AC0000000066_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models the computable rate structure of art. 66(1) and (3) — pinned bytes 逐語:

  1項: 「…納付すべき税額に百分の十五の割合（期限後申告書…が、…調査があつたことにより
        …更正又は決定があるべきことを予知してされたものでないときは、百分の十の割合）を
        乗じて計算した金額に相当する無申告加算税を課する。」
  3項: 「…加算後累積納付税額が三百万円を超えるときは、…加算後累積納付税額を次の各号に掲げる
        税額に区分してそれぞれの税額に当該各号に定める割合（…予知してされたものでないときは、
        その割合から百分の五の割合を減じた割合。）を乗じて計算した金額の合計額から…
        一五十万円以下の部分に相当する税額百分の十五の割合
        二五十万円を超え三百万円以下の部分に相当する税額百分の二十の割合
        三三百万円を超える部分に相当する税額百分の三十の割合」

Computation (Money = Nat; 率適用のみ、端数は既存 TaxRounding.lean の射程):

  basicRate reduced       = if reduced then 10/100 else 15/100       -- art. 66(1)
  tierRate tier reduced   = base tier, 軽減時は −5/100:
                              tier 0 (≤500,000): 15% → 10%
                              tier 1 (500,000..3,000,000): 20% → 15%
                              tier 2 (>3,000,000): 30% → 25%
  tieredSurcharge tax reduced = 区分ごとの部分額 × 対応税率の合計:
      min(tax, 500_000) * r0
    + min(max(tax - 500_000, 0), 2_500_000) * r1
    + max(tax - 3_000_000, 0) * r2

Scope & honest boundaries:

* 「納付すべき税額」「加算後累積納付税額」「累積納付税額」は caller-established Money。
* 「予知してされたものでない」（軽減）・「正当な理由がある」（1項ただし書）は法的判断 —
  caller-established Bool `reduced`。1項ただし書は適用除外として doc-comment のみに記載し、
  式には入れない（法令は「課する」という金額定義であり条件付きゼロではない）。
* 3項の「合計額から累積納付税額の按分相当額を控除」— 累積納付税額の区分按分は政令計算に依存、
  caller-established。本モジュールは `tieredSurcharge` までを計算し、控除は行わない。
* 2項（50万円超の加算 5%）— 簡素な加算だが 3項累進と並列の別ルート。本スライスでは
  3項の三段階税率表を主とし、2項の加算ロジックは NOT YET COVERED として明示。
* 5項（帳簿不記載 10%/5% 加算）、6項、7項〜9項、art. 67/68 — NOT YET COVERED。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 66(3) の税率区分。 -/
inductive SurchargeTier where
  | upTo500k      -- 五十万円以下の部分
  | over500kTo3m  -- 五十万円を超え三百万円以下の部分
  | over3m        -- 三百万円を超える部分
  deriving DecidableEq, Repr

/-- art. 66(1) — 基本税率 15%、軽減時 10%（百分の十五／百分の十）。 -/
def unreportedSurchargeBasicRate (reduced : Bool) : TaxRate :=
  if reduced then ⟨10, 100, by decide⟩ else ⟨15, 100, by decide⟩

/-- art. 66(3) — 区分ごとの税率。軽減時は各区分から 5% を減じる。 -/
def tierRate (tier : SurchargeTier) (reduced : Bool) : TaxRate :=
  match tier, reduced with
  | SurchargeTier.upTo500k,      false => ⟨15, 100, by decide⟩
  | SurchargeTier.upTo500k,      true  => ⟨10, 100, by decide⟩
  | SurchargeTier.over500kTo3m,  false => ⟨20, 100, by decide⟩
  | SurchargeTier.over500kTo3m,  true  => ⟨15, 100, by decide⟩
  | SurchargeTier.over3m,        false => ⟨30, 100, by decide⟩
  | SurchargeTier.over3m,        true  => ⟨25, 100, by decide⟩

/-- art. 66(3) — 三段階累進の税額（各区分の部分額 × 対応税率の合計）。 -/
def tieredSurcharge (tax : Money) (reduced : Bool) : Money :=
  let t0 := min tax 500_000
  let t1 := min (max (tax - 500_000) 0) 2_500_000
  let t2 := max (tax - 3_000_000) 0
  (tierRate SurchargeTier.upTo500k reduced).applyFloor t0
    + (tierRate SurchargeTier.over500kTo3m reduced).applyFloor t1
    + (tierRate SurchargeTier.over3m reduced).applyFloor t2

-- ==== verified facts ====

theorem tierRate_basic_upTo500k : tierRate SurchargeTier.upTo500k false = ⟨15, 100, by decide⟩ := rfl
theorem tierRate_basic_over500kTo3m : tierRate SurchargeTier.over500kTo3m false = ⟨20, 100, by decide⟩ := rfl
theorem tierRate_basic_over3m : tierRate SurchargeTier.over3m false = ⟨30, 100, by decide⟩ := rfl

/-- 軽減時は各区分の税率が 5 パーセントポイント低い（num が 5 小さい）。 -/
theorem tierRate_reduced_num (tier : SurchargeTier) :
    (tierRate tier true).num + 5 = (tierRate tier false).num := by
  cases tier <;> rfl

/-- 軽減時累進額は基本累進額以下。 -/
theorem tieredSurcharge_reduced_le_basic (tax : Money) :
    tieredSurcharge tax true ≤ tieredSurcharge tax false := by
  unfold tieredSurcharge tierRate TaxRate.applyFloor
  simp only []
  -- 各区分で軽減 num が小さいため、Itemごとに ≤ を示して合算
  have h0 : min tax 500000 * 10 / 100 ≤ min tax 500000 * 15 / 100 := by
    exact Nat.div_le_div_right (Nat.mul_le_mul_left _ (by decide))
  have h1 : min (max (tax - 500000) 0) 2500000 * 15 / 100
          ≤ min (max (tax - 500000) 0) 2500000 * 20 / 100 := by
    exact Nat.div_le_div_right (Nat.mul_le_mul_left _ (by decide))
  have h2 : max (tax - 3000000) 0 * 25 / 100 ≤ max (tax - 3000000) 0 * 30 / 100 := by
    exact Nat.div_le_div_right (Nat.mul_le_mul_left _ (by decide))
  exact Nat.add_le_add (Nat.add_le_add h0 h1) h2

-- ==== kernel-decided smoke checks ====

-- 50万以下: 400,000 × 15% = 60,000（軽減 10% = 40,000）
example : tieredSurcharge 400_000 false = 60_000 := by decide
example : tieredSurcharge 400_000 true = 40_000 := by decide
-- 50万ちょうど: 500,000 × 15% = 75,000
example : tieredSurcharge 500_000 false = 75_000 := by decide
-- 200万: 50万×15% + 150万×20% = 75,000 + 300,000 = 375,000
example : tieredSurcharge 2_000_000 false = 375_000 := by decide
-- 300万: 75,000 + 250万×20% = 75,000 + 500,000 = 575,000
example : tieredSurcharge 3_000_000 false = 575_000 := by decide
-- 400万: 75,000 + 500,000 + 100万×30% = 875,000
example : tieredSurcharge 4_000_000 false = 875_000 := by decide
-- 軽減時 400万: 50万×10% + 250万×15% + 100万×25% = 50,000+375,000+250,000 = 675,000
example : tieredSurcharge 4_000_000 true = 675_000 := by decide
-- 0
example : tieredSurcharge 0 false = 0 := by decide

end JapanTaxLaw
