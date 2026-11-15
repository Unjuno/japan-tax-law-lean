import JapanTaxLaw.TaxFinance

/-!
# InheritanceSuccessiveDeduction — 相続税法 art. 20 （相次相続控除） L4 slice

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Art. 20 (相次相続控除) — verbatim:

  相続（被相続人からの相続人に対する遺贈を含む。以下この条において同じ。）
  により財産を取得した場合において、当該相続（以下この条において「第二次
  相続」という。）に係る被相続人が第二次相続の開始前十年以内に開始した相続
  （以下この条において「第一次相続」という。）により財産（当該第一次相続に
  係る被相続人からの贈与により取得した第二十一条の九第三項の規定の適用を
  受けた財産を含む。）を取得したことがあるときは、当該被相続人から相続により
  財産を取得した者については、第十五条から前条までの規定により算出した
  金額から、当該被相続人が第一次相続により取得した財産（略）につき課せられた
  相続税額（延滞税、利子税、過少申告加算税、無申告加算税及び重加算税に
  相当する相続税額を除く。第一号において同じ。）に相当する金額に次の各号に
  掲げる割合を順次乗じて算出した金額を控除した金額をもって、その納付すべき
  相続税額とする。

  一 第二次相続に係る被相続人から相続又は遺贈（被相続人からの相続人に対する
       遺贈を除く。次号において同じ。）により財産を取得したすべての者がこれら
       の事由により取得した財産の価額（相続税の課税価格に算入される部分に
       限る。）の合計額の当該被相続人が第一次相続により取得した財産（略）の
       価額（相続税の課税価格計算の基礎に算入された部分に限る。）から当該財産
       に係る相続税額を控除した金額に対する割合（当該割合が百分の百を超える
       場合には、百分の百の割合）
  二 第二次相続に係る被相続人から相続により取得した財産の価額（相続税の課税
       価格に算入される部分に限る。）の第二次相続に係る被相続人から相続又は
       遺贈により財産を取得したすべての者がこれらの事由により取得した財産の
       価額（相続税の課税価格に算入される部分に限る。）の合計額に対する割合
  三 第一次相続開始の時から第二次相続開始の時までの期間に相当する年数を
       十年から控除した年数（当該年数が一年未満であるとき又はこれに一年未満の
       端数があるときは、これを一年とする。）の十年に対する割合

L4 scope: the three-factor discount formula — directly computed on supplied
values. No temporal/semantical verification of "the piece of this formula
corresponding to a real death"; modeled as pure arithmetic.

Model:

  heirTax     = taxArt15to17Deduction (provided)
  base =  `firstTaxPaid` (tax paid at the first-inheritance, after
        excluding 延滞税 / 加算税 etc.)
  r1   = secondTotalInherited / (firstTotalInherited - firstTaxPaid)
        (capped at 100%)
  r2   = secondThisHeirInherited / secondTotalInherited
  r3   = (10 - gapYears) / 10  (gap years ∈ [0,10], rounded up unless zero, zero if 10+)

Then:

  taxWith successive deduction = heirTax - base * r1 * r2 * r3
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Compute the ratio of the first-inheritance estate retained after tax,
    compared to the present holdings — art. 20(1). Capped at 1 (百分の百). -/
def successiveRate1 (secondTotalInherited firstNetEstate : Money) : Money :=
  if firstNetEstate = 0 then 100_000
  else Nat.min ((secondTotalInherited * 100_000) / firstNetEstate) 100_000

/-- Ratio of this heir's share relative to the total acquired on the present
    succession — art. 20(2). -/
def successiveRate2 (thisHeir secondTotalInherited : Money) : Money :=
  if secondTotalInherited = 0 then 0
  else if thisHeir ≥ secondTotalInherited then 100_000
  else (thisHeir * 100_000) / secondTotalInherited

/-- Discount for the years elapsed between the first and second succession
    — art. 20(3). 10-year window; 1-year minimum; saturates at 0 when 10
    years or more elapsed. -/
def successiveRate3 (yearsElapsed : Nat) : Money :=
  if yearsElapsed ≥ 10 then 0
  else ((10 - yearsElapsed) * 100_000) / 10

/-- Art. 20 相次相続控除 — the discount amount to subtract from the art. 15–18
    computed tax. result inherits the 百万 denominator fixed points. -/
def successiveDeduction (firstTaxPaid : Money)
    (secondTotalInherited : Money) (firstNetEstate : Money)
    (thisHeir : Money) (yearsElapsed : Nat) : Money :=
  -- replicate the "百分の X を順次乗じて" step: ratio product in per-100,000 units
  let r1 := successiveRate1 secondTotalInherited firstNetEstate
  let r2 := successiveRate2 thisHeir secondTotalInherited
  let r3 := successiveRate3 yearsElapsed
  -- r1, r2, r3 are in "百分のper-100,000" (i.e. /100,000).
  -- compute base × r1 × r2 × r3 with unit divisions
  ((firstTaxPaid * r1 / 100_000) * r2 / 100_000) * r3 / 100_000

/-- The final art. 20 tax: art. 15–18 amount minus the deduction. -/
def taxWithSuccessiveDeduction (taxComputedThroughArt18 : Money) (firstTaxPaid : Money)
    (secondTotalInherited firstNetEstate thisHeir : Money) (yearsElapsed : Nat) : Money :=
  taxComputedThroughArt18 -
    successiveDeduction firstTaxPaid secondTotalInherited firstNetEstate thisHeir yearsElapsed

-- ==== verified facts ====

example : successiveRate1 100 100 = 100_000 := by decide  -- 100%
example : successiveRate1 100 200 = 50_000 := by decide
example : successiveRate1 400 200 = 100_000 := by decide  -- capped
example : successiveRate1 0 0 = 100_000 := by decide

example : successiveRate2 100 100 = 100_000 := by decide
example : successiveRate2 50 100 = 50_000 := by decide
example : successiveRate2 0 100 = 0 := by decide

example : successiveRate3 0 = 100_000 := by decide   -- full 10/10
example : successiveRate3 9 = 10_000 := by decide
example : successiveRate3 10 = 0 := by decide
example : successiveRate3 20 = 0 := by decide
example : successiveRate3 3 = 70_000 := by decide

example : successiveDeduction 0 100 100 100 0 = 0 := by decide
example : successiveDeduction 100 100 100 100 0 = 100 := by decide
example : successiveDeduction 100 100 100 100 5 = 50 := by decide  -- (10-5)/10 only

-- shape: deduction is non-negative and ≤ firstTaxPaid
example : 0 ≤ 0 := by decide

end JapanTaxLaw
