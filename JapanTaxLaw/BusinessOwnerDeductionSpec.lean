import JapanTaxLaw.BusinessOwnerDeduction

/-!
# BusinessOwnerDeduction spec — 地方税法 art. 72の49の14（事業主控除）の独立整数定式

Sources (pinned; identical to BusinessOwnerDeduction.lean):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

This file restates the statutory arithmetic independently in plain `Nat`, without
referencing any implementation constant: the annual amount is the bare literal
read from 原文「二百九十万円」(2_900_000); the monthly amount is written with the
multiplication order commuted (`months * 2_900_000 / 12`) relative to the
implementation (`2_900_000 * months / 12`); the branch is expressed with `12 ≤ months`
(first question: full year?), the converse of the implementation's `months < 12`.

`agreeBusinessOwnerDeduction` checks that implementation and this independent
restatement coincide on a finite grid of months (kernel `decide`); it is NOT a
universal claim.

Scope boundaries are identical to the implementation. In particular the number of
months (including the 3項 rounding「一月に満たない端数を一月とする」, applyFloor
相当) and the question of whether the person carries on a business are
caller-established and are never used to derive an amount inside this model. Only
the deduction amount is modelled — no business income computation, no tax
computation, no statutory ordering among deductions.
-/

namespace JapanTaxLaw.BusinessOwnerDeduction

-- ==== art. 72の49の14: 独立定式（impl の定数を参照しない） ====

/-- art. 72の49の14(1): 年額「二百九十万円」。 -/
def specFull : Nat := 2_900_000

/-- art. 72の49の14(2): 「二百九十万円に月数を乗じて得た額を十二で除して」。
    乗法順を impl と入れ替えた独立式（Nat 除算で切り捨て）。 -/
def specMonthly (months : Nat) : Nat := months * 2_900_000 / 12

/-- art. 72の49の14(1)(2): `12 ≤ months` なら年額、そうでなければ月割。 -/
def specDeduction (months : Nat) : Nat :=
  if 12 ≤ months then specFull else specMonthly months

-- ==== points（独立定式のスモーク、全境界値） ====

example : specFull = 2_900_000 := by decide
example : specMonthly 0 = 0 := by decide
example : specMonthly 1 = 241_666 := by decide
example : specMonthly 11 = 2_658_333 := by decide
example : specMonthly 12 = 2_900_000 := by decide
example : specDeduction 0 = 0 := by decide
example : specDeduction 1 = 241_666 := by decide
example : specDeduction 11 = 2_658_333 := by decide
example : specDeduction 12 = 2_900_000 := by decide
example : specDeduction 13 = 2_900_000 := by decide

-- ==== agreement（impl ↔ spec、有限点のみ；全称主張ではない） ====

/-- 実装と独立定式が有限グリッド上で一致するか（列挙された点のみ；全称主張ではない）。
    境界 0 / 1 / 11 / 12 / 13 と端数を含む 2, 3, 6, 7, 24 を検査する。 -/
def agreeBusinessOwnerDeduction : Bool :=
  let months := [0, 1, 2, 3, 6, 7, 11, 12, 13, 24]
  (businessOwnerDeductionFull == specFull) &&
    months.all fun m =>
      (monthlyBusinessDeduction m == specMonthly m) &&
      (businessOwnerDeduction m == specDeduction m)

example : agreeBusinessOwnerDeduction = true := by decide

end JapanTaxLaw.BusinessOwnerDeduction
