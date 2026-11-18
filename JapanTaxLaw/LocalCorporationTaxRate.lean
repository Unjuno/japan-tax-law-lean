import JapanTaxLaw.TaxFinance

/-!
# LocalCorporationTaxRate — 地方法人税法 art. 10（税率）L4 税額計算モデル

Source (pinned):
  Law id: 426AC0000000011
  Revision: 426AC0000000011_20260401_507AC0000000013
  Amendment enforcement date: 2026-04-01
  Raw snapshot: data/raw/426AC0000000011_20260401_507AC0000000013.law.json

原文（一字も誤らず転記）:

  （税率）第十条基準法人税額に対する地方法人税の額は、各課税事業年度の
  課税標準法人税額に百分の十・三の税率を乗じて計算した金額とする。
  ２前項の場合において、法人の各課税事業年度の基準法人税額に法人税法
  第六十七条第一項の規定により加算された金額がある場合には、前項の
  課税標準法人税額は、当該基準法人税額から当該加算された金額を控除した
  金額とする。

Models 地方法人税法 art. 10:

* 第1項 — 地方法人税額 = 各課税事業年度の**課税標準法人税額** × 百分の十・三。
  「百分の十・三」= 10.3% = **103/1000**（小数表記だが分母は 1000。
  1030/1000 = 103% は 10 倍過大なので注意。smoke で base=1000 → 103 を確認）。
* 第2項 — 「加算された金額がある場合」の課税標準法人税額 =
  基準法人税額 − 法人税法第六十七条第一項の規定により加算された金額
  （`Nat` の飽和減算、負にはならない）。

Scope & honest boundaries (overclaim 防止):

* **課税標準法人税額**（第1項の乗算基礎）、**基準法人税額**（第2項の控除基礎）、
  および **加算額**（法人税法 art. 67(1) の加算額）はすべて **caller-established**。
  本モデルは「それらの額がどう算定されるか」を一切都合せず、与えられた金額に
  対する税率適用と飽和減算の算術のみを扱う。
* 「加算された金額がある場合」という第2項の該当性判定は **caller-established Bool**
  であり、**Bool は式に入れない**。`localCorpTaxBase` は判定を含まない純粋な減算で、
  いつこれを適用するかは呼出元が決める。
* 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「乗じて計算した金額」
  とし本条に端数規定を持たないため、丸め規則は per-law business data として
  floor を採用したことを明示する。
* 法人税法 art. 67(1) の加算額そのものの算定、基準法人税額の算定、および
  申告・納付手続は **射程外**。

Pinned evidence in doc-comments only; all theorems here claim properties of
the model only, never of the real legal semantics (誠実性の原則 —
Pin ↔ 原文一致 is the trust boundary; interpretation is not guaranteed).
-/

namespace JapanTaxLaw.LocalCorporationTaxRate

open JapanTaxLaw.TaxFinance

/-- 百分の十・三 — 地方法人税法 art. 10 (10.3% = 103/1000). -/
def localCorpTaxRate : TaxRate := ⟨103, 1000, by decide⟩

-- ==== 税率分母の正性（well-definedness） ====

theorem localCorpTaxRate_den_pos : 0 < localCorpTaxRate.den := by decide

-- ==== 第1項・第2項の bounded 計算 ====

/-- 第1項: 地方法人税額 = 課税標準法人税額 × 103/1000.
    課税標準法人税額 `base` は caller-established。 -/
def localCorpTax (base : Money) : Money :=
  localCorpTaxRate.applyFloor base

/-- 第2項: 「加算された金額がある場合」の課税標準法人税額 =
    基準法人税額 − 加算額（飽和減算）。基準法人税額・加算額は caller-established。
    該当性の Bool 判定はこの式に入れない（呼出元が適用を決める）。 -/
def localCorpTaxBase (adjustedBase : Money) (addition : Money) : Money :=
  adjustedBase - addition

-- ==== model properties（実法の性質ではなくモデルの整合性のみ） ====

/-- 第1項: 税額は caller-established な課税標準法人税額について単調非減少。 -/
theorem localCorpTax_mono {a b : Money} (h : a ≤ b) :
    localCorpTax a ≤ localCorpTax b := by
  simp [localCorpTax, localCorpTaxRate, TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 103 h)

/-- 第2項: 控除後の課税標準法人税額は基準法人税額以下。 -/
theorem localCorpTaxBase_le_base (adjustedBase addition : Money) :
    localCorpTaxBase adjustedBase addition ≤ adjustedBase :=
  Nat.sub_le _ _

/-- 第2項: 加算額が基準法人税額以上なら、課税標準法人税額は 0（飽和）。 -/
theorem localCorpTaxBase_eq_zero_of_ge (adjustedBase addition : Money)
    (h : adjustedBase ≤ addition) :
    localCorpTaxBase adjustedBase addition = 0 :=
  Nat.sub_eq_zero_of_le h

-- ==== positivity smoke: 分母の正の倍数で税額が正になる ====

theorem localCorpTax_pos (n : Nat) (h : 0 < n) :
    0 < localCorpTax (n * 1000) := by
  simp [localCorpTax, localCorpTaxRate, TaxRate.applyFloor]
  have h1 : 1 ≤ n := Nat.succ_le_of_lt h
  have h1000 : 1000 ≤ n * 1000 := by
    simpa using (Nat.mul_le_mul_right 1000 h1)
  exact Nat.le_trans h1000 (Nat.le_mul_of_pos_right (n * 1000) (by decide : 0 < 103))

-- ==== kernel-decided smoke checks ====

example : localCorpTax 0 = 0 := by decide
example : localCorpTax 1 = 0 := by decide
example : localCorpTax 1000 = 103 := by decide  -- 10 倍過大 1030 でないことを確認
example : localCorpTax 100_000 = 10_300 := by decide

example : localCorpTaxBase 0 0 = 0 := by decide
example : localCorpTaxBase 1000 200 = 800 := by decide
example : localCorpTaxBase 500 500 = 0 := by decide
example : localCorpTaxBase 200 1000 = 0 := by decide  -- 加算 > 基準 で飽和

end JapanTaxLaw.LocalCorporationTaxRate
