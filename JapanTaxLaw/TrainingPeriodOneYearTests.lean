import JapanTaxLaw.TrainingPeriodOneYearSpec

/-
# TrainingPeriodOneYearTests — kernel-decided checks for 地価税法施行規則 art.3(6)(1)

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned value, zero, the one-year floor,
a two-year input, a Nat identity, and impl/spec agreement.
-/

namespace JapanTaxLaw.TrainingPeriodOneYear

-- (a) pinned statutory value: 一年 = 1.
example : trainingFloorYears = 1 := rfl

-- (b) zero years fails.
example : meetsTrainingPeriod 0 = false := by decide

-- (c) 以上 is inclusive: exactly one year qualifies.
example : meetsTrainingPeriod 1 = true := by decide

-- (d) two years qualifies.
example : meetsTrainingPeriod 2 = true := by decide

-- (e) Nat identity / saturation at the floor.
example : 1 + 0 = 1 := by decide

-- (f) kernel-decided impl/spec agreement at boundary points.
example : meetsTrainingPeriod 1 = specMeetsTraining 1 := by decide
example : meetsTrainingPeriod 0 = specMeetsTraining 0 := by decide
example : meetsTrainingPeriod 2 = specMeetsTraining 2 := by decide

-- (g) universal theorem applied to an arbitrary year count.
example (x : Nat) : meetsTrainingPeriod x = specMeetsTraining x := agree_training_floor x

-- (h) independent spec constant is the same statutory value.
example : specTrainingFloor = 1 := rfl

end JapanTaxLaw.TrainingPeriodOneYear
