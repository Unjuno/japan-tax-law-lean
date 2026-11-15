import JapanTaxLaw.TaxFinance
import JapanTaxLaw.InheritanceTax

/-!
# InheritanceApportionment — 相続税法 art. 17（各相続人等の相続税額）L4 computation slice

Sources (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as InheritanceTax.lean / GiftTax.lean / InheritanceSurcharge.lean /
   InheritanceMinorDisabledDeduction.lean)

Models art. 17 verbatim text (pinned bytes):

  「相続又は遺贈により財産を取得した者に係る相続税額は、その被相続人から相続又は遺贈により
    財産を取得したすべての者に係る相続税の総額に、それぞれこれらの事由により財産を取得した
    者に係る相続税の課税価格が当該財産を取得したすべての者に係る課税価格の合計額のうちに
    占める割合を乗じて算出した金額とする。」

  — the statutory text contains **no numeric literal** (only a proportion); hence
    nothing art. 17-specific to transcribe into the audit. The portion-rate table itself
    lives in art. 16 (`InheritanceTax.lean`).

Scope:

* `heirApportionedTax totalTax heirTaxable totalTaxable` — art. 17's proportional formula:
  `floor(totalTax × heirTaxable / totalTaxable)` (Per-product floor once at the end;
  no per-heir report obligation beyond this multiplication/division — **modeling candidate**).
* art. 16 precedes this one (per-portion rates + art. 15-16 composite); this model does not
  compute the 相続税の総額 — caller supplies it.
* art. 16(3) の各相続人等別々の課税価格の計算、qualifications (a)/(b) はモデル化しない。
* 相続税総額計算における art. 17 の適用（各取得金額の合算）の適用順 — ぞれらの順序は
  `GiftAddBack`/`InheritanceTax` の計算順序の一段階であり、本モデルの射程外。

Eligibility gates (相続人、課税価格の合計額が零でない、art. 15 控除後の数値が返ってくること)
are externally established booleans; this model does not derive them.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 17 rate: 当該財産を取得した者に係る課税価格が課税価格の合計額のうちに占める割合。
    totalTaxable = 0 の場合は 0（算出不能ケースとしてモデル化）。 -/
def heirApportionedTax (totalTax heirTaxable totalTaxable : Money) : Money :=
  if totalTaxable = 0 then 0 else totalTax * heirTaxable / totalTaxable

theorem heirApportionedTax_of_totalTaxable_zero (t h : Money) :
    heirApportionedTax t h 0 = 0 := rfl

/-- Division/multiplication with denominator zero is rejected here by construction. -/
theorem heirApportionedTax_le_totalTax (totalTax heirTaxable totalTaxable : Money)
    (h : heirTaxable ≤ totalTaxable) (ht : totalTaxable ≠ 0) :
    heirApportionedTax totalTax heirTaxable totalTaxable ≤ totalTax := by
  unfold heirApportionedTax
  rw [ite_eq_right (fun e => ht e)]
  have hh : totalTax * heirTaxable ≤ totalTax * totalTaxable :=
    Nat.mul_le_mul_left totalTax h
  rw [Nat.mul_comm totalTax totalTaxable] at hh
  exact Nat.div_le_of_le_mul hh

/-- The whole taxable amount consumes the entire total tax. -/
theorem heirApportionedTax_of_full (totalTax totalTaxable : Money) (ht : totalTaxable ≠ 0) :
    heirApportionedTax totalTax totalTaxable totalTaxable = totalTax := by
  unfold heirApportionedTax
  rw [ite_eq_right (fun e => ht e)]
  exact Nat.mul_div_cancel _ (Nat.pos_of_ne_zero ht)

/-- The apportioned tax is monotone in the heir's taxable amount. -/
theorem heirApportionedTax_mono {t a b c : Money} (h : a ≤ b) :
    heirApportionedTax t a c ≤ heirApportionedTax t b c := by
  unfold heirApportionedTax
  by_cases hc : c = 0
  · rw [ite_eq_left hc, ite_eq_left hc]
    exact Nat.le_refl 0
  · rw [ite_eq_right hc, ite_eq_right hc]
    exact Nat.div_le_div_right (Nat.mul_le_mul_left t h)

-- ==== kernel-decided smoke checks ====

example : heirApportionedTax 1_000_000 100_000 4_000_000 = 25_000 := by decide
example : heirApportionedTax 2_000_000 500_000 4_000_000 = 250_000 := by decide
example : heirApportionedTax 0 100_000 4_000_000 = 0 := by decide
example : heirApportionedTax 1_000_000 0 4_000_000 = 0 := by decide
example : heirApportionedTax 1_000_000 4_000_000 4_000_000 = 1_000_000 := by decide
example : heirApportionedTax 1_000_000 100_000 0 = 0 := by decide
/-- 3 heirs sharing a ¥100,000,000 tax on a ¥100,000,000-taxable base in 1 : 2 : 7 proportions. -/
example : heirApportionedTax 100_000_000 10_000_000 100_000_000 = 10_000_000 := by decide
example : heirApportionedTax 100_000_000 20_000_000 100_000_000 = 20_000_000 := by decide
example : heirApportionedTax 100_000_000 70_000_000 100_000_000 = 70_000_000 := by decide

end JapanTaxLaw
