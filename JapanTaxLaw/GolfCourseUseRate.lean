import JapanTaxLaw.TaxFinance

/-!
# 地方税法 art.76(1) ゴルフ場利用税の標準税率 — bounded L4 model

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, unit NORM|f345a99128087aed87634e8963422db557c8f7daa6b17adec119fe0aceb3cdfa.
原文逐語: 「ゴルフ場利用税の標準税率は、一人一日につき八百円とする。」
Unit: Money (Nat, 円) / 円/人・日. Scope: 税率定数のみ.
数量の算定・軽減・申告・徴収・附則は NOT MODELLED.
Human legal review remains pending.
-/

namespace JapanTaxLaw.GolfCourseUseRate

open JapanTaxLaw.TaxFinance

/-- 原文「八百円」 = 800. -/
def golfCourseUseRate : Money := 800

theorem golfCourseUseRate_value : golfCourseUseRate = 800 := by decide
theorem golfCourseUseRate_pos : 0 < golfCourseUseRate := by decide
theorem golfCourseUseRate_not_scaled : golfCourseUseRate ≠ 80 := by decide

example : golfCourseUseRate = 800 := by decide
example : 0 < golfCourseUseRate := by decide

end JapanTaxLaw.GolfCourseUseRate
