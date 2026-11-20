/-!
# LimitRate12Condition — 362CO0000000335 art.4（限度税率が百分の十二である場合）

Pinned source: data/raw/362CO0000000335_20260521_506CO0000000150.law.json
source_path: LawBody[2]/MainProvision/MainProvision[8]/Article:4/Article#4/Paragraph#1/Item#7/ItemSentence/Column#1/Sentence#1
原文（14文字, 独立抽出で照合）:「限度税率が百分の十二である場合」

条件: 限度税率（百分率、単位 %, 非負整数, caller-established）が 12 であること。
税率の算定主体・他の税率帯・適用手続は当該単位外で NOT MODELLED。
-/
namespace JapanTaxLaw.LimitRate12Condition

/-- 原文「百分の十二」（%）。 -/
def statutoryRatePercent : Nat := 12

/-- 原文の条件: 限度税率が 12% であること。 -/
def isTwelvePercent (limitRatePercent : Nat) : Bool :=
  decide (limitRatePercent == statutoryRatePercent)

theorem statutoryRatePercent_eq : statutoryRatePercent = 12 := by decide

theorem accepts_twelve : isTwelvePercent 12 = true := by decide
theorem rejects_eleven : isTwelvePercent 11 = false := by decide
theorem rejects_thirteen : isTwelvePercent 13 = false := by decide

/-- 一般命題: 実装は原文の等号と同値。 -/
theorem isTwelvePercent_iff (r : Nat) :
    isTwelvePercent r = true ↔ r = statutoryRatePercent := by
  simp [isTwelvePercent]

end JapanTaxLaw.LimitRate12Condition
