import Std
import JapanTaxLaw.TaxFinance

/-
# ReconstructionCorpTaxMonthFloor — 復興特別法人税に関する政令 第三条 第三項
（前項の月数：一月に満たない端数を切り捨て）

Pinned sources:
  Law id: 424CO0000000017 (復興特別法人税に関する政令)
  Revision: 424CO0000000017_20240401_505CO0000000208 (enforced 2024-04-01)
  Raw snapshot: data/raw/424CO0000000017_20240401_505CO0000000208.law.json
  Article Num 3, Paragraph Num 3, Sentence 1.
  source_path: LawBody[2]/MainProvision/MainProvision[2]/Article:3/Article#3/Paragraph#3/ParagraphSentence/Sentence#1
  Normative unit: NORM|8ba0eae4c7192f833472ac031b8344999712f18815220174ee5daef907142d9b

Verbatim 原文 needle (scoped to Article 3 Paragraph 3):
  「前項の月数は、暦に従って計算し、一月に満たない端数を生じたときは、これを切り捨てる。」

Variable contract:
  The caller establishes a non-negative month count produced 暦に従って,
  represented here as an exact rational numer/denom whole yen-free count.
  effectiveMonths numer denom = numer / denom (Nat floor).
  A fractional part strictly below one month is discarded (一月未満切捨て).

This is the OPPOSITE boundary rule to the already formalized
BusinessOwnerDeduction art.72の49の14(3) (「一月に満たない端数…一月とする」,
round up to one month). No rounding rule is invented here beyond the stated
floor to whole months; the clause gives no yen rounding.

Scope: ONLY this sub-month floor. How the calendar count is derived from
dates, paragraph 1's taxable-year selection, paragraph 2's 読み替え, the
復興特別法人税 rate/base, other paragraphs/articles, negative inputs and
denominator = 0 are NOT MODELLED (caller establishes numer/denom ≥ 0/ > 0).
-/

namespace JapanTaxLaw.ReconstructionCorpTaxMonthFloor

/-- 一月未満の端数を切り捨てた月数（exact rational numer/denom の Nat floor）。 -/
def effectiveMonths (numer : Nat) (denom : Nat) : Nat :=
  numer / denom

/-- 零月。 -/
theorem zero_months : effectiveMonths 0 1 = 0 := by decide

/-- 一月未満（1/2 月）は 0 に切り捨て。 -/
theorem half_month_floors_to_zero : effectiveMonths 1 2 = 0 := by decide

/-- ちょうど一月は 1。 -/
theorem exactly_one_month : effectiveMonths 1 1 = 1 := by decide

/-- 13/12 月は 1（一月未満の端数 1/12 を切り捨て）。 -/
theorem thirteen_twelfths : effectiveMonths 13 12 = 1 := by decide

/-- 31/32 月は 0。 -/
theorem thirty_one_thirty_seconds : effectiveMonths 31 32 = 0 := by decide

end JapanTaxLaw.ReconstructionCorpTaxMonthFloor
