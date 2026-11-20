/-!
# TaxAccountantFine — 326AC1000000145 art.14（税理士法 過料の上限）

Sources (pinned):
  Law id: 326AC1000000145, revision 326AC1000000145_20211122_503AC0000000046
  Raw snapshot: data/raw/326AC1000000145_20211122_503AC0000000046.law.json
  sha256(raw): fc6c4ca152291c10c1218a62303a879195bfbbe95a056d0e264ee0315bbc4e2b
  source_path: LawBody[1]/MainProvision/MainProvision[14]/Article:14/Article#14/Paragraph#1/ParagraphSentence/Sentence#1

  原文（一字一句、30文字、独立抽出で照合済み）:
  「次の各号のいずれかに該当する者は、十万円以下の過料に処する。」

  規範単位（EFFECT）:
    - 適用条件: 次の各号のいずれかに該当する者 → eligible (caller-established)
    - 法的効果: 十万円以下の過料 → fine ≤ penaltyCeilingYen
  各号の具体的区分（第三・四・七・十一・十二条違反等）は当該規範単位外で
  caller-established とし、ここではモデル化しない。
-/
namespace JapanTaxLaw.TaxAccountantFine

/-- 原文「十万円」。過料の上限（円）。 -/
def penaltyCeilingYen : Nat := 100_000

/-- 原文の法的効果。該当者に対して上限以下の過料を課すことができる。
    `eligible` は原文「各号のいずれかに該当する」の判定を caller が確定した値。 -/
def mayImposeFine (eligible : Bool) (fineYen : Nat) : Bool :=
  eligible && decide (fineYen <= penaltyCeilingYen)

theorem penaltyCeilingYen_pos : 0 < penaltyCeilingYen := by decide

/-- 境界: 上限ちょうどは許容。 -/
theorem permits_at_ceiling : mayImposeFine true 100_000 = true := by decide

/-- 境界: 上限を一円でも超えると不可。 -/
theorem rejects_above_ceiling : mayImposeFine true 100_001 = false := by decide

/-- 該当者でなければ本条による過料は課されない。 -/
theorem rejects_non_eligible : mayImposeFine false 0 = false := by decide

/-- 上限以下なら一般に許容（有限検査ではない）。 -/
theorem within_ceiling_sufficient {fine : Nat} (h : fine <= penaltyCeilingYen) :
    mayImposeFine true fine = true := by
  simp [mayImposeFine, h]

/-- 許容されるなら必ず上限以下（必要条件）。 -/
theorem within_ceiling_necessary {fine : Nat}
    (h : mayImposeFine true fine = true) : fine <= penaltyCeilingYen := by
  simp [mayImposeFine] at h
  exact h

end JapanTaxLaw.TaxAccountantFine
