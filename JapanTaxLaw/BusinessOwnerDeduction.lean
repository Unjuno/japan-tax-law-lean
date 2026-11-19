import JapanTaxLaw.TaxFinance

/-!
# BusinessOwnerDeduction — 地方税法 art. 72の49の14（事業主控除）の bounded L4 モデル

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  （revision CurrentEnforced per data/INVENTORY.json）

Namespace note: a dedicated sub-namespace `JapanTaxLaw.BusinessOwnerDeduction` is
used so that this slice cannot collide with other modules of 地方税法 (law id
325AC0000000226) that live in the flat `JapanTaxLaw` namespace.

Pinned bytes 逐語 (needle evidence, transcribed one-for-one from the 担当範囲原文
`C4_business.txt`; 全角空白 U+3000 を含まない。担当範囲原文・pinned JSON の
flatten テキスト（raw / `re.sub(r"[\s　]+", "", ...)` 正規化の両方）で各 1 回
出現を `.find()` / `.count()` で確認済み):

  art. 72の49の14(1) 「事業を行う個人については、当該個人の事業の所得の計算上二百九十万円を控除する。」
  art. 72の49の14(2) 「前項の場合において、事業を行つた期間が一年に満たないときは、同項に規定する控除額は、二百九十万円に当該年において事業を行つた月数を乗じて得た額を十二で除して算定した金額とする。」
  art. 72の49の14(3) 「前項の月数は、暦に従い計算し、一月に満たない端数を生じたときは、一月とする。」

金額・算式の読み取り（原文どおり）:

  二百九十万円      = 2_900_000（年額）
  2項の月割         = 二百九十万円 × 月数 ÷ 12（原文は「乗じて得た額を十二で除して」
                     という乗算先行の順。端数は自然数除算により切り捨て）
  1項               = 1 年に満たない場合のみ 2項の月割、それ以外は年額 2_900_000

Computational result (bounded):

  businessOwnerDeductionFull        = 2_900_000
  monthlyBusinessDeduction months   = 2_900_000 * months / 12   （Nat 除算で切り捨て）
  businessOwnerDeduction months     =
      months < 12 → monthlyBusinessDeduction months
      12 ≤ months → 2_900_000

