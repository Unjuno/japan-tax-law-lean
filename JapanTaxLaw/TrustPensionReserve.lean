import JapanTaxLaw.TaxFinance

/-!
# TrustPensionReserve — 法人税法施行令 art.157（信託に係る退職年金等積立金額の計算）の bounded L4 モデル

Source (pinned):
  Law id: 340CO0000000097 (法人税法施行令)
  Revision: 340CO0000000097_20261001_507CO0000000121
  Amendment enforcement date: 2026-10-01
  Raw snapshot: data/raw/340CO0000000097_20261001_507CO0000000121.law.json

担当範囲の原文（UTF-8, LEN 2375）: C7_157.txt。art.157 第1項（法84条2項1号イ）
の算術をモデル化する。第1項の要旨:

  「…最終の財産計算時における第一号及び第二号に掲げる金額の合計額から
   第三号及び第四号に掲げる金額の合計額を控除した金額に、調整割合を
   乗じて計算した金額とする。」

Pinned bytes 逐語（needle evidence, doc-comments only, 一字も変更せず）:

  「最終の財産計算時における第一号及び第二号に掲げる金額の合計額から第三号及び第四号に掲げる金額の合計額を控除した金額に、調整割合を乗じて計算した金額とする。」
  「（信託に係る退職年金等積立金額の計算）第百五十七条法第八十四条第二項第一号イ（退職年金等積立金額の計算）に規定する政令で定めるところにより計算した金額は、」
  「一当該契約に係る信託財産に属する有価証券につき、法第六十一条の三第一項第二号（売買目的外有価証券の原価法により評価した金額）に規定する原価法」
  「二当該契約に係る信託財産に属する金銭の額並びに金銭及び有価証券以外の資産の取得のために要した金額の合計額三当該契約に係る信託財産からの収益の分配でその計算期間」
  「前各項に規定する調整割合とは、百分の七に当該事業年度開始の時までに到来したこれらの規定に規定する信託財産に係る最終の財産計算時の属する日の翌日から」

Modelled（第1項の明示的な算術のみ）:

  * `trustPensionBase first second third fourth` =
    `(first + second) - (third + fourth)`（Nat の saturating 減算。
    控除額が加算額以上なら 0）。
  * `trustPensionReserve first second third fourth adjustmentRate` =
    `adjustmentRate.applyFloor (trustPensionBase …)`。
    「調整割合」は **caller-established な `TaxRate`** として受け取り、
    本モジュールでは算定しない。端数は `TaxRate.applyFloor`（切り捨て）を
    modeling choice として経由させる。

Scope & honest boundaries:

  * 第一号〜第四号の各金額、調整割合、および各号・各項の該当性は
    **caller-established**。Bool は金額式に入れない。
  * **NOT MODELLED**: 各号の具体的算定（第一号の原価法・時価評価、
    法61条の3参照、第二号の金銭・資産取得金額、第三号の収益分配、
    第四号の掛金・加入者負担掛金割合の計算、他条文参照）および
    第5項の調整割合の算定（百分の七に月数を乗じ十二で除し百分の百を加える）。
    これらは外部の評価・他条文・事業年度情報に依存するため対象外。
  * 第2項（確定給付年金基金資産運用契約）は算術が第1項と同一の
    （第一号+第二号）−（第三号+第四号）であり、同じ def で表現できるが、
    契約の別・該当性の判定は caller-established とする。
  * 第3項・第4項は（第一号+第二号）−第三号（第四号なし）の異なり式であり、
    本 L4 スライス（第1項・第2項の bounded モデル）の射程外。
  * 第6項（月数の端数切り捨て）、第7項・第8項（引継ぎ時の読替え）も NOT MODELLED。
  * Money = Nat。転記監査は fidelity-only であり法的正しさを保証しない。
    Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw.TrustPensionReserve

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art.157 第1項（・第2項）— 控除後金額と調整割合適用
-- ============================================================

/-- 第1項: 「第一号及び第二号に掲げる金額の合計額から第三号及び第四号に掲げる
    金額の合計額を控除した金額」。Nat の saturating 減算。 -/
def trustPensionBase (first second third fourth : Money) : Money :=
  (first + second) - (third + fourth)

/-- 第1項: 「…控除した金額に、調整割合を乗じて計算した金額」。
    `adjustmentRate` は caller-established な `TaxRate`。 -/
def trustPensionReserve (first second third fourth : Money) (adjustmentRate : TaxRate) : Money :=
  adjustmentRate.applyFloor (trustPensionBase first second third fourth)

-- ==== positivity / smoke（モデル整合性のみ） ====

/-- 控除額が加算額より小さければ基準額は正。 -/
theorem trustPensionBase_pos_of_lt (first second third fourth : Money)
    (h : third + fourth < first + second) :
    0 < trustPensionBase first second third fourth := by
  unfold trustPensionBase
  exact Nat.sub_pos_of_lt h

/-- 控除額が加算額以上なら基準額は 0（saturating）。 -/
theorem trustPensionBase_eq_zero_of_le (first second third fourth : Money)
    (h : first + second ≤ third + fourth) :
    trustPensionBase first second third fourth = 0 := by
  unfold trustPensionBase
  exact Nat.sub_eq_zero_of_le h

/-- 基準額は加算額を超えない。 -/
theorem trustPensionBase_le_add (first second third fourth : Money) :
    trustPensionBase first second third fourth ≤ first + second := by
  unfold trustPensionBase
  exact Nat.sub_le _ _

/-- 積立金額 = 基準額に調整割合を適用した額（定式そのもの）。 -/
theorem trustPensionReserve_eq (first second third fourth : Money) (adjustmentRate : TaxRate) :
    trustPensionReserve first second third fourth adjustmentRate =
      adjustmentRate.applyFloor (trustPensionBase first second third fourth) := rfl

/-- 調整割合の分子が 0 なら積立金額は 0。 -/
theorem trustPensionReserve_zero_rate (first second third fourth : Money)
    (r : TaxRate) (hr : r.num = 0) :
    trustPensionReserve first second third fourth r = 0 := by
  unfold trustPensionReserve
  exact TaxRate.applyFloor_zero r hr _

/-- 基準額が 0 なら積立金額は 0。 -/
theorem trustPensionReserve_zero_of_base_zero (first second third fourth : Money)
    (r : TaxRate) (h : trustPensionBase first second third fourth = 0) :
    trustPensionReserve first second third fourth r = 0 := by
  unfold trustPensionReserve
  rw [h]
  simp [TaxRate.applyFloor]

/-- 控除額が加算額以上なら（調整割合によらず）積立金額は 0。 -/
theorem trustPensionReserve_eq_zero_of_deduction_ge (first second third fourth : Money)
    (r : TaxRate) (h : first + second ≤ third + fourth) :
    trustPensionReserve first second third fourth r = 0 := by
  exact trustPensionReserve_zero_of_base_zero first second third fourth r
    (trustPensionBase_eq_zero_of_le first second third fourth h)

-- kernel-decide smoke
example : trustPensionBase 0 0 0 0 = 0 := by decide
example : trustPensionBase 10 5 3 2 = 10 := by decide
example : trustPensionBase 10 5 8 9 = 0 := by decide
example : 0 < trustPensionReserve 10 5 3 2 (⟨100, 100, by decide⟩ : TaxRate) := by decide

end JapanTaxLaw.TrustPensionReserve
