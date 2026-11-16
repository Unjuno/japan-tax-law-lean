import JapanTaxLaw.TaxFinance

/-!
# ConsumptionTaxImportBase — 消費税法 art. 28(4)（保税地域から引き取られる課税貨物の課税標準）L4 モデル

Source (pinned):

  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 25DCCEBFFB6690902C117A4AB9C16E4D64DB087BBA6D184A10EA6AEB58AB4A82
  (data/raw/363AC0000000108_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as ConsumptionTaxableBase.lean / ConsumptionTaxRate.lean)

Models only the computable addition in art. 28(4) — pinned bytes 逐語:

  「４保税地域から引き取られる課税貨物に係る消費税の課税標準は、当該課税貨物につき
    関税定率法（明治四十三年法律第五十四号）第四条から第四条の九まで（課税価格の計算方法）の
    規定に準じて算出した価格に当該課税貨物の保税地域からの引取りに係る消費税以外の消費税等
    （国税通則法第二条第三号（定義）に規定する消費税等をいう。）の額
    （附帯税の額に相当する額を除く。）及び関税の額
    （関税法第二条第一項第四号の二に規定する附帯税の額に相当する額を除く。）
    に相当する金額を加算した金額とする。」

Computation (Money = Nat, no coercion, no subtraction, no conditional zero):

  importTaxableBase f =
    f.customsValue + f.otherConsumptionTax + f.customsDuty   -- ((a + b) + c)

Design note on `isBondedWithdrawal`:

  The flag is the applicability gate of art. 28(4), recorded on the facts for the
  caller, but it is deliberately NOT an input to the arithmetic expression. The
  statute defines 「金額」 (an amount), not a conditional zero; writing
  `if f.isBondedWithdrawal then ... else 0` would misrepresent the provision as
  a conditional zero. The formula is therefore the same regardless of the flag.

Scope & honest boundaries (overclaim 防止):

  * 関税定率法 art. 4〜4の9 の課税価格算定そのものは射程外 —
    `customsValue` は caller-established な数値として受け取る。
  * 附帯税相当額の算定・控除は射程外 — caller が差し引き済みの数値を渡す。
    本モジュールは **Nat.sub を一切使わない**（underflow リスク回避）。
  * art. 29 の 7.8% / 6.24% を掛ける行為は射程外（税率は ConsumptionTaxRate 等、
    別モジュールの担当）。
  * art. 28(5) の政令で定める細目は射程外。
  * 転記監査は fidelity-only（原文との逐語一致の確認）であり、法的正しさの保証ではない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 28(4) — 保税地域から引き取られる課税貨物の課税標準の計算事実。

    3 つの Money はいずれも caller-established:
      * `customsValue`        : 関税定率法 art. 4〜4の9 に準じて算出した価格
      * `otherConsumptionTax` : 当該引取りに係る消費税以外の消費税等（国税通則法 2条3号）
                                の額のうち、附帯税相当額を caller が差し引き済みの値
      * `customsDuty`         : 関税の額のうち、附帯税相当額を caller が差し引き済みの値

    `isBondedWithdrawal` は適用判定ゲート。上の doc-comment のとおり式には入れない。 -/
structure ImportGoodsFacts where
  /-- 課税貨物が保税地域から引き取られたか（適用判定ゲート。式には入れない）。 -/
  isBondedWithdrawal : Bool
  /-- 関税定率法 art. 4〜4の9 に準じて算出した価格（caller-established）。 -/
  customsValue : Money
  /-- 保税地域からの引取りに係る消費税以外の消費税等。附帯税相当額は差し引き済み。 -/
  otherConsumptionTax : Money
  /-- 関税の額。附帯税相当額は差し引き済み。 -/
  customsDuty : Money
  deriving DecidableEq, Repr

/-- art. 28(4) 本体 — 価格に消費税以外の消費税等の額及び関税の額を加算した金額。
    純粋な Nat 足し算のみ。Nat.sub も `if ... then ... else 0` も使わない。 -/
def importTaxableBase (f : ImportGoodsFacts) : Money :=
  f.customsValue + f.otherConsumptionTax + f.customsDuty

-- ==== verified facts ====

/-- 定義どおりの和であること（計算則の確認）。 -/
theorem importTaxableBase_eq (f : ImportGoodsFacts) :
    importTaxableBase f =
      f.customsValue + f.otherConsumptionTax + f.customsDuty := rfl

/-- 関税定率法に準じた価格が増えれば課税標準は増えない（他 2 項は固定）。 -/
theorem importTaxableBase_mono_customsValue (f g : ImportGoodsFacts)
    (h : f.customsValue ≤ g.customsValue)
    (hother : f.otherConsumptionTax = g.otherConsumptionTax)
    (hduty : f.customsDuty = g.customsDuty) :
    importTaxableBase f ≤ importTaxableBase g := by
  unfold importTaxableBase
  rw [hother, hduty]
  exact Nat.add_le_add_right (Nat.add_le_add_right h g.otherConsumptionTax) g.customsDuty

/-- 消費税以外の消費税等の額が増えれば課税標準は増えない（他 2 項は固定）。 -/
theorem importTaxableBase_mono_otherConsumptionTax (f g : ImportGoodsFacts)
    (hcv : f.customsValue = g.customsValue)
    (h : f.otherConsumptionTax ≤ g.otherConsumptionTax)
    (hduty : f.customsDuty = g.customsDuty) :
    importTaxableBase f ≤ importTaxableBase g := by
  unfold importTaxableBase
  rw [hcv, hduty]
  exact Nat.add_le_add_right (Nat.add_le_add_left h g.customsValue) g.customsDuty

/-- 関税の額が増えれば課税標準は増えない（他 2 項は固定）。 -/
theorem importTaxableBase_mono_customsDuty (f g : ImportGoodsFacts)
    (hcv : f.customsValue = g.customsValue)
    (hother : f.otherConsumptionTax = g.otherConsumptionTax)
    (h : f.customsDuty ≤ g.customsDuty) :
    importTaxableBase f ≤ importTaxableBase g := by
  unfold importTaxableBase
  rw [hcv, hother]
  exact Nat.add_le_add_left h (g.customsValue + g.otherConsumptionTax)

-- ==== kernel-decided smoke checks ====

-- 換算例: 10,000,000 + 200,000 + 300,000 = 10,500,000
example : importTaxableBase ⟨true, 10_000_000, 200_000, 300_000⟩ = 10_500_000 := by decide
-- ゲートは式に入らない: フラグが false でも和は同じ
example : importTaxableBase ⟨false, 10_000_000, 200_000, 300_000⟩ = 10_500_000 := by decide
example : importTaxableBase ⟨true, 0, 0, 0⟩ = 0 := by decide
example : importTaxableBase ⟨false, 1, 2, 3⟩ = 6 := by decide

end JapanTaxLaw
