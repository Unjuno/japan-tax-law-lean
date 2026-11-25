import JapanTaxLaw.TaxFinance

/-!
# DecimalPercentRates — 小数税率（百分の〇・〇一単位）の厳密算定

Japanese tax statutes frequently state rates with a decimal 百分のX・Y
notation (e.g. 百分の六・二四 = 6.24%). This module computes those rates as
exact integer fractions with floor, recording the numerator and denominator
used. The rates modelled here come from pinned 附則/施行令 provisions:

* 1.35%  (百分の一・三五)  — 揮発油税 控除数量
* 40.85% (百分の四十・八五) — 環境性能割 交付金算定
* 44.65% (百分の四十四・六五) — 環境性能割 交付金算定（改正後）
* 6.24%  (百分の六・二四)  — 消費税 軽減税率
* 1.4%   (百分の一・四)   — 特別土地保有税 標準税率

Eligibility, the surrounding formulas and the 読替え directions are
caller-established and NOT modelled. Not legal advice.
-/

namespace JapanTaxLaw.DecimalPercentRates

/-- 1.35% = 135/10000 of `quantity`. -/
def deduct135 (quantity : Nat) : Nat := quantity * 135 / 10_000

/-- 40.85% = 4085/10000 of `amount`. -/
def rate4085 (amount : Nat) : Nat := amount * 4085 / 10_000

/-- 44.65% = 4465/10000 of `amount`. -/
def rate4465 (amount : Nat) : Nat := amount * 4465 / 10_000

/-- 6.24% = 624/10000 of `base`. -/
def rate624 (base : Nat) : Nat := base * 624 / 10_000

/-- 1.4% = 14/1000 of `amount`. -/
def rate14 (amount : Nat) : Nat := amount * 14 / 1_000

example : deduct135 10_000 = 135 := by decide
example : rate4085 10_000 = 4_085 := by decide
example : rate4465 10_000 = 4_465 := by decide
example : rate624 10_000 = 624 := by decide
example : rate14 1_000 = 14 := by decide

end JapanTaxLaw.DecimalPercentRates
