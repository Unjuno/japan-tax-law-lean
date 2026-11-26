import JapanTaxLaw.TaxFinance

/-
# DoubtfulReceivableDeduction — 税理士法人会計帳簿省令 art.22の3(6)（取立不能債権の控除）

Pinned: law 326M50000040055, revision 326M50000040055_20260901_506M60000040025,
raw `data/raw/326M50000040055_20260901_506M60000040025.law.json`, Article 22-3 item 6.

原文逐語: 「取立不能のおそれのある債権については、事業年度の末日においてその時に取り立てることができないと見込まれる額を控除しなければならない。」

Variables: `receivable : Nat` = 債権額 (円), `estimate : Nat` = 取り立てられないと見込まれる額 (円).
Booked = `receivable - estimate` (Nat 飽和減算, 下限 0). Unit 円, domain Nat.

Scope: ONLY the deduct-and-floor arithmetic. The identification of doubtful
receivables, the valuation date, and other items of art.22-3 are NOT MODELLED.
No `sorry`, `admit`, `axiom`.
-/
namespace JapanTaxLaw.DoubtfulReceivableDeduction

/-- 帳簿価額 = 債権額 − 回収不能見込額（Nat 飽和減算）。 -/
def bookedAmount (receivable estimate : Nat) : Nat :=
  receivable - estimate

theorem neverExceedsReceivable (receivable estimate : Nat) :
    bookedAmount receivable estimate <= receivable := by
  unfold bookedAmount
  omega

theorem zeroWhenEstimateCoversAll (receivable estimate : Nat) :
    receivable <= estimate → bookedAmount receivable estimate = 0 := by
  unfold bookedAmount
  intro h
  omega

theorem monotoneInEstimate (receivable estimate estimate' : Nat) :
    estimate <= estimate' → bookedAmount receivable estimate' <= bookedAmount receivable estimate := by
  unfold bookedAmount
  intro h
  omega

end JapanTaxLaw.DoubtfulReceivableDeduction
