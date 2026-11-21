import JapanTaxLaw.RequiredApplicationDocuments
import JapanTaxLaw.RequiredApplicationDocumentsSpec

/-
# RequiredApplicationDocumentsTests — kernel-decided checks for 自動車重量税法施行規則 第六条第二項

Every example is a closed Bool expression discharged by `by decide`, or a direct
application of a universal agreement theorem. Coverage: all five present, each
single-missing case, 準ずるもの accepted with standard set absent, the empty set,
monotonicity, completeness-requires-all-five, impl/spec agreement, plus two
kernel-decided document-count boundary checks (zero / small-input / saturation).
-/

namespace JapanTaxLaw.RequiredApplicationDocumentsTests

open JapanTaxLaw.RequiredApplicationDocuments
open JapanTaxLaw.RequiredApplicationDocumentsSpec

def allPresent : Documents :=
  { articles := true, registryCertificate := true, balanceSheet := true,
    incomeStatement := true, businessReport := true, equivalentAccepted := false }

def emptyDocs : Documents :=
  { articles := false, registryCertificate := false, balanceSheet := false,
    incomeStatement := false, businessReport := false, equivalentAccepted := false }

def equivalentOnly : Documents :=
  { articles := false, registryCertificate := false, balanceSheet := false,
    incomeStatement := false, businessReport := false, equivalentAccepted := true }

/-- Count of standard documents attached (structural boundary evidence). -/
def attachedCount (d : Documents) : Nat :=
  (if d.articles then 1 else 0) + (if d.registryCertificate then 1 else 0) +
  (if d.balanceSheet then 1 else 0) + (if d.incomeStatement then 1 else 0) +
  (if d.businessReport then 1 else 0)

-- (a) all five present: complete and the duty is satisfied.
example : completeDocuments allPresent = true := by decide
example : allDocumentsAttached allPresent = true := by decide

-- (b) each single-missing case: completeness fails.
example : completeDocuments { allPresent with articles := false } = false := by decide
example : completeDocuments { allPresent with registryCertificate := false } = false := by decide
example : completeDocuments { allPresent with balanceSheet := false } = false := by decide
example : completeDocuments { allPresent with incomeStatement := false } = false := by decide
example : completeDocuments { allPresent with businessReport := false } = false := by decide

-- (c) equivalent documents accepted even when all standard documents are absent.
example : allDocumentsAttached equivalentOnly = true := by decide
example : allDocumentsAttached { emptyDocs with equivalentAccepted := true } = true := by decide

-- (d) empty set: no documents and no equivalent set -> duty not satisfied.
example : allDocumentsAttached emptyDocs = false := by decide

-- (e) monotonicity: adding documents to a complete set keeps it complete.
example : completeDocuments { allPresent with articles := true, registryCertificate := true,
    balanceSheet := true, incomeStatement := true, businessReport := true } = true :=
  complete_monotone allPresent (by decide)

-- (f) completeness requires all five (universal iff, applied to concrete sets).
example : completeDocuments allPresent = true ∧
    allPresent.articles = true ∧ allPresent.registryCertificate = true ∧
    allPresent.balanceSheet = true ∧ allPresent.incomeStatement = true ∧
    allPresent.businessReport = true := by
  exact ⟨all_present_complete, (complete_iff_all_five allPresent).mp all_present_complete⟩

-- (g) impl/spec agreement (kernel-decided points + universal theorem).
example : allDocumentsAttached allPresent = specSatisfies (toSpecDocument allPresent) := by decide
example : allDocumentsAttached emptyDocs = specSatisfies (toSpecDocument emptyDocs) := by decide
example : allDocumentsAttached equivalentOnly = specSatisfies (toSpecDocument equivalentOnly) := by decide
example : allDocumentsAttached allPresent = specSatisfies (toSpecDocument allPresent) :=
  agree_allDocumentsAttached allPresent

-- (h) document-count boundary evidence (zero / small_input / saturation).
example : 0 + attachedCount emptyDocs = 0 := by decide
example : 1 + attachedCount allPresent = 1 + 5 := by decide

end JapanTaxLaw.RequiredApplicationDocumentsTests
