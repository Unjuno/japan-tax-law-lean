import JapanTaxLaw.TaxFinance

/-!
# CorpAssetCompression — 法人税法施行令 art. 79の2 / 82の3 / 83の4（固定資産圧縮限度額の按分計算）L4 スライス

Source (pinned):
  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121
  Amendment enforcement date: 2026-10-01
  原文（担当範囲・正規化済み・UTF-8）: `W_N_corp_order.txt`

  第七十九条の二（国庫補助金等の交付前に取得した固定資産等の圧縮限度額）:
    圧縮限度額 = 固定資産の帳簿価額 × (第二号金額 / 第一号金額)
    第一号 = 当該固定資産の取得又は改良をするために要した金額
    第二号 = その返還を要しないこととなつた当該国庫補助金等の額
    （「達するまで」の上限なし）

  第八十二条の三（工事負担金の交付前に取得した固定資産の圧縮限度額）:
    圧縮限度額 = 帳簿価額 × (第二号金額 / 第一号金額)
    第一号 = 当該固定資産の取得をするために要した金額
    第二号 = 当該交付を受けた金銭の額又は資材の価額のうち、前号に掲げる金額に達するまでの金額

  第八十三条の四（賦課金の納付前に取得した固定資産等の圧縮限度額）:
    圧縮限度額 = 帳簿価額 × (第二号金額 / 第一号金額)
    第一号 = 当該固定資産の取得又は改良をするために要した金額
    第二号 = 当該賦課に基づいて納付された金額のうち前号に掲げる金額に達するまでの金額

Scope & honest boundaries (overclaim 防止):

* 帳簿価額（`bookValue`）・第一条金額（`firstAmount`）・第二条金額（`secondAmount`）は
  **すべて caller-established** とする。本モデルは「交付の確定日」「改良部分の帳簿価額」
  「返還を要しないことの確定」「金銭・資材の交付」「賦課に基づく納付」等の適用判定を
  一切都合せず、与えられた 3 金額に対する按分算術のみを扱う（Bool は式に入れない）。
* 「第二号に掲げる金額の占める割合」は `secondAmount / firstAmount` の有理数を
  `bookValue * secondAmount / firstAmount` の自然数演算で表す。**丸めは切り捨て（floor）**。
* 分母 `firstAmount = 0` のときは 0 を返す安全版とする（原文は第一条金額を分母に
  置くため、ゼロの場合の取扱いを条自体は定めない。ここではモデルの全定義性を優先した
   Defensive な選択であることを明示する）。
* 82の3・83の4 の「前号に掲げる金額に達するまで」は `min secondAmount firstAmount` で
  表現する（第二条金額が第一条金額を超えても割合が 1 を超えないようにする）。
* 79の2 には「達するまで」の文言がないため `min` は適用しない。
* 圧縮額の損金算入（法人税法 42 / 45 / 46 各第一項）の損金算入限度額・縮小課税所得
  等の周辺計算、および他条（79の3 / 82の4 / 83の5 等）は **射程外**。

Pinned evidence in doc-comments only; all theorems here claim properties of
the model only, never of the real legal semantics（誠実性の原則）。
-/

namespace JapanTaxLaw.CorpAssetCompression

open JapanTaxLaw.TaxFinance

/-- 共通の按分関数: 帳簿価額 × (第二条金額 / 第一条金額)。
    第一条金額が 0 なら 0（安全版）、それ以外は自然数除算で端数切り捨て。 -/
def compressionLimit (bookValue firstAmount secondAmount : Money) : Money :=
  if firstAmount = 0 then 0 else bookValue * secondAmount / firstAmount

/-- 第七十九条の二: 国庫補助金等の交付前に取得した固定資産等の圧縮限度額。
    第一条 = 取得又は改良に要した金額、第二条 = 返還を要しないこととなつた国庫補助金等の額。
    「達するまで」条項がないため第二条金額をそのまま使う。 -/
def art79_2CompressionLimit (bookValue firstAmount secondAmount : Money) : Money :=
  compressionLimit bookValue firstAmount secondAmount

/-- 第八十二条の三: 工事負担金の交付前に取得した固定資産の圧縮限度額。
    第一条 = 取得に要した金額、第二条 = 交付金銭・資材の価額のうち第一条に達するまでの金額
    → `min secondAmount firstAmount`。 -/
def art82_3CompressionLimit (bookValue firstAmount secondAmount : Money) : Money :=
  compressionLimit bookValue firstAmount (min secondAmount firstAmount)

/-- 第八十三条の四: 賦課金の納付前に取得した固定資産等の圧縮限度額。
    第一条 = 取得又は改良に要した金額、第二条 = 納付金額のうち第一条に達するまでの金額
    → `min secondAmount firstAmount`。 -/
def art83_4CompressionLimit (bookValue firstAmount secondAmount : Money) : Money :=
  compressionLimit bookValue firstAmount (min secondAmount firstAmount)

-- ==== smoke per def (all kernel-decided) ====

-- `compressionLimit`: 完全一致・端数切り捨て・分母 0・帳簿価額 0
example : compressionLimit 100 10 3 = 30 := by decide
example : compressionLimit 100 3 1 = 33 := by decide
example : compressionLimit 100 3 2 = 66 := by decide
example : compressionLimit 100 0 5 = 0 := by decide
example : compressionLimit 0 10 3 = 0 := by decide
example : compressionLimit 100 10 0 = 0 := by decide
example : compressionLimit 7 2 1 = 3 := by decide
example : compressionLimit 100 10 20 = 200 := by decide

-- `art79_2CompressionLimit`（min なし: second > first でも割合が 1 を超えうる）
example : art79_2CompressionLimit 100 10 3 = 30 := by decide
example : art79_2CompressionLimit 100 10 20 = 200 := by decide
example : art79_2CompressionLimit 100 0 5 = 0 := by decide
example : art79_2CompressionLimit 100 10 10 = 100 := by decide

-- `art82_3CompressionLimit`（min あり: second > first で headroom を切る）
example : art82_3CompressionLimit 100 10 3 = 30 := by decide
example : art82_3CompressionLimit 100 10 20 = 100 := by decide
example : art82_3CompressionLimit 100 3 2 = 66 := by decide
example : art82_3CompressionLimit 100 0 5 = 0 := by decide
example : art82_3CompressionLimit 0 10 3 = 0 := by decide

-- `art83_4CompressionLimit`（min あり）
example : art83_4CompressionLimit 100 10 3 = 30 := by decide
example : art83_4CompressionLimit 100 10 20 = 100 := by decide
example : art83_4CompressionLimit 100 3 2 = 66 := by decide
example : art83_4CompressionLimit 100 0 5 = 0 := by decide
example : art83_4CompressionLimit 100 10 0 = 0 := by decide

end JapanTaxLaw.CorpAssetCompression
