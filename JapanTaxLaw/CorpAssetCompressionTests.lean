import JapanTaxLaw.CorpAssetCompression

/-!
# CorpAssetCompression tests — 法人税法施行令 art. 79の2 / 82の3 / 83の4 の退行スモーク

Decidable kernel smoke tests, pinned to
  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121

Each `example` is closed by kernel `decide`; no theorem names are added.
帳簿価額・第一条金額・第二条金額はすべて caller-established、Bool は式に入れず、
丸めは切り捨て（floor）。境界（端数・分母 0・second > first）を重点的に再確認する。
-/

namespace JapanTaxLaw.CorpAssetCompression

open JapanTaxLaw.TaxFinance

-- 共通按分: 分母 0 / 端数 / second > first（79の2 相当）の境界
example : compressionLimit 0 0 0 = 0 := by decide
example : compressionLimit 100 0 7 = 0 := by decide
example : compressionLimit 100 7 0 = 0 := by decide
example : compressionLimit 1 3 2 = 0 := by decide
example : compressionLimit 7 2 1 = 3 := by decide
example : compressionLimit 100 3 1 = 33 := by decide
example : compressionLimit 100 3 2 = 66 := by decide
example : compressionLimit 1000 7 3 = 428 := by decide
example : compressionLimit 100 10 20 = 200 := by decide

-- 第七十九条の二: min を掛けない（second > first で割合 2）
example : art79_2CompressionLimit 100 10 3 = 30 := by decide
example : art79_2CompressionLimit 100 10 20 = 200 := by decide
example : art79_2CompressionLimit 100 0 5 = 0 := by decide
example : art79_2CompressionLimit 100 3 2 = 66 := by decide

-- 第八十二条の三: 「達するまで」= min(second, first)
example : art82_3CompressionLimit 100 10 3 = 30 := by decide
example : art82_3CompressionLimit 100 10 20 = 100 := by decide
example : art82_3CompressionLimit 100 10 10 = 100 := by decide
example : art82_3CompressionLimit 100 3 2 = 66 := by decide
example : art82_3CompressionLimit 100 0 5 = 0 := by decide
example : art82_3CompressionLimit 0 10 3 = 0 := by decide

-- 第八十三条の四: 「達するまで」= min(second, first)
example : art83_4CompressionLimit 100 10 3 = 30 := by decide
example : art83_4CompressionLimit 100 10 20 = 100 := by decide
example : art83_4CompressionLimit 100 3 1 = 33 := by decide
example : art83_4CompressionLimit 100 3 2 = 66 := by decide
example : art83_4CompressionLimit 100 0 5 = 0 := by decide
example : art83_4CompressionLimit 100 10 0 = 0 := by decide

end JapanTaxLaw.CorpAssetCompression
