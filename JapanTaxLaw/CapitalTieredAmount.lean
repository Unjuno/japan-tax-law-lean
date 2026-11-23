import JapanTaxLaw.TaxFinance

/-
# CapitalTieredAmount — 過疎地域の持続的発展の支援に関する特別措置法第二十四条の地方税の課税免除又は不均一課税に伴う措置が適用される場合等を定める省令 第一条（資本金の額等に応じた三段階の要件額）

Pinned source:
  Law id: 503M60000008031
  Official title: 過疎地域の持続的発展の支援に関する特別措置法第二十四条の地方税の課税免除又は不均一課税に伴う措置が適用される場合等を定める省令
  Law type: MinisterialOrdinance (省令)
  Revision: 503M60000008031_20240401_506M60000008035
  Raw snapshot: data/raw/503M60000008031_20240401_506M60000008035.law.json
  sha256: d732e70d8f54eb1ce6cee566a563ff85408e79a1d6360f757c4f228fe48c3f41
  Article: 第一条 (e-Gov Num = 1)

原文逐語（pinned, 一字一句改変なし）:
  「五百万円（資本金の額等が五千万円超一億円以下である法人が行うものにあっては千万円とし、資本金の額等が一億円超である法人が行うものにあっては二千万円とする。）」

Variable contract:
  capital : Nat — 資本金の額等 (円)
  requiredAmount capital : Nat — 要件額 (円)
  baseAmount = 5000000  円 (五百万円) — default / lowest tier
  midCapital = 50000000 円 (五千万円) — lower bracket boundary
  highCapital = 100000000 円 (一億円) — upper bracket boundary
  midAmount = 10000000  円 (千万円) — for 五千万円超一億円以下
  highAmount = 20000000 円 (二千万円) — for 一億円超
  requiredAmount capital =
      5000000   if capital <= 50000000  (五千万円以下 — includes exactly 50M)
      10000000  if 50000000 < capital <= 100000000
      20000000  if 100000000 < capital
  「五千万円超」is STRICTLY above 50,000,000, so exactly 50,000,000 stays in
  the base tier. 「一億円以下」is INCLUSIVE at 100,000,000, so exactly
  100,000,000 stays in the mid tier. Both upper bounds are inclusive.

Scope: only the explicit three-tier amount structure by capital is modelled.
Other conditions, procedures, other articles and non-Nat amounts are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CapitalTieredAmount

/-- 五百万円 — base (default) tier amount. -/
def baseAmount : Nat := 5000000

/-- 五千万円 — lower bracket boundary (inclusive upper bound of base tier). -/
def midCapital : Nat := 50000000

/-- 一億円 — upper bracket boundary (inclusive upper bound of mid tier). -/
def highCapital : Nat := 100000000

/-- 千万円 — amount for the 五千万円超一億円以下 tier. -/
def midAmount : Nat := 10000000

/-- 二千万円 — amount for the 一億円超 tier. -/
def highAmount : Nat := 20000000

/-- 三段階の要件額: ≤50M → 5M; 50M<capital≤100M → 10M; >100M → 20M. -/
def requiredAmount (capital : Nat) : Nat :=
  if capital <= midCapital then
    baseAmount
  else if capital <= highCapital then
    midAmount
  else
    highAmount

theorem baseAmount_value : baseAmount = 5000000 := rfl
theorem midCapital_value : midCapital = 50000000 := rfl
theorem highCapital_value : highCapital = 100000000 := rfl
theorem midAmount_value : midAmount = 10000000 := rfl
theorem highAmount_value : highAmount = 20000000 := rfl

theorem requiredAmount_zero : requiredAmount 0 = 5000000 := by decide
theorem requiredAmount_at50M : requiredAmount 50000000 = 5000000 := by decide
theorem requiredAmount_above50M : requiredAmount 50000001 = 10000000 := by decide
theorem requiredAmount_at100M : requiredAmount 100000000 = 10000000 := by decide
theorem requiredAmount_above100M : requiredAmount 100000001 = 20000000 := by decide

end JapanTaxLaw.CapitalTieredAmount
