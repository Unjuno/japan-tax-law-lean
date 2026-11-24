import JapanTaxLaw.TaxFinance

/-!
# SakeTieredAmount — 酒税法 art. 23(1)三 段額

Pinned source: law 328AC0000000006, revision
`328AC000000006_20260525_506AC0000000052`, snapshot
`data/raw/328AC000000006_20260525_506AC0000000052.law.json`.

Normative unit: `NORM|357718120dc5d73305dba5f4884ee941c800423843672b294650d98af017cc47`
Verbatim: 「二十万円（アルコール分が二十一度以上のものにあつては、二十万円に
アルコール分が二十度を超える一度ごとに一万円を加えた金額）」

Scope: the amount formula keyed to alcohol degree. `degree` is an alcohol-
content degree (unit: degrees), `baseYen` and `perDegreeYen` are yen. The
quantity/課税標準 to which this amount applies is caller-established and is
not modelled here. The 「二十一度以上」 trigger is inclusive.
-/
namespace JapanTaxLaw.SakeTieredAmount

/-- 二十万円, in yen. -/
def baseYen : Nat := 200_000
/-- 一万円 per degree above 二十度. -/
def perDegreeYen : Nat := 10_000
/-- The trigger 「二十一度以上」 (inclusive). -/
def triggerDegree : Nat := 21
/-- The reference degree 「二十度を超える」. -/
def referenceDegree : Nat := 20

/-- Tiered amount as written: above the trigger, add ¥10,000 per degree
    exceeding 20 degrees; otherwise the flat ¥200,000. -/
def tieredAmount (degree : Nat) : Nat :=
  if triggerDegree <= degree then
    baseYen + (degree - referenceDegree) * perDegreeYen
  else baseYen

theorem at_20 : tieredAmount 20 = 200_000 := by decide
theorem at_21 : tieredAmount 21 = 210_000 := by decide
theorem at_22 : tieredAmount 22 = 220_000 := by decide
theorem at_30 : tieredAmount 30 = 300_000 := by decide

end JapanTaxLaw.SakeTieredAmount
