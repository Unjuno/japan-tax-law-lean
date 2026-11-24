import JapanTaxLaw.PostOfficeExceptionDate
import JapanTaxLaw.PostOfficeExceptionDateSpec

/-
# PostOfficeExceptionDateTests — kernel-decided checks for 八月三十一日 EXACT date

Pinned: law 347CO0000000150, revision 347CO0000000150_20251231_507CO0000000426,
  data/raw/347CO0000000150_20251231_507CO0000000426.law.json,
  sha256 6d98ec0adf89b24d3e80899607cd37cef883495efd5175db8a60841105486cff,
  Article Num 10, needle「ただし、郵政大臣が指定する郵便局にあつては、同年八月三十一日とする。」.
All checks are closed Nat/Bool expressions discharged by `by decide` / `rfl`,
or named theorems used as proofs of their exact propositions (theorem-as-proof).
Coverage: the pinned (8, 31) date, zero, small input, and the just-below / at /
just-above boundary of both literals 8 and 31, constant values, and impl/spec
agreement (concrete points plus the universal bridge applied to arbitrary Nat).
-/

namespace JapanTaxLaw.PostOfficeExceptionDate

-- (a) 法定の特例日 (八月, 三十一日) = (8, 31) は一致する。
example : isExceptionDate 8 31 = true := by decide

-- (b) zero: (0, 0) は特例日ではない。
example : isExceptionDate 0 0 = false := by decide

-- (c) small_input: (1, 1) は特例日ではない。
example : isExceptionDate 1 1 = false := by decide

-- (d) リテラル 31 のしきい値近傍: 三十日 (8, 30) は不可。
example : isExceptionDate 8 30 = false := by decide

-- (e) リテラル 8 のしきい値近傍: 九月 (9, 31) は不可。
example : isExceptionDate 9 31 = false := by decide

-- (f) リテラル 8 のしきい値近傍: 七月 (7, 31) は不可。
example : isExceptionDate 7 31 = false := by decide

-- (g) リテラル 31 のしきい値近傍: (8, 32) は不可。
example : isExceptionDate 8 32 = false := by decide

-- (h) 定数値（定理を証明項として適用）。
example : exceptionMonth = 8 := exceptionMonth_value
example : exceptionDay = 31 := exceptionDay_value
example : specMonth = 8 := rfl
example : specDay = 31 := rfl

-- (i) impl/spec 一致（具体的点）。
example : isExceptionDate 8 31 = specIsDate 8 31 := by decide
example : isExceptionDate 8 30 = specIsDate 8 30 := by decide
example : isExceptionDate 9 31 = specIsDate 9 31 := by decide
example : isExceptionDate 0 0 = specIsDate 0 0 := by decide

-- (j) 橋渡し定理を証明項として適用（任意の Nat に対して）。
example : exceptionMonth = specMonth := agreeMonth
example : exceptionDay = specDay := agreeDay
example (month : Nat) (day : Nat) : isExceptionDate month day = specIsDate month day := agreeIsDate month day

end JapanTaxLaw.PostOfficeExceptionDate
