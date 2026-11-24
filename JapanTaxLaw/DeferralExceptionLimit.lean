import JapanTaxLaw.TaxFinance

/-!
# DeferralExceptionLimit — 相続税法 art. 38(4) ただし書

Pinned source: law 325AC0000000073, revision
`325AC0000000073_20260401_506AC0000000008`, snapshot
`data/raw/325AC0000000073_20260401_506AC0000000008.law.json`.

Normative unit: `NORM|6c27921434c59ba57a352e0bf3f7ff011871be1423b177bd348091a1ab4d0156`
Verbatim: 「ただし、その延納税額が百万円以下で、かつ、その延納期間が三年以下
である場合は、この限りでない。」 — the exception to the preceding rule when
BOTH the deferred tax is ≤ ¥1,000,000 AND the deferral period is ≤ 3 years.

Dimensions: `deferredTaxYen` is money in yen (Nat); `deferralYears` is a
duration in years (Nat). They are NOT interchangeable. The preceding rule's
content (what 「この限りでない」 negates) is a separate unit and is not modelled
by this predicate.
-/
namespace JapanTaxLaw.DeferralExceptionLimit

/-- 百万円, in yen. -/
def amountCapYen : Nat := 1_000_000
/-- 三年, in years. -/
def periodCapYears : Nat := 3

/-- Exception applies iff both statutory caps are satisfied. -/
def exceptionApplies (deferredTaxYen : Nat) (deferralYears : Nat) : Bool :=
  decide (deferredTaxYen <= amountCapYen && deferralYears <= periodCapYears)

theorem amount_at_cap : exceptionApplies 1_000_000 3 = true := by decide
theorem amount_over_cap : exceptionApplies 1_000_001 3 = false := by decide
theorem period_over_cap : exceptionApplies 1_000_000 4 = false := by decide
theorem both_over : exceptionApplies 1_000_001 4 = false := by decide

end JapanTaxLaw.DeferralExceptionLimit
