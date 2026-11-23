/-\!
# MiningTaxMonthlyProration — 地方税法 第百八十三条（鉱区税の月割課税）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000226_20261101_508AC0000000002.law.json Article:183

原文の規範構造（対象2単位）:
- 第1項：賦課期日後に納税義務が発生した者 → 発生した月の「翌月から」月割で課税。
- 第2項：賦課期日後に納税義務が消滅した者 → 消滅した月「まで」月割で課税。
- 第3項：鉱区の承継があつた場合は前納税者の納税を後者とみなし、前2項は適用しない。

変数: `startMonth` 課税開始月, `endMonth` 課税終了月, `succession` 鉱区承継の有無。
月割課税月数: 開始は 12 - startMonth (0-indexed), 消滅は endMonth (1-indexed)。
具体的な年税額・月割計算は NOT MODELLED。
-/
namespace JapanTaxLaw.MiningTaxMonthlyProration

-- 開始：翌月から課税 → 月数 = 12 - startMonth（startMonth は 0-11 の 0-indexed）
def monthsFromNextMonth (startMonth : Nat) : Nat := 12 - startMonth
theorem jan_start_12_months : monthsFromNextMonth 0 = 12 := by rfl
theorem dec_start_1_month : monthsFromNextMonth 11 = 1 := by rfl

-- 消滅：消滅月まで課税 → 月数 = endMonth（1-indexed）
def monthsUntilExtinction (endMonth : Nat) : Nat := endMonth
theorem jan_end_1_month : monthsUntilExtinction 1 = 1 := rfl
theorem dec_end_12_months : monthsUntilExtinction 12 = 12 := rfl

-- 承継があれば月割特例は適用しない（前納税者の納税を後者とみなす）
def monthlyApplies (succession : Bool) : Bool := !succession
theorem no_succession_monthly : monthlyApplies false = true := by decide
theorem succession_no_monthly : monthlyApplies true = false := by decide

def miningTaxMonthlyProrationDeclared : Bool := true
theorem mining_tax_monthly_proration_is_declaration : miningTaxMonthlyProrationDeclared = true := rfl

end JapanTaxLaw.MiningTaxMonthlyProration
