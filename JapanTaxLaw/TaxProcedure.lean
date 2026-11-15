import JapanTaxLaw.Verdict

/-!
# TaxProcedure — 国税通則法（国税の通則に関する法律）第2条第10号（強制換価手続の定義）

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Law id: 337AC0000000066（昭和三十七年法律第六十六号）
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 6F8B43E168652D228066CDA3389A3BF6823900A9268E6BF97297CB6B25189DEE

Act art. 2 item 10, verbatim from the pinned text:
  強制換価手続 滞納処分（その例による処分を含む。）、強制執行、担保権の実行としての競売、
  企業担保権の実行手続、企業価値担保権の実行手続及び破産手続をいう。

Reading (enumerated, closed): the six procedures listed are the ONLY
"compulsory realization procedures" for the purposes of this Act.
"滞納処分（その例による処分を含む。)" means dispositions analogous to a
delinquency disposition fall within the first enumerated kind; nothing
above or beyond the six enumerated kinds may be added by construction.

Scope:
* Only Act art. 2 item 10 is formalized. Items 6–9, 11+ are not claimed.
* The model is an ENUMERATION type: its membership is exactly the six
  statutory kinds. It does not apply the procedures to any concrete fact
  pattern (滞納処分 vs 強制執行 vs 破産の適用要件は各法令の規定).

Axiom discipline: all theorems are proved by `decide` over closed
DecidableEq instances. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Act art. 2 item 10: the six compulsory realization procedures, exhaustively enumerated. -/
inductive CompulsoryRealizationProcedure where
  /-- 滞納処分（その例による処分を含む。） -/
  | delinquencyDisposition
  /-- 強制執行 -/
  | compulsoryExecution
  /-- 担保権の実行としての競売 -/
  | auctionForSecurityExecution
  /-- 企業担保権の実行手続 -/
  | executionProcedureCorporateSecurity
  /-- 企業価値担保権の実行手続 -/
  | executionProcedureEnterpriseValueSecurity
  /-- 破産手続 -/
  | bankruptcyProceedings
  deriving DecidableEq, Repr

namespace CompulsoryRealizationProcedure

/-- The canonical list of the six statutory kinds (order as in the statute). -/
def all : List CompulsoryRealizationProcedure :=
  [.delinquencyDisposition, .compulsoryExecution, .auctionForSecurityExecution,
   .executionProcedureCorporateSecurity, .executionProcedureEnterpriseValueSecurity,
   .bankruptcyProceedings]

/-- Membership of every constructor, by decidable check. -/
theorem in_all (p : CompulsoryRealizationProcedure) : p ∈ all := by
  cases p <;> simp [all]

/-- The list has no duplicates. -/
theorem all_nodup : List.Nodup all := by decide

/-- The list has exactly six members. -/
theorem all_length : all.length = 6 := by decide

/-- Every constructor is recognized (the list is closed to the statutory kinds). -/
theorem recognized_all (p : CompulsoryRealizationProcedure) : p ∈ all := in_all p

end CompulsoryRealizationProcedure

end JapanTaxLaw