Out of scope / honesty notes:

  * 月数は **caller-established** とする。3項「暦に従い計算し、一月に満たない
    端数を生じたときは一月とする」の丸め（applyFloor 相当）は呼出側が行い、
    丸め済みの月数を本モデルへ渡す。本モデルは月数の算定自体を行わない。
  * 「事業を行う個人であるか」の該当性、および事業所得額そのものの算定も
    **caller-established**。本モデルは控除額のみを扱い、Bool を金額式に
    混入させない。
  * 事業の所得の計算への控除の適用、他の所得控除との調整、確定申告・
    端数処理（通則法 art. 118 / 119）、申告期限等は NOT MODELLED。
  * 完成・網羅を主張しない。L7 候補 3,438 件は LEGAL_REVIEW_PENDING のまま。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice` or `propext`.
-/

namespace JapanTaxLaw.BusinessOwnerDeduction

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 72の49の14 — 控除額定数
-- ============================================================

/-- art. 72の49の14(1): 年額「二百九十万円」。 -/
def businessOwnerDeductionFull : Money := 2_900_000

-- ============================================================
-- art. 72の49の14(2) — 月割（端数切り捨て）
-- ============================================================

/-- art. 72の49の14(2): 「二百九十万円に当該年において事業を行つた月数を乗じて
    得た額を十二で除して算定した金額」。原文の乗算先行の順どおり
    `full * months / 12` とし、Nat 除算により端数を切り捨てる。
    `months` は 3項の丸め（一月未満を一月とする）を呼出側で済ませた値
    （caller-established）。 -/
def monthlyBusinessDeduction (months : Nat) : Money :=
  businessOwnerDeductionFull * months / 12

-- ============================================================
-- art. 72の49の14(1)(2) — 年額 / 月割の選択
-- ============================================================

/-- art. 72の49の14(1)(2): 事業を行つた期間が 1 年に満たないとき（月数 < 12）
    は月割、それ以外は年額 2_900_000。月数は caller-established。 -/
def businessOwnerDeduction (months : Nat) : Money :=
  if months < 12 then monthlyBusinessDeduction months else businessOwnerDeductionFull

-- --- positivity / smoke: businessOwnerDeductionFull ---

theorem businessOwnerDeductionFull_pos : 0 < businessOwnerDeductionFull := by decide

theorem businessOwnerDeductionFull_value : businessOwnerDeductionFull = 2_900_000 := by decide

-- --- positivity / monotonicity / smoke: monthlyBusinessDeduction ---

/-- 月割額は月数について単調非減。 -/
theorem monthlyBusinessDeduction_mono {months m : Nat} (h : months ≤ m) :
    monthlyBusinessDeduction months ≤ monthlyBusinessDeduction m := by
  unfold monthlyBusinessDeduction
  exact Nat.div_le_div_right (Nat.mul_le_mul_left 2_900_000 h)

/-- 月数 ≤ 12 なら月割額は年額以下（2項は 1 年未満のみの読替え）。 -/
theorem monthlyBusinessDeduction_le_full (months : Nat) (h : months ≤ 12) :
    monthlyBusinessDeduction months ≤ businessOwnerDeductionFull := by
  unfold monthlyBusinessDeduction businessOwnerDeductionFull
  exact Nat.div_le_of_le_mul (Nat.mul_le_mul_left 2_900_000 h)

/-- 端数切り捨ての例: 1 か月 → 2_900_000 × 1 ÷ 12 = 241_666（端数 8 を捨てる）。 -/
theorem monthlyBusinessDeduction_one : monthlyBusinessDeduction 1 = 241_666 := by decide

/-- 12 か月分の月割は年額に一致する。 -/
theorem monthlyBusinessDeduction_twelve : monthlyBusinessDeduction 12 = businessOwnerDeductionFull := by
  decide

-- --- positivity / branch characterization / smoke: businessOwnerDeduction ---

/-- 1 年未満（月数 < 12）なら月割を返す。 -/
theorem businessOwnerDeduction_of_lt_twelve {months : Nat} (h : months < 12) :
    businessOwnerDeduction months = monthlyBusinessDeduction months := by
  unfold businessOwnerDeduction
  rw [ite_eq_left h]

/-- 1 年以上（12 ≤ 月数）なら年額を返す。 -/
theorem businessOwnerDeduction_of_ge_twelve {months : Nat} (h : 12 ≤ months) :
    businessOwnerDeduction months = businessOwnerDeductionFull := by
  unfold businessOwnerDeduction
  rw [ite_eq_right (Nat.not_lt.mpr h)]

/-- 控除額は常に年額以下。 -/
theorem businessOwnerDeduction_le_full (months : Nat) :
    businessOwnerDeduction months ≤ businessOwnerDeductionFull := by
  by_cases h : months < 12
  · rw [businessOwnerDeduction_of_lt_twelve h]
    exact monthlyBusinessDeduction_le_full months (Nat.le_of_lt h)
  · rw [businessOwnerDeduction_of_ge_twelve (Nat.not_lt.mp h)]
    exact Nat.le_refl _

-- ==== kernel-decided smoke checks ====

example : businessOwnerDeductionFull = 2_900_000 := by decide  -- 二百九十万円
example : monthlyBusinessDeduction 0 = 0 := by decide
example : monthlyBusinessDeduction 1 = 241_666 := by decide
example : monthlyBusinessDeduction 11 = 2_658_333 := by decide
example : monthlyBusinessDeduction 12 = 2_900_000 := by decide
example : businessOwnerDeduction 0 = 0 := by decide
example : businessOwnerDeduction 1 = 241_666 := by decide
example : businessOwnerDeduction 11 = 2_658_333 := by decide
example : businessOwnerDeduction 12 = 2_900_000 := by decide
example : businessOwnerDeduction 13 = 2_900_000 := by decide

end JapanTaxLaw.BusinessOwnerDeduction
