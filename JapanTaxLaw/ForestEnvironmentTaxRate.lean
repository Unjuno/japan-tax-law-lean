/-!
# ForestEnvironmentTaxRate — 431AC0000000003 art.5（森林環境税の税率）

Pinned source: data/raw/431AC0000000003_20260401_508AC0000000002.law.json
source_path: LawBody[2]/MainProvision/MainProvision[1]/Article:5/Article#5/Paragraph#1/ParagraphSentence/Sentence#1
原文（13文字, 独立抽出で照合）:「森林環境税の税率は、千円とする。」

規範単位（EFFECT）: 森林環境税の税率は 1,000 円（年額、円、Nat）。
課税主体・課税標準・徴収手続・附則は当該単位外で NOT MODELLED。
-/
namespace JapanTaxLaw.ForestEnvironmentTaxRate

/-- 原文「千円」。森林環境税の税率（円）。 -/
def rateYen : Nat := 1_000

/-- 原文の法的効果: 税率が千円であること。引数は比較対象の金額（円）。 -/
def rateEqualsStatutory (amountYen : Nat) : Bool :=
  decide (amountYen == rateYen)

theorem rateYen_eq : rateYen = 1_000 := by decide
theorem accepts_thousand : rateEqualsStatutory 1_000 = true := by decide
theorem rejects_999 : rateEqualsStatutory 999 = false := by decide
theorem rejects_1001 : rateEqualsStatutory 1_001 = false := by decide

/-- 一般命題: 原文の税率との一致判定。 -/
theorem rateEqualsStatutory_iff (a : Nat) :
    rateEqualsStatutory a = true ↔ a = rateYen := by
  simp [rateEqualsStatutory]

end JapanTaxLaw.ForestEnvironmentTaxRate
