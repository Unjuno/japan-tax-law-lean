import JapanTaxLaw.TaxFinance

/-
# LocalCorpRate93_907 — 地方法人税法 第二十四条の三（税率九百七分の九十三）

Pinned source:
  Law id: 426AC0000000011
  Revision: 426AC0000000011_20260401_507AC0000000013
  Raw snapshot: data/raw/426AC0000000011_20260401_507AC0000000013.law.json
  sha256: 263518e159c906bc45a83fe41ed57b5816387363e03d97e2697da5ef71c14ed2
  Statutory article: 第二十四条の三 (raw JSON Article attr.Num = "24_3")

原文逐語（pinned, 一字一句改変なし）:
  「国際最低課税額等に係る特定基準法人税額に対する地方法人税の額は、各課税対象会計年度の課税標準国際最低課税法人税額に九百七分の九十三の税率を乗じて計算した金額とする。」

Variable contract:
  base : Nat = 課税標準国際最低課税法人税額 (単位 円, whole yen).
  rate = 九百七分の九十三 = 93/907 (明示的な法定分数).
  result : Nat = 地方法人税の額 (単位 円, whole yen), floor division.

Computation (原文の「乗じて計算した」を自然数除算として厳密表現):
  taxFor base = base * 93 / 907   (Nat の切り捨て除算)

Scope / BY-DESIGN:
  - 本スライスは明示的な法定分数 九百七分の九十三 = 93/907 のみを扱う。
  - Nat の乗算→除算は切捨て（floor division）を与える。原文は金額（円）を返すため、
    切捨てをそのまま採用する。厳密性が必要な場合は base が 907 で割り切れる
    （例: base = 907, 1814）場合に限定して解釈する — BY-DESIGN / CONFIRMED。
  - 国際最低課税額等の算定、課税対象会計年度の判定、他の条文・号は NOT MODELLED。
  - 本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalCorpRate93_907

/-- 九十三 — the statutory rate numerator = 93. -/
def rateNumerator : Nat := 93

/-- 九百七 — the statutory rate denominator = 907. -/
def rateDenominator : Nat := 907

/-- 地方法人税の額 = 課税標準国際最低課税法人税額 * 93 / 907 (Nat floor division). -/
def taxFor (base : Nat) : Nat :=
  base * rateNumerator / rateDenominator

/-- 課税標準 907 円 → 地方法人税額 93 円 (93/907, exact). -/
example : taxFor 907 = 93 := by decide

/-- 課税標準 1814 円 (= 2 * 907) → 地方法人税額 186 円 (exact). -/
example : taxFor 1814 = 186 := by decide

/-- 課税標準 0 円 → 0 円. -/
example : taxFor 0 = 0 := by decide

/-- 課税標準 1 円 → 0 円 (floor division: 93/907 = 0). -/
example : taxFor 1 = 0 := by decide

/-- 定数値. -/
example : rateNumerator = 93 := by rfl
example : rateDenominator = 907 := by rfl

end JapanTaxLaw.LocalCorpRate93_907
