import JapanTaxLaw.InheritanceTax

/-!
# InheritanceTax spec — independent statement of art. 15/16

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7

Independent restatement of 相続税法 art. 15/16:

* art. 15 — 遺産に係る基礎控除: ¥30,000,000 + ¥6,000,000 × 相続人の数
  (tax-credit against the taxable inheritance before applying the rate table).
* art. 16 — 相続税の総額: each heir's 法定相続分 portion is computed by an
  8-bracket progressive table (10/15/20/30/40/45/50/55%) applied to the
  post-deduction remainder.

Specification:
  `specPortion x` computes the per-portion tax directly with if-then-else.
  Kernel `decide` verifies both the spec and the implementation at sample
  and boundary points; the universal equality of the two directions is a
  candidate for L5 (not claimed here).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Independent restatement of art. 16 per-portion tax (no shared helpers). -/
def specPortion (x : Money) : Money :=
  if x ≤ 10_000_000 then x * 10 / 100
  else if x ≤ 30_000_000 then 1_000_000 + (x - 10_000_000) * 15 / 100
  else if x ≤ 50_000_000 then 4_000_000 + (x - 30_000_000) * 20 / 100
  else if x ≤ 100_000_000 then 8_000_000 + (x - 50_000_000) * 30 / 100
  else if x ≤ 200_000_000 then 23_000_000 + (x - 100_000_000) * 40 / 100
  else if x ≤ 300_000_000 then 63_000_000 + (x - 200_000_000) * 45 / 100
  else if x ≤ 600_000_000 then 108_000_000 + (x - 300_000_000) * 50 / 100
  else 258_000_000 + (x - 600_000_000) * 55 / 100

/-- The spec itself answers to all known boundary points. -/
example : specPortion 0 = 0 := by decide
example : specPortion 10_000_000 = 1_000_000 := by decide
example : specPortion 30_000_000 = 4_000_000 := by decide
example : specPortion 50_000_000 = 8_000_000 := by decide
example : specPortion 100_000_000 = 23_000_000 := by decide
example : specPortion 200_000_000 = 63_000_000 := by decide
example : specPortion 300_000_000 = 108_000_000 := by decide
example : specPortion 600_000_000 = 258_000_000 := by decide
example : specPortion 700_000_000 = 313_000_000 := by decide

/-- At the statutory edge points the two formulations agree. -/
def checkGrid : Bool :=
  let rec go (k : Nat) : Bool :=
    match k with
    | 0 => specPortion 0 == inheritedPortionTax 0
    | n + 1 =>
        let x := (n + 1) * 15_000_000
        go n && (specPortion x == inheritedPortionTax x)
  go 50

example : checkGrid = true := by decide

example : specPortion 5_000_000 == inheritedPortionTax 5_000_000 := by decide
example : specPortion 150_000_000 == inheritedPortionTax 150_000_000 := by decide

/-- art. 15 independent restatement of the deduction. -/
def specDeduction (heirs : Nat) : Money := 30_000_000 + 6_000_000 * heirs
example : specDeduction 0 = 30_000_000 := by decide
example : specDeduction 1 = 36_000_000 := by decide
example : specDeduction 2 = 42_000_000 := by decide
example : specDeduction 9 = 84_000_000 := by decide
example : specDeduction 2 = inheritanceBasicDeduction 2 := by decide

end JapanTaxLaw
