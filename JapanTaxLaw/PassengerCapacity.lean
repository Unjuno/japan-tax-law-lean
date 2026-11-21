import JapanTaxLaw.TaxFinance

/-!
# PassengerCapacity — 乗用自動車の範囲（政令 art.4）bounded L4 モデル

Sources (pinned):
  Law id: 346CO0000000275
  Revision: 346CO0000000275_20230101_504CO0000000195
  Raw snapshot: data/raw/346CO0000000275_20230101_504CO0000000195.law.json
  Article Num 4, flat/normalized leaf text 55 chars, U+3000 count 0.

原文逐語:
  「法第七条第二項第一号に規定する政令で定める自動車は、乗車定員十人以下の自動車とする。」

Computation（原文逐語から導出、定員閾値のみ）:
  maxPassengers = 10（十人以下）
  isPassengerCar(capacity) = capacity <= 10

Scope / NOT MODELLED:
  - 法7条2項1号の他の要件、自動車の用途・構造の認定は NOT MODELLED。
  - 本スライスは乗車定員 10 人以下の数値判定のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PassengerCapacity

open JapanTaxLaw.TaxFinance

/-- 乗車定員の上限 = 10 人。 -/
def maxPassengers : Nat := 10

/-- 乗車定員 10 人以下か（境界: 10 は含む）。 -/
def isPassengerCar (capacity : Nat) : Bool :=
  capacity <= maxPassengers

example : maxPassengers = 10 := by decide
example : isPassengerCar 0 = true := by decide
example : isPassengerCar 10 = true := by decide
example : isPassengerCar 11 = false := by decide

end JapanTaxLaw.PassengerCapacity
