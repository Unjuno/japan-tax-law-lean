import JapanTaxLaw.InheritanceSuccessiveDeduction

/-!
# InheritanceSuccessiveDeduction spec — independent statement of art. 20

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7

Independent restatement of the art. 20 （相次相続控除） three-factor
discount formula:

  一 r1 = min(100_000, ratio × 100_000) — art. 20(1): 当該割合が百分の百を超える場合には、
        百分の百の割合. denominator = 第一次相続により取得した財産の価額（課税価格計算の
        基礎に算入された部分に限る。）から当該財産に係る相続税額を控除した金額.
        denominator = 0 の場合は割合が定義されない。モデルは 100_000（百分の百）を
        割り当てる modeling candidate。
  二 r2 = thisHeir / secondTotalInherited — art. 20(2): 法文は割合の上限を規定しない
        （この相続人の取得は第二次相続の取得の一部）。本質的に r2 ≤ 100_000。
        不正な入力（thisHeir > secondTotalInherited）では割合が 100% を超えうるが、
        法文に上限の規定はないため、この spec では cap を付けない。
  三 r3 = max(0, (10 - gapYears) / 10); gap ≥ 10 ⇒ 0

  deduction = firstTaxPaid × r1 × r2 × r3
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: r1 — art. 20 第一号: 第一次相続の課税価格計算の基礎に算入された財産の価額から
    相続税額を控除した金額に対する割合（百分の百を超える場合には、百分の百の割合）。 -/
def specSuccessiveRate1 (secondTotalInherited firstNetEstate : Money) : Money :=
  if firstNetEstate = 0 then 100_000
  else Nat.min 100_000 ((secondTotalInherited * 100_000) / firstNetEstate)

/-- Spec: r2 — art. 20 第二号: この相続人の取得した財産の価額の第二次相続の全取得の価額に
    対する割合（上限規定なし）。 -/
def specSuccessiveRate2 (thisHeir secondTotalInherited : Money) : Money :=
  if secondTotalInherited = 0 then 0
  else (thisHeir * 100_000) / secondTotalInherited

/-- Spec: r3 — art. 20 第三号: 第一次相続開始の時から第二次相続開始の時までの期間に
    相当する年数を十年から控除した年数の十年に対する割合。 -/
def specSuccessiveRate3 (yearsElapsed : Nat) : Money :=
  if yearsElapsed >= 10 then 0
  else ((10 - yearsElapsed) * 100_000) / 10

example : specSuccessiveRate1 0 0 = 100_000 := by decide
example : specSuccessiveRate1 100 100 = 100_000 := by decide
example : specSuccessiveRate1 200 100 = 100_000 := by decide
example : specSuccessiveRate1 50 100 = 50_000 := by decide
example : specSuccessiveRate1 1000 100 = 100_000 := by decide

example : specSuccessiveRate2 40 100 = 40_000 := by decide
example : specSuccessiveRate2 200 100 = 200_000 := by decide
example : specSuccessiveRate3 2 = 80_000 := by decide
example : specSuccessiveRate3 5 = 50_000 := by decide
example : specSuccessiveRate3 7 = 30_000 := by decide
example : specSuccessiveRate3 10 = 0 := by decide
example : specSuccessiveRate3 11 = 0 := by decide

end JapanTaxLaw
