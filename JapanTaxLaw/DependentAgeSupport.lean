import JapanTaxLaw.TaxFinance

/-
# DependentAgeSupport — 第二条（国際連合の軍隊の地位に関する協定の実施に伴う所得税法等の臨時特例に関する法律）

Pinned source:
  Law id: 329AC0000000149
  Official title: 日本国における国際連合の軍隊の地位に関する協定の実施に伴う所得税法等の臨時特例に関する法律
  Revision: 329AC0000000149_20190107_430AC0000000016
  Raw snapshot: data/raw/329AC0000000149_20190107_430AC0000000016.law.json
  sha256: cb970b2673e9c788e414eca62f92a630d2acce975cda1233251834b874e653a6
  Statutory article: 第二条 (art. 2; raw JSON Article attr.Num = "2")

原文逐語（pinned, 一字一句改変なし）:
  「国際連合の軍隊の構成員又は軍属の配偶者及び二十一歳未満の子並びに父母及び二十一歳以上の子のうちその生計費の十分の五以上を国際連合の軍隊の構成員又は軍属が負担するもので、日本国内にある間におけるものをいう。」

Variable contract:
  `age : Nat` = 子の年齢 (years, 単位 歳). 二十一歳 = 21.
    「二十一歳未満の子」: STRICT age < 21 — automatically a dependent child.
    「二十一歳以上の子」: INCLUSIVE 21 <= age — qualifies only via the support test.
  `borne : Nat` = 国際連合の軍隊の構成員又は軍属が負担する生計費 (単位 円, whole yen).
  `total : Nat` = 生計費の総額 (単位 円, whole yen).
  十分の五 = 5/10 (one half): the member bears at least 5/10 of the living expenses.
    Encoded by exact integer cross-multiplication, no division and no rounding:
    10 * borne >= 5 * total. When total = 0 the ratio is undefined, so false.

Scope: ONLY the two explicit numeric conditions governing 家族 (dependent)
  classification are modelled: the 二十一歳 age threshold (未満 STRICT / 以上 INCLUSIVE)
  and the 十分の五 (>= 5/10) support ratio. The 配偶者 (spouse) and 父母 (parents)
  branches carry no numerals and are OUT OF SCOPE; so are the 日本国内にある間
  limitation, the substantive tax consequences, other articles and 政令 details.
  Computable slice of one norm unit.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DependentAgeSupport

/-- 「生計費の十分の五以上を負担」: exact integer cross-multiplication 10 * borne >= 5 * total.
    `total > 0` is required; at total = 0 the ratio is undefined and the test is false. -/
def supportRatioMet (borne total : Nat) : Bool :=
  decide (total > 0 && 10 * borne >= 5 * total)

/-- 「二十一歳未満の子」: a child under 21 is automatically a dependent (STRICT < 21). -/
def isDependentChild (age : Nat) : Bool :=
  decide (age < 21)

/-- 「二十一歳以上の子のうちその生計費の十分の五以上を負担するもの」: a child 21 or
    over (INCLUSIVE) qualifies only through the >= 5/10 support test. -/
def isDependentAdultChild (age borne total : Nat) : Bool :=
  decide (21 <= age && total > 0 && 10 * borne >= 5 * total)

/-- 二十歳 (age 20) is 二十一歳未満: automatically a dependent child. -/
theorem age20_dependent : isDependentChild 20 = true := by
  unfold isDependentChild
  have h : 20 < 21 := by omega
  simp [h]

/-- 二十一歳 (age 21) is not 未満: the STRICT boundary excludes it. -/
theorem age21_not_dependent : isDependentChild 21 = false := by
  unfold isDependentChild
  have h : ¬ 21 < 21 := by omega
  simp [h]

/-- Exactly 5/10 (500/1000) at age 21: 以上 is INCLUSIVE, so the child qualifies. -/
theorem age21_half_support_qualified : isDependentAdultChild 21 500 1000 = true := by
  unfold isDependentAdultChild
  have h : 10 * 500 >= 5 * 1000 := by omega
  simp [h]

/-- 499/1000 is below 十分の五: the 21+ child does not qualify. -/
theorem age21_below_half_unqualified : isDependentAdultChild 21 499 1000 = false := by
  unfold isDependentAdultChild
  have h : ¬ 10 * 499 >= 5 * 1000 := by omega
  simp [h]

/-- total = 0: the ratio is undefined (zero denominator), so the test is false. -/
theorem zero_total_unqualified : isDependentAdultChild 21 1 0 = false := by
  unfold isDependentAdultChild
  have h : ¬ 0 > 0 := by omega
  simp [h]

end JapanTaxLaw.DependentAgeSupport
