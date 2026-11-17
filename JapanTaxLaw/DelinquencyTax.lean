import JapanTaxLaw.TaxFinance

/-!
# DelinquencyTax — 国税通則法 art. 60（延滞税）L4 モデル

Source (pinned):

  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: (data/raw/337AC0000000066_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models the rate structure of art. 60(2) — pinned bytes 逐語:

  「延滞税の額は、前項各号に規定する国税の法定納期限…の翌日からその国税を完納する日まで
    の期間の日数に応じ、その未納の税額に年十四・六パーセントの割合を乗じて計算した額とする。
    ただし、納期限…までの期間又は納期限の翌日から二月を経過する日までの期間については、
    その未納の税額に年七・三パーセントの割合を乗じて計算した額とする。」

What is modelled (fidelity to pinned bytes):

  * 2つの年率: 低率 7.3% (73/1000) / 高率 14.6% (146/1000) — いずれも原文逐語。
  * 期間区分: 「納期限の翌日から二月を経過する日まで」は低率、それを超えると高率。
    `withinTwoMonths` を caller-established Bool として区分を表現。

What is NOT modelled (honest boundary — 勝手な仮定を避ける):

  * **日割りの分母（年何日）**：原文は「年14.6%の割合を乗じて計算」としか書かず、
    日数に応じた換算方法は本 pinned 条文中に明示されない。架空の 365 等を仮定して
    未納税額×率×日数/365 のような式を作ることは検証規則違反のため行わない。
    実際の日割り計算は政令・通達に依存し得る — 本モジュールは率と区分のみを固定する。
  * 延滞税額そのもの（日数×未納税額×率）— caller-established の将来スライス。
  * art. 60(1) の適用要件 5号（期限内申告未完納／期限後申告／納税の告知／予定納税／源泉徴収）
    — 法的判断、caller-established。
  * art. 60(2) の「純損失の繰戻し等」「輸入許可に係る消費税等」の政令による別日、
    art. 61（期間の特例）、art. 63（免除）、附帯税の端数（art. 118(3) は TaxRounding 射程）
    — NOT YET COVERED。
  * 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 60(2) — 低率 年七・三パーセント（73/1000）。 -/
def delinquencyLowRate : TaxRate := ⟨73, 1000, by decide⟩

/-- art. 60(2) — 高率 年十四・六パーセント（146/1000）。 -/
def delinquencyHighRate : TaxRate := ⟨146, 1000, by decide⟩

/-- 高率は低率のちょうど2倍（14.6% = 2 × 7.3%）— 原文の数値関係。 -/
theorem delinquencyHighRate_is_double_low :
    delinquencyHighRate.num = 2 * delinquencyLowRate.num := by
  rfl

/-- art. 60(2) ただし書 — 「納期限の翌日から二月を経過する日までの期間」かどうかで
    適用税率を選ぶ。`withinTwoMonths = true` なら低率 7.3%、そうでなければ高率 14.6%。 -/
def delinquencyRate (withinTwoMonths : Bool) : TaxRate :=
  if withinTwoMonths then delinquencyLowRate else delinquencyHighRate

theorem delinquencyRate_low : delinquencyRate true = delinquencyLowRate := rfl
theorem delinquencyRate_high : delinquencyRate false = delinquencyHighRate := rfl

/-- 選択される税率は必ず低率または高率。 -/
theorem delinquencyRate_is_low_or_high (b : Bool) :
    delinquencyRate b = delinquencyLowRate ∨ delinquencyRate b = delinquencyHighRate := by
  cases b <;> simp [delinquencyRate]

-- ==== kernel-decided smoke checks ====

example : delinquencyLowRate = ⟨73, 1000, by decide⟩ := by rfl
example : delinquencyHighRate = ⟨146, 1000, by decide⟩ := by rfl
example : delinquencyRate true = ⟨73, 1000, by decide⟩ := by rfl
example : delinquencyRate false = ⟨146, 1000, by decide⟩ := by rfl

end JapanTaxLaw
