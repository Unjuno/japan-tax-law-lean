import JapanTaxLaw.PostOfficeExceptionDate

/-
# PostOfficeExceptionDateSpec — independent spec for 沖縄 special 第十条（指定郵便局は八月三十一日）

Pinned source:
  Law id: 347CO0000000150
  Revision: 347CO0000000150_20251231_507CO0000000426
  Raw snapshot: data/raw/347CO0000000150_20251231_507CO0000000426.law.json
  SHA-256: 6d98ec0adf89b24d3e80899607cd37cef883495efd5175db8a60841105486cff
  Statutory article: 第十条 (art. 10; raw JSON Article attr.Num = "10")
  原文逐語: 「ただし、郵政大臣が指定する郵便局にあつては、同年八月三十一日とする。」

INDEPENDENT FORMULATION. This module owns its own statutory constants
`specMonth : Nat := 8` (八月) and `specDay : Nat := 31` (三十一日), and its own
`specIsDate (month : Nat) (day : Nat) : Bool := decide (month == specMonth && day == specDay)`.
No implementation identifier (exceptionMonth / exceptionDay / isExceptionDate)
occurs in any independent formula. The source contains exactly the kanji
numerals 八 and 三十一 in 八月三十一日, so NO other numeric constant is introduced
(BY-DESIGN: 郵便局の指定・一般ルールの日付・年算術は NOT MODELLED). The only
bridges are the three pure `unfold ... ; rfl` theorems below, listing only
constants that actually occur in each goal.
-/

namespace JapanTaxLaw.PostOfficeExceptionDate

/-- Independent 八月 — the exception month = 8. -/
def specMonth : Nat := 8

/-- Independent 三十一日 — the exception day = 31. -/
def specDay : Nat := 31

/-- Independent exact-date predicate (no implementation identifier). -/
def specIsDate (month : Nat) (day : Nat) : Bool :=
  decide (month == specMonth && day == specDay)

/-- Bridge: month constants agree (pure unfold/rfl). -/
theorem agreeMonth : exceptionMonth = specMonth := by unfold exceptionMonth specMonth; rfl

/-- Bridge: day constants agree (pure unfold/rfl). -/
theorem agreeDay : exceptionDay = specDay := by unfold exceptionDay specDay; rfl

/-- Bridge: date predicates agree for every input (pure unfold/rfl). -/
theorem agreeIsDate (month : Nat) (day : Nat) : isExceptionDate month day = specIsDate month day := by
  unfold isExceptionDate specIsDate exceptionMonth exceptionDay specMonth specDay
  rfl

end JapanTaxLaw.PostOfficeExceptionDate
