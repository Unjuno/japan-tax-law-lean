import JapanTaxLaw.TaxFinance

/-!
# ExplorationReserve — 租税特別措置法施行規則 art.9（探鉱準備金）bounded L4 モデル

Sources (pinned):
  Law id: 332M50000040015
  Revision: 332M50000040015_20261101_507M60000040026
  Raw snapshot: data/raw/332M50000040015_20261101_507M60000040026.law.json
  Article Num 9, flat/normalized leaf text 484 chars, U+3000 count 0.

原文逐語（pinned 本文から一字も変えず抽出）:
  「施行令第十四条第二項第三号に規定する財務省令で定める金額は、同号に規定する物品の
    販売による収入金額（...鉱物等がある場合には、当該鉱物等の取得に要した金額を控除した
    金額）に、第一号に掲げる金額が第二号に掲げる金額のうちに占める割合を乗じて計算した
    金額（...）とする。」

Computation（原文逐語から導出。coordinator の数式は信じていない）:
  base   = 販売収入金額 − 鉱物等取得金額（saturating）
  ratio  = 第一号額 / 第二号額（分母 0 → 0 の安全版）
  amount = base × first / second（「割合を乗じて」を乗算先行で模型化）

  ※ art.148 で coordinator が誤って `+` を導入し CONFIRMED 欠陥となった失敗を踏まえ、
    本条の「占める割合を乗じて」は乗算である点を原文逐語から確認した。

Scope & honest boundaries:
  * 販売収入額・取得金額・一号額・二号額は caller-established Money。
  * 「著しく異なるときは通常受けるべき金額」の選択は caller-established（Bool は金額式に入れない）。
  * 法第二十二条第一項の鉱物定義、選鉱後価格の具体的算定は NOT MODELLED。
-/

namespace JapanTaxLaw.ExplorationReserve

open JapanTaxLaw.TaxFinance

/-- 販売収入金額から鉱物等の取得金額を控除した額（saturating）。 -/
def netSalesAmount (sales acquisition : Money) : Money :=
  if acquisition ≤ sales then sales - acquisition else 0

/-- 第一号額が第二号額のうちに占める割合（整数除算、分母 0 → 0）。 -/
def firstOverSecond (first second : Money) : Money :=
  if second = 0 then 0 else first / second

/-- 探鉱準備金として財務省令で定める金額 = 正味売上 × 一号額 / 二号額。 -/
def explorationReserve (sales acquisition first second : Money) : Money :=
  let base := netSalesAmount sales acquisition
  if second = 0 then 0 else base * first / second

-- ==== verified facts (model properties only) ====

/-- 取得金額が販売額を超えれば 0（saturating）。 -/
example : netSalesAmount 100 150 = 0 := by decide
example : netSalesAmount 100 40 = 60 := by decide

/-- 分母 0 → 0。 -/
example : explorationReserve 1000 0 5 0 = 0 := by decide
/-- 一号 0 → 0。 -/
example : explorationReserve 1000 0 0 10 = 0 := by decide
/-- 基本: base=1000, first=1, second=2 → 500。 -/
example : explorationReserve 1000 0 1 2 = 500 := by decide
/-- 取得額控除: base=1000−200=800, 1/2 → 400。 -/
example : explorationReserve 1000 200 1 2 = 400 := by decide
/-- 端数切り捨て: base=100, first=1, second=3 → 33。 -/
example : explorationReserve 100 0 1 3 = 33 := by decide

theorem netSalesAmount_le_sales (sales acquisition : Money) :
    netSalesAmount sales acquisition ≤ sales := by
  unfold netSalesAmount
  by_cases h : acquisition ≤ sales
  · rw [ite_eq_left h]; exact Nat.sub_le _ _
  · rw [ite_eq_right h]; exact Nat.zero_le _

theorem explorationReserve_zero_denominator (sales acquisition first : Money) :
    explorationReserve sales acquisition first 0 = 0 := by
  unfold explorationReserve
  simp

end JapanTaxLaw.ExplorationReserve
