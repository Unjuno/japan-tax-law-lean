import JapanTaxLaw.TaxFinance

/-!
# GiftTax — 相続税法 art. 21-7 (贈与税の税率) L4 tax computation slice

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Scope:

* **Art. 21-7（贈与税の税率）** — 贈与税の額は、前二条の規定による控除後の
  課税価格を次の表の上欄に掲げる金額に区分してそれぞれの金額に同表の下欄に
  掲げる税率を乗じて計算した金額を合計した金額とする。
  The statutory table (百分の十・十五・二十・三十・四十・三十五・五十・五十五は
  脱落しないように番号管理し、
  "二百万円以下" 10%, "三百万円以下" 15%, "四百万円以下" 20%,
  "六百万円以下" 30%, "千万円以下" 40%, "千五百万円以下" 45%,
  "三千万円以下" 50%, それ以上 55%).
* **Art. 21-5（贈与税の基礎控除）** — 贈与税については、課税価格から六十万円
  を控除する。 (Basic deduction: 600,000 yen.)
* Art. 21-13 imposes a flat 20% rate on 相続時精算課税適用者; NOT modelled
  here — only the normal-rate table.

Art. 21-7 computation technique: the amount AFTER art. 21-5's ¥600,000
deduction is split into the bracketed bands, each band's portion taxed at
the band rate, summed. Pin the deduct small. (Reference: "前二条の規定による
控除後の課税価格" — art. 21-5 and art. 21-6, where implemented.)

Scope limits (not modelled here):

* Art. 21-5 deduction is modelled (above); art. 21-6 配偶者控除 (居住用不動産
  ⇒ 2,000万円) and art. 21-9+ (相続時精算課税) and art. 21-13 (flat 20%) are
  out of scope.
* 贈与税の課税価格計算 (art. 21-2〜21-4), Gift-Splash provisions, 通年, and
  credit for overseas taxes (art. 21-8) are out of scope.
* The bracket upper limits ¥2,000,000 / ¥3,000,000 / ¥4,000,000 /
  ¥6,000,000 / ¥10,000,000 / ¥15,000,000 / ¥30,000,000 are pinned to the
  2026-04-01 revision.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Art. 21-5 基礎控除 (贈与税): ¥600,000 applied to 課税価格. -/
def giftBasicDeduction : Money := 600_000

/-- The art. 21-7 rate table as (inclusive upper edge, rate pct). -/
structure GiftRateBand where
  limit : Money
  pct : Nat
  deriving DecidableEq, Repr

def giftRateTable : List GiftRateBand :=
  [ { limit := 2_000_000, pct := 10 },
    { limit := 3_000_000, pct := 15 },
    { limit := 4_000_000, pct := 20 },
    { limit := 6_000_000, pct := 30 },
    { limit := 10_000_000, pct := 40 },
    { limit := 15_000_000, pct := 45 },
    { limit := 30_000_000, pct := 50 }
    -- excess: 55%
    ]

/-- Top rate for the open band. -/
def giftTopRate : TaxRate := ⟨55, 100, by decide⟩

/-- Helper: the art. 21-7 per-portion computation over an arbitrary rate-band
    table and lower offset `lo`. Extracted at top level so the same computation
    can be reused by the special-rate tables (租税特別措置法) with their own
    `GiftRateBand` list; semantics identical to the previous inlined `go`. -/
def portionTaxGo (t : List GiftRateBand) (lo x : Money) : Money :=
  let rec go (lo : Money) : List GiftRateBand → Money
    | [] => giftTopRate.applyFloor (x - lo)
    | b :: rest =>
        (⟨b.pct, 100, by decide⟩ : TaxRate).applyFloor
          (min x b.limit - min x lo) + go b.limit rest
  go lo t

def giftPortionTax (x : Money) : Money := portionTaxGo giftRateTable 0 x

/-- 贈与税 — art. 21-7 total. Inputs are taxable gift value (pre-deduction);
    the function applies art. 21-5's ¥600,000 basic deduction first. -/
def giftTax (x : Money) : Money :=
  giftPortionTax (if x ≤ giftBasicDeduction then 0 else x - giftBasicDeduction)

/-- Art. 21-5 leaves a zero tax when the gift is within the basic deduction. -/
theorem giftTax_zero_below_deduction : giftTax 600_000 = 0 := by decide

/-- Art. 21-7 per-portion tax at zero input is zero. -/
theorem giftPortionTax_zero : giftPortionTax 0 = 0 := by decide

/-- Tax increases from ¥0 baseline with each boundary band. Boundaries pinned
    to the statutory table from the pinned revision. -/
example : giftPortionTax 2_000_000 = 200_000 := by decide
example : giftPortionTax 3_000_000 = 350_000 := by decide
example : giftPortionTax 4_000_000 = 550_000 := by decide
example : giftPortionTax 6_000_000 = 1_150_000 := by decide
example : giftPortionTax 10_000_000 = 2_750_000 := by decide
example : giftPortionTax 15_000_000 = 5_000_000 := by decide
example : giftPortionTax 30_000_000 = 12_500_000 := by decide
example : giftPortionTax 40_000_000 = 18_000_000 := by decide

/-- Gift tax: — art. 21-7 applied to the amount above art. 21-5's 600,000 deduction. -/
example : giftTax 5_000_000 = giftPortionTax (5_000_000 - 600_000) := by decide

end JapanTaxLaw
