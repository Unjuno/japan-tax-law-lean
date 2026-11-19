import JapanTaxLaw.TaxFinance

/-!
# SpecialDeliveryTaxMarch — 特別交付税に関する省令 art.10（東日本大震災に係る道府県の三月分の算定方法の特例）bounded L4 モデル

Sources (pinned):
  Law id: 351M50000008035
  Revision: 351M50000008035_20260316_508M60000008025
  Raw snapshot: data/raw/351M50000008035_20260316_508M60000008025.law.json
  Article Num 10, flat/normalized leaf text 1052 chars, U+3000 count 0.

原文逐語（pinned 本文から一字も変えず抽出）:
  「令和七年度に限り、第四条第一項第一号の額は、同号の規定によつて算定した額に、
    次の各号によつて算定した額（表示単位は千円とし、表示単位未満の端数があるときは、
    その端数を四捨五入する。）の合算額を加えた額とする。」
  一号・二号: 調査額（特定県以外は〇・八を乗じた額）から附則第一条号の額を控除
  三号・四号: 調査額に〇・八を乗じた額から附則額を控除
  五号〜七号: 調査額から附則額を控除（乗じなし）
  八号: 調査額に〇・七を乗じた額から附則額を控除

Computation（原文逐語から導出。coordinator の数式は信じていない）:
  〇・八 = 8/10、〇・七 = 7/10（80/10 や 70/10 の 10 倍誤りではない）。
  scaled  = rate.applyFloor surveyed（「乗じて得た額」の端数は切り捨てを modeling choice として明示）
  item    = if annex ≤ scaled then scaled − annex else 0（saturating）
  rounded = (item + 500) / 1000 * 1000（表示単位千円・四捨五入、ちょうど 500 で切り上げ）
  total   = 各号の rounded の合算額
  art10   = base + total

Scope & honest boundaries:
  * 調査額・附則額・基準額は caller-established Money。Bool は金額式に入れない。
  * 〇・八/〇・七の適用（特定県該当性・号ごとの別）は caller-established として rate で受け取る。
  * 附則第八条第一項各号の具体的算定、第四条第一項第一号の表の各号、「令和七年度に限り」の
    適用判定は NOT MODELLED。
  * 有限領域の smoke は普遍的な正しさを意味しない。
-/

namespace JapanTaxLaw.SpecialDeliveryTaxMarch

open JapanTaxLaw.TaxFinance

/-- 〇・八 = 8/10。 -/
def rate08 : TaxRate := ⟨8, 10, by decide⟩

/-- 〇・七 = 7/10。 -/
def rate07 : TaxRate := ⟨7, 10, by decide⟩

/-- 乗じる率が None の号（五〜七号）は率 1/1。 -/
def rateOne : TaxRate := ⟨1, 1, by decide⟩

/-- 「調査した額に〇・八（等）を乗じて得た額」。端数は切り捨てを modeling choice とする。 -/
def scaledSurvey (surveyed : Money) (rate : TaxRate) : Money := rate.applyFloor surveyed

/-- 「附則第八条第一項各号によって算定した額を控除した額」（saturating）。 -/
def itemAfterDeduction (scaled annex : Money) : Money :=
  if annex ≤ scaled then scaled - annex else 0

/-- 表示単位千円・未満の端数を四捨五入（round half up: 500 で切り上げ）。 -/
def roundToThousand (x : Money) : Money := (x + 500) / 1000 * 1000

/-- 一号〜八号（各号は既に千円単位に四捨五入済み）の合算額。 -/
def totalAddition (i1 i2 i3 i4 i5 i6 i7 i8 : Money) : Money :=
  i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8

/-- 第四条第一項第一号の額 = 算定額 base + 合算額。 -/
def marchAmount (base i1 i2 i3 i4 i5 i6 i7 i8 : Money) : Money :=
  base + totalAddition i1 i2 i3 i4 i5 i6 i7 i8

-- ==== verified facts (model properties only) ====

theorem rate08_num_den : rate08.num = 8 ∧ rate08.den = 10 := by decide
theorem rate07_num_den : rate07.num = 7 ∧ rate07.den = 10 := by decide

/-- 〇・八 = 8/10（10 倍誤りの 80/10 でない）。 -/
example : scaledSurvey 1000 rate08 = 800 := by decide
/-- 〇・七 = 7/10（10 倍誤りの 70/10 でない）。 -/
example : scaledSurvey 1000 rate07 = 700 := by decide
/-- 率 1/1 は調査額そのもの。 -/
example : scaledSurvey 1234 rateOne = 1234 := by decide

/-- 四捨五入の境界: 499 → 0、500 → 1000（切り上げ）。 -/
example : roundToThousand 499 = 0 := by decide
example : roundToThousand 500 = 1000 := by decide
example : roundToThousand 0 = 0 := by decide
example : roundToThousand 1500 = 2000 := by decide
example : roundToThousand 1234 = 1000 := by decide

/-- 控除が scaled を超えれば 0（saturating）。 -/
example : itemAfterDeduction 100 150 = 0 := by decide
example : itemAfterDeduction 100 40 = 60 := by decide

theorem itemAfterDeduction_le (scaled annex : Money) :
    itemAfterDeduction scaled annex ≤ scaled := by
  unfold itemAfterDeduction
  by_cases h : annex ≤ scaled
  · rw [ite_eq_left h]
    exact Nat.sub_le _ _
  · rw [ite_eq_right h]
    exact Nat.zero_le _

theorem roundToThousand_mono : ∀ {x y : Money}, x ≤ y → roundToThousand x ≤ roundToThousand y := by
  intro x y h
  unfold roundToThousand
  exact Nat.mul_le_mul_right 1000 (Nat.div_le_div_right (Nat.add_le_add_right h 500))

theorem marchAmount_ge_base (base i1 i2 i3 i4 i5 i6 i7 i8 : Money) :
    base ≤ marchAmount base i1 i2 i3 i4 i5 i6 i7 i8 := by
  unfold marchAmount
  exact Nat.le_add_right _ _

-- ==== kernel-decided smoke ====
example : marchAmount 100 10 20 30 40 50 60 70 80 = 460 := by decide

end JapanTaxLaw.SpecialDeliveryTaxMarch
