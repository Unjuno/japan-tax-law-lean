import JapanTaxLaw.CorpAssetCompression

/-!
# CorpAssetCompressionSpec — 法人税法施行令 art. 79の2 / 82の3 / 83の4 の独立整数定式

Source (pinned; identical to CorpAssetCompression.lean):
  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121

Independent restatement of the three statutory apportionment formulas as plain
Nat arithmetic, **not** reusing the implementation's `compressionLimit` helper:

  art. 79の2 — 帳簿価額 × (第二条 / 第一条)
               → if first = 0 then 0 else book * second / first
  art. 82の3 — 帳簿価額 × (min 第二条 第一条 / 第一条)  （「達するまで」）
  art. 83の4 — 帳簿価額 × (min 第二条 第一条 / 第一条)  （「達するまで」）

All three amounts (帳簿価額・第一条金額・第二条金額) are caller-established in
both the implementation and this spec; no eligibility Bool enters any formula.
Rounding is floor (切り捨て). Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw.CorpAssetCompression

open JapanTaxLaw.TaxFinance

/-- 独立整数定式（実装の `compressionLimit` を呼ばない）。 -/
def specCompressionLimit (bookValue firstAmount secondAmount : Money) : Money :=
  if firstAmount = 0 then 0 else bookValue * secondAmount / firstAmount

/-- Spec, 第七十九条の二: 達するまで条項なし。 -/
def specArt79_2CompressionLimit (bookValue firstAmount secondAmount : Money) : Money :=
  specCompressionLimit bookValue firstAmount secondAmount

/-- Spec, 第八十二条の三: 「達するまで」を min で表現。 -/
def specArt82_3CompressionLimit (bookValue firstAmount secondAmount : Money) : Money :=
  specCompressionLimit bookValue firstAmount (min secondAmount firstAmount)

/-- Spec, 第八十三条の四: 「達するまで」を min で表現。 -/
def specArt83_4CompressionLimit (bookValue firstAmount secondAmount : Money) : Money :=
  specCompressionLimit bookValue firstAmount (min secondAmount firstAmount)

-- 独立定式の参照点（kernel-decided）
example : specCompressionLimit 100 3 2 = 66 := by decide
example : specCompressionLimit 100 0 5 = 0 := by decide
example : specArt79_2CompressionLimit 100 10 20 = 200 := by decide
example : specArt82_3CompressionLimit 100 10 20 = 100 := by decide
example : specArt83_4CompressionLimit 100 3 2 = 66 := by decide

/-- 実装と独立定式を比較する呼出元確立ポイント（端数・分母 0・second > first を含む）。 -/
private def agreePoints : List (Money × Money × Money) :=
  [ (0, 0, 0), (100, 0, 5), (100, 10, 0), (100, 10, 3), (100, 3, 1),
    (100, 3, 2), (100, 10, 10), (100, 10, 20), (7, 2, 1), (1, 3, 2),
    (1000, 7, 3), (999, 1000, 1), (100_000, 3, 2), (5, 7, 9) ]

private def agreeOn (f g : Money → Money → Money → Money) : Bool :=
  agreePoints.all fun t => f t.1 t.2.1 t.2.2 == g t.1 t.2.1 t.2.2

/-- 共通按分関数の実装 ≡ 独立定式（全ポイントで一致するか）。 -/
def agreeCompressionLimit : Bool := agreeOn compressionLimit specCompressionLimit

/-- 第七十九条の二の実装 ≡ 独立定式。 -/
def agreeArt79_2CompressionLimit : Bool :=
  agreeOn art79_2CompressionLimit specArt79_2CompressionLimit

/-- 第八十二条の三の実装 ≡ 独立定式。 -/
def agreeArt82_3CompressionLimit : Bool :=
  agreeOn art82_3CompressionLimit specArt82_3CompressionLimit

/-- 第八十三条の四の実装 ≡ 独立定式。 -/
def agreeArt83_4CompressionLimit : Bool :=
  agreeOn art83_4CompressionLimit specArt83_4CompressionLimit

theorem agreeCompressionLimit_true : agreeCompressionLimit = true := by decide
theorem agreeArt79_2CompressionLimit_true : agreeArt79_2CompressionLimit = true := by decide
theorem agreeArt82_3CompressionLimit_true : agreeArt82_3CompressionLimit = true := by decide
theorem agreeArt83_4CompressionLimit_true : agreeArt83_4CompressionLimit = true := by decide

end JapanTaxLaw.CorpAssetCompression
