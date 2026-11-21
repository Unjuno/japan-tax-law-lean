import JapanTaxLaw.AccountingSubjectsCount

/-
# AccountingSubjectsCountSpec — independent spec for 税理士法 第六条（会計学に属する科目）

Sources (pinned): law 326AC1000000237, revision 326AC1000000237_20251001_505AC0000000053.
Independent restatement: 会計学に属する科目 contains exactly the two named
subjects 簿記論 and 財務諸表論; 二科目 = 2 (exact, inclusive of both).
No implementation identifier appears in the spec* DEFINITIONS below; only the
bridge theorems are allowed to reference the implementation.
-/

namespace JapanTaxLaw.AccountingSubjectsCount

/-- Independent enumeration of the two named subjects (re-typed literal). -/
def specSubjects : List String := ["簿記論", "財務諸表論"]

/-- Independent statutory count: 二科目 = 2. -/
def specCount : Nat := 2

/-- Bridge: the two independently typed counts agree (axiom-free, by rfl). -/
theorem agreeCount : prescribedCount = specCount := by
  unfold prescribedCount specCount
  rfl

/-- Bridge: the two independently typed enumerations agree (axiom-free, by rfl). -/
theorem agreeSubjects : accountingSubjects = specSubjects := by
  unfold accountingSubjects specSubjects
  rfl

/-- Independent count check from the spec side only. -/
theorem spec_count_ok : specSubjects.length = specCount := by
  unfold specSubjects specCount
  rfl

end JapanTaxLaw.AccountingSubjectsCount
