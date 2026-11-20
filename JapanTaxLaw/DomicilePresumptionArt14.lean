/-!
# DomicilePresumptionArt14 — 340CO0000000096 art.14（国内住所の推定）

Pinned source: data/raw/340CO0000000096_20260522_508CO0000000093.law.json
source_path: LawBody[3]/MainProvision/MainProvision[0]/Article:14/Article#14/Paragraph#1/ParagraphSentence/Sentence#1
原文（56文字, 独立抽出で照合）:
「国内に居住することとなつた個人が次の各号のいずれかに該当する場合には、その者は、国内に住所を有する者と推定する。」

規範単位（PRESUMPTION）:
  - 適用条件1: 国内に居住することとなつた個人 → movedToJapan (caller-established)
  - 適用条件2: 次の各号のいずれかに該当 → listedCase (caller-established; 各号の具体的要件は当該単位外)
  - 法的効果: 国内に住所を有する者と推定 → 結果 true
反証可能性・各号の具体的要件・期間は NOT MODELLED。
-/
namespace JapanTaxLaw.DomicilePresumptionArt14

/-- 原文の推定規則。 -/
def presumedHasDomicile (movedToJapan : Bool) (listedCase : Bool) : Bool :=
  movedToJapan && listedCase

theorem applies_when_both : presumedHasDomicile true true = true := by decide
theorem rejects_no_move : presumedHasDomicile false true = false := by decide
theorem rejects_no_case : presumedHasDomicile true false = false := by decide

/-- 一般命題: 実装は原文の二条件と同値。 -/
theorem presumedHasDomicile_iff (m c : Bool) :
    presumedHasDomicile m c = true ↔ m = true ∧ c = true := by
  cases m <;> cases c <;> simp [presumedHasDomicile]

end JapanTaxLaw.DomicilePresumptionArt14
