import JapanTaxLaw.TaxFinance

/-!
# CustomsDamageReduction — 関税定率法 art. 10(1)（変質・損傷の場合の関税軽減）L4 モデル

Source (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json

Models the two reduction structures of art. 10(1) — pinned bytes 逐語:

  「輸入貨物が輸入の許可…前に変質し、又は損傷した場合においては、政令で定めるところにより、
    当該貨物の変質若しくは損傷による価値の減少に基づく価格の低下率を基準として、その関税を
    軽減し、又はその関税の額とその変質若しくは損傷後における性質及び数量により課税した場合に
    おける関税の額との差額以内において、その関税を軽減することができる。ただし、輸入貨物が
    輸入申告等の時までに変質し、又は損傷した場合には、価格の低下率を基準とする関税の軽減
    （数量を課税標準とする関税に係るものを除く。）については、この限りでない。」

Two structures (Money = Nat):

  1) 低下率基準の軽減額 = tax × depreciationRate（TaxRate.applyFloor、切り捨て）
  2) 差額以内の軽減: 軽減額は tax − taxAfterDamage 以下（saturating 上限）

Scope & honest boundaries:

* 「価格の低下率」は政令で定めるところにより算定 — caller-established TaxRate。
  本モジュールはその算定方法をモデル化せず、与えられた率を適用するだけ。
* 「損傷後における性質及び数量により課税した場合の関税の額」も caller-established Money。
* 「軽減することができる」は裁量的な規定 — 本モジュールは軽減額の**構造・上限**のみを
  表現し、実際に軽減するかどうかの法的判断は caller-established。
* ただし書（輸入申告等の時までに変質した場合、低下率基準の軽減は適用不可、
  数量課税関税を除く）— caller-established Bool。本モジュールは適用判定はしないが、
  構造として `rateReductionAllowed` を渡す形にする。
* 第2項（輸入許可後の滅失等の払戻し）、第3項（納期限延長の減額）、第4項（特例申告貨物の
  控除）— NOT YET COVERED。
* 端数は切り捨て（TaxRate.applyFloor）。政令の丸め細目は射程外。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 10(1) — 低下率基準の軽減額 = 関税額 × 価格低下率（切り捨て）。 -/
def depreciationReduction (tax : Money) (depreciationRate : TaxRate) : Money :=
  depreciationRate.applyFloor tax

/-- art. 10(1) — 差額（軽減額の上限）= 元の関税額 − 損傷後課税額（saturating）。 -/
def reductionCap (originalTax taxAfterDamage : Money) : Money :=
  originalTax - taxAfterDamage

/-- art. 10(1) — 低下率基準の軽減が「差額以内」に収まるか。 -/
def reductionWithinCap (originalTax taxAfterDamage : Money) (depreciationRate : TaxRate) : Bool :=
  decide (depreciationReduction originalTax depreciationRate ≤ reductionCap originalTax taxAfterDamage)

-- ==== verified facts ====

theorem depreciationReduction_eq (tax : Money) (r : TaxRate) :
    depreciationReduction tax r = tax * r.num / r.den := rfl

theorem reductionCap_eq (original after : Money) :
    reductionCap original after = original - after := rfl

/-- 低下率が 100% 以下のとき、軽減額は関税額以下。 -/
theorem depreciationReduction_le_tax (tax : Money) (r : TaxRate) (hr : r.num ≤ r.den) :
    depreciationReduction tax r ≤ tax := by
  unfold depreciationReduction TaxRate.applyFloor
  have hmul' : tax * r.num ≤ r.den * tax := by
    rw [Nat.mul_comm r.den tax]
    exact Nat.mul_le_mul_left tax hr
  exact Nat.div_le_of_le_mul hmul' 

/-- 元の関税額が損傷後課税額以下のとき、差額（上限）は 0。 -/
theorem reductionCap_zero (original after : Money) (h : original ≤ after) :
    reductionCap original after = 0 := by
  unfold reductionCap
  exact Nat.sub_eq_zero_of_le h

/-- 軽減額が差額以内なら、軽減後関税は損傷後課税額以上。 -/
theorem taxAfterReduction_ge_damaged (original after : Money) (r : TaxRate)
    (hafter : after ≤ original)
    (h : depreciationReduction original r ≤ reductionCap original after) :
    after ≤ original - depreciationReduction original r := by
  unfold reductionCap at h
  let dep := depreciationReduction original r
  change dep ≤ original - after at h
  change after ≤ original - dep
  have hsum : dep + after ≤ original := Nat.add_le_of_le_sub hafter h
  have hsum' : after + dep ≤ original := by
    rw [Nat.add_comm]
    exact hsum
  exact Nat.le_sub_of_add_le hsum' 

-- ==== kernel-decided smoke checks ====

def rate10pct : TaxRate := ⟨10, 100, by decide⟩
-- 低下率基準: 1,000,000 × 10% = 100,000
example : depreciationReduction 1_000_000 rate10pct = 100_000 := by decide
-- 差額: 1,000,000 − 850,000 = 150,000
example : reductionCap 1_000_000 850_000 = 150_000 := by decide
-- 100,000 ≤ 150,000 → 差額以内
example : reductionWithinCap 1_000_000 850_000 rate10pct = true := by decide
-- 差額が 50,000 なら 100,000 は超過
example : reductionWithinCap 1_000_000 950_000 rate10pct = false := by decide
-- 境界: 元≤損傷後 → 差額0
example : reductionCap 800_000 900_000 = 0 := by decide

end JapanTaxLaw
