import JapanTaxLaw.GiftTax

/-!
# GiftTax spec — independent statement of art. 21-7

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7

Independent restatement of art. 21-7 (贈与税の税率) + art. 21-5:
  - Art. 21-7 progressive rate table applied to 課税価格
  - Art. 21-5: ¥600,000 basic deduction

Spec: closed form per taxable residual amount.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Independent restatement of the art. 21-7 per-portion tax. -/
def specGiftPortion (x : Money) : Money :=
  if x ≤ 2_000_000 then x * 10 / 100
  else if x ≤ 3_000_000 then 200_000 + (x - 2_000_000) * 15 / 100
  else if x ≤ 4_000_000 then 350_000 + (x - 3_000_000) * 20 / 100
  else if x ≤ 6_000_000 then 550_000 + (x - 4_000_000) * 30 / 100
  else if x ≤ 10_000_000 then 1_150_000 + (x - 6_000_000) * 40 / 100
  else if x ≤ 15_000_000 then 2_750_000 + (x - 10_000_000) * 45 / 100
  else if x ≤ 30_000_000 then 5_000_000 + (x - 15_000_000) * 50 / 100
  else 12_500_000 + (x - 30_000_000) * 55 / 100

-- Boundary cases, all kernel `decide`d.
example : specGiftPortion 0 = 0 := by decide
example : specGiftPortion 2_000_000 = 200_000 := by decide
example : specGiftPortion 3_000_000 = 350_000 := by decide
example : specGiftPortion 4_000_000 = 550_000 := by decide
example : specGiftPortion 6_000_000 = 1_150_000 := by decide
example : specGiftPortion 10_000_000 = 2_750_000 := by decide
example : specGiftPortion 15_000_000 = 5_000_000 := by decide
example : specGiftPortion 30_000_000 = 12_500_000 := by decide
example : specGiftPortion 40_000_000 = 18_000_000 := by decide

/-- Spec ≡ impl on a sample grid, kernel-verified. -/
def giftCheckGrid : Bool :=
  let rec go (k : Nat) : Bool :=
    match k with
    | 0 => specGiftPortion 0 == giftPortionTax 0
    | k + 1 =>
        let x := (k + 1) * 850_000
        go k && (specGiftPortion x == giftPortionTax x)
  go 50

set_option maxRecDepth 2048
example : giftCheckGrid = true := by decide

/-- Art. 21-5 basic deduction restated. -/
def specBasicDeduction : Money := 600_000
example : specBasicDeduction = 600_000 := by decide
example : specBasicDeduction = giftBasicDeduction := by decide

end JapanTaxLaw
