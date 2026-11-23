import JapanTaxLaw.TaxFinance

/-!
# SchoolExemptionRequirements — 学校等非課税の要件（地価税法施行規則 art.3 §6 一・二）bounded L4 モデル

Sources (pinned):
  Law id: 403M50000040031
  Revision: 403M50000040031_20260401_508M60000040010
  Raw snapshot: data/raw/403M50000040031_20260401_508M60000040010.law.json
  Article Num 3 §6 一・二, flat/normalized leaf text 6233 chars. Needles contain no U+3000.

原文逐語（第6項 一・二）:
  一「修業期間が一年以上であること。」
  二「一年の授業時間数（…）が六百八十時間以上」

Computation（原文逐語から導出、数値要件のみ、修業期間は月単位で表現）:
  一年 = 12 ヶ月
  meetsSchoolRequirements(months, hours) = months >= 12 && hours >= 680

Scope / NOT MODELLED:
  - 第6項の他の要件（生徒数の割合が常時百分の五十以上等）は NOT MODELLED。
  - 「普通科・専攻科その他」の区別・授業時間数の算定方法は NOT MODELLED。
  - 法別表第一第一号の定義・非課税の法的効果は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.SchoolExemptionRequirements

open JapanTaxLaw.TaxFinance

/-- 修業期間（月）と年間授業時間数の要件を満たすか。 -/
def meetsSchoolRequirements (months : Nat) (hours : Nat) : Bool :=
  months >= 12 && hours >= 680

example : meetsSchoolRequirements 12 680 = true := by decide
example : meetsSchoolRequirements 11 680 = false := by decide
example : meetsSchoolRequirements 12 679 = false := by decide
example : meetsSchoolRequirements 24 1000 = true := by decide

end JapanTaxLaw.SchoolExemptionRequirements
