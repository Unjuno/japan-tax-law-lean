import JapanTaxLaw.TaxFinance

/-
# PostOfficeExceptionDate — 沖縄 special 第十条（指定郵便局は八月三十一日）EXCEPTION モデル

Pinned source:
  Law id: 347CO0000000150
  Revision: 347CO0000000150_20251231_507CO0000000426
  Raw snapshot: data/raw/347CO0000000150_20251231_507CO0000000426.law.json
  SHA-256: 6d98ec0adf89b24d3e80899607cd37cef883495efd5175db8a60841105486cff
  Statutory article: 第十条 (art. 10; raw JSON Article attr.Num = "10")

原文逐語（pinned, 一字一句改変なし）:
  「ただし、郵政大臣が指定する郵便局にあつては、同年八月三十一日とする。」

Variable contract:
  `month : Nat` = 月 (1..12)。
  `day : Nat` = 日 (1..31)。
  郵政大臣が指定する郵便局の特例日は、同年八月三十一日 = (8, 31)。
  `isExceptionDate month day` は (month, day) = (8, 31) のときのみ true（EXACT date）。

Scope / NOT MODELLED:
  - 郵便局の指定（郵政大臣が指定する郵便局）の判定・手続きは NOT MODELLED。
  - 一般ルールの日付・年算術（「同年」の西暦換算）は NOT MODELLED。
  - 月・日の暦としての妥当性範囲 (1..12 / 1..31) チェックは NOT MODELLED（Nat の等値のみ）。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PostOfficeExceptionDate

/-- 八月 — the exception month = 8. -/
def exceptionMonth : Nat := 8

/-- 三十一日 — the exception day = 31. -/
def exceptionDay : Nat := 31

/-- 指定郵便局の特例日が (八月, 三十一日) と一致するか（EXACT date）。 -/
def isExceptionDate (month : Nat) (day : Nat) : Bool :=
  decide (month == exceptionMonth && day == exceptionDay)

/-- 定数値: 八月 = 8。 -/
theorem exceptionMonth_value : exceptionMonth = 8 := rfl

/-- 定数値: 三十一日 = 31。 -/
theorem exceptionDay_value : exceptionDay = 31 := rfl

/-- (8, 31) は特例日。 -/
theorem isExceptionDate_8_31 : isExceptionDate 8 31 = true := by decide

/-- (8, 30) は特例日ではない。 -/
theorem isExceptionDate_8_30 : isExceptionDate 8 30 = false := by decide

/-- (9, 31) は特例日ではない。 -/
theorem isExceptionDate_9_31 : isExceptionDate 9 31 = false := by decide

/-- (7, 31) は特例日ではない。 -/
theorem isExceptionDate_7_31 : isExceptionDate 7 31 = false := by decide

end JapanTaxLaw.PostOfficeExceptionDate
