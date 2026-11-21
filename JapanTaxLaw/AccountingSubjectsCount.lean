import JapanTaxLaw.TaxFinance

/-
# AccountingSubjectsCount — 税理士法 第六条（会計学に属する科目）enumeration-count モデル

Pinned source:
  Law id: 326AC1000000237 (税理士法)
  Revision: 326AC1000000237_20251001_505AC0000000053
  Raw snapshot: data/raw/326AC1000000237_20251001_505AC0000000053.law.json
  sha256: 46d956e2c48954577ec3479c5e8c83a2a2ff913860a2ba6b2eea327f3107916f
  Article Num 6 (main provision「試験の目的及び試験科目」, 381 chars).

原文逐語 (scoped Article 6, pinned 一字一句改変なし):
  「会計学のうち簿記論及び財務諸表論の二科目」

Variable contract:
  accountingSubjects : List String = 会計学に属する科目 (the enumerated subjects);
  prescribedCount : Nat = 二科目 (the count); 二 = 2 is an INCLUSIVE/EXACT count —
  the enumeration has exactly two named members, no more and no fewer.
  isPrescribedSubject is the decidable one-place membership test.

Scope: only the explicit numeric enumeration (the two named subjects and the
count 2). The rest of art.6 (税法に属する科目 and its 三科目 rule), examination
administration, exemptions and 政令 details are NOT MODELLED.
This model provides no legal review. No `sorry`, `axiom`, `Classical.choice`,
`omega` or `Nat.div`; every proof is `rfl` / `decide` on concrete values.
-/

namespace JapanTaxLaw.AccountingSubjectsCount

/-- 会計学に属する科目: the two subjects named in art.6. -/
def accountingSubjects : List String := ["簿記論", "財務諸表論"]

/-- 二科目: the statutory count (二 = 2, exact). -/
def prescribedCount : Nat := 2

/-- Decidable membership in the enumerated 会計学に属する科目. -/
def isPrescribedSubject (s : String) : Bool := s == "簿記論" || s == "財務諸表論"

theorem count_ok : accountingSubjects.length = prescribedCount := by
  unfold accountingSubjects prescribedCount
  rfl

theorem bookkeeping_prescribed : isPrescribedSubject "簿記論" = true := by decide
theorem financial_statements_prescribed : isPrescribedSubject "財務諸表論" = true := by decide
theorem tax_law_not_prescribed : isPrescribedSubject "税法" = false := by decide

end JapanTaxLaw.AccountingSubjectsCount
