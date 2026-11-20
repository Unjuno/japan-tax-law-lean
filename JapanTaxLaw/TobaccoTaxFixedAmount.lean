import JapanTaxLaw.TaxFinance

/-!
# TobaccoTaxFixedAmount — 地方税法施行規則 art.16の4の4（たばこ税に係る課税定額の算定方法）bounded L4 モデル

Sources (pinned):
  Law id: 329M50000002023
  Revision: 329M50000002023_20261101_508M60000008045
  Raw snapshot: data/raw/329M50000002023_20261101_508M60000008045.law.json
  Article Num 16_4_4, flat/normalized leaf text 261 chars, U+3000 count 0.

原文逐語:
  「たばこ税に係る課税定額は、次の算式によつて算定するものとする。
    算式 Ａ×（（Ｃ×２）／Ｂ）
    算式の符号 Ａ 前々年度の全国の市町村たばこ税の額の合計額として総務大臣が定める額
    Ｂ 全国のたばこ消費基礎人口の合計
    Ｃ 当該市町村のたばこ消費基礎人口」
  §2 「当該計算した金額に千円未満の端数があるとき、又はその全額が千円未満である
       ときは、その端数金額又はその全額を切り上げる。」

Computation（原文逐語から導出。coordinator の数式は信じていない）:
  raw = A × (C × 2) / B（B ≠ 0、分母 0 は安全版で 0）
  fixed = roundUpThousand(raw)（千円未満を切り上げる。切り捨てではない）

Scope: A・B・C は caller-established。法485条の13第1項の詳細・人口の
算定方法は NOT MODELLED。
-/

namespace JapanTaxLaw.TobaccoTaxFixedAmount

open JapanTaxLaw.TaxFinance

/-- 「千円未満の端数を切り上げる」。0 → 0、1..1000 → 1000、1001 → 2000。 -/
def roundUpThousand (x : Money) : Money :=
  if x = 0 then 0 else (x + 999) / 1000 * 1000

/-- 算式の分子部分: C×2。 -/
def numerator (c : Money) : Money := c * 2

/-- たばこ税に係る課税定額 = roundUpThousand( A × (C×2) / B )。 -/
def fixedAmount (a b c : Money) : Money :=
  if b = 0 then 0 else roundUpThousand (a * (c * 2) / b)

-- ==== kernel-decided smoke ====
example : roundUpThousand 0 = 0 := by decide
example : roundUpThousand 1 = 1000 := by decide
example : roundUpThousand 1000 = 1000 := by decide
example : roundUpThousand 1001 = 2000 := by decide
example : numerator 5 = 10 := by decide
/-- A=100000, B=1000, C=10 → 100000×(10×2)/1000 = 2000 → 2000。 -/
example : fixedAmount 100000 1000 10 = 2000 := by decide
/-- 端数切り上げ: A=1000, B=300, C=1 → 1000×2/300 = 6 → 1000。 -/
example : fixedAmount 1000 300 1 = 1000 := by decide
/-- 分母 0 → 0。 -/
example : fixedAmount 1000 0 10 = 0 := by decide

theorem roundUpThousand_pos {x : Money} (h : 0 < x) : 0 < roundUpThousand x := by
  unfold roundUpThousand
  rw [ite_eq_right (Nat.ne_of_gt h)]
  have hx : 1 ≤ x := h
  have hle : 1000 ≤ x + 999 := Nat.add_le_add_right hx 999
  exact Nat.mul_pos (Nat.div_pos hle (by decide : 0 < 1000)) (by decide : 0 < 1000)

end JapanTaxLaw.TobaccoTaxFixedAmount
